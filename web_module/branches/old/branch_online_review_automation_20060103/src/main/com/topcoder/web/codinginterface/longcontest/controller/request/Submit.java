package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.server.ejb.DBServices.DBServices;
import com.topcoder.server.ejb.DBServices.DBServicesHome;
import com.topcoder.server.ejb.TestServices.TestServices;
import com.topcoder.server.ejb.TestServices.TestServicesHome;
import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.*;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;
import com.topcoder.web.ejb.coder.Coder;

import javax.naming.InitialContext;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Allows a coder to submit code for a round.
 *
 * @author farsight
 * @version 1.0
 */
public class Submit extends Base {

    protected void longContestProcessing() throws TCWebException {
        TCRequest request = getRequest();

        // The user must be signed in to submit code
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        // Get the user's id
        long uid = getUser().getId();

        try {

            // Get the query parameters
            long cid = Long.parseLong(getParameter(request, Constants.COMPONENT_ID));
            long rid = Long.parseLong(getParameter(request, Constants.ROUND_ID));
            long cd = Long.parseLong(getParameter(request, Constants.CONTEST_ID));
            String action = getParameter(request, Constants.ACTION_KEY);
            String code = getParameter(request, Constants.CODE);
            String message = getParameter(request, Constants.MESSAGE);

            // Clear session of temp variables
            cleanSession();

            // Build the request to get submission related data
            Request r = new Request();
            r.setContentHandle("long_submission");
            r.setProperty(Constants.CODER_ID, String.valueOf(uid));
            r.setProperty(Constants.COMPONENT_ID, String.valueOf(cid));
            r.setProperty(Constants.ROUND_ID, String.valueOf(rid));

            // Data source
            DataAccessInt dataAccess = getDataAccess(false);

            // Fetch request
            Map m = dataAccess.getData(r);

            ResultSetContainer info = getRoundInfo(rid);

            int roundTypeID = info.getIntItem(0, "round_type_id");

            boolean practiceRound = (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID);

            // If the user is not registered s/he cannot submit code, unless this is a practice round.
            if (!practiceRound && !isUserRegistered(uid, rid)) {
                throw new NavigationException("User not registered for contest.");
            }

            // Check to make sure the contest has begun and is not over, unless this is a practice round.
            boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
            if (!started) {
                throw new NavigationException("The contest has not started yet.");
            }
            if (!practiceRound && isRoundOver(rid)) {
                throw new NavigationException("The contest is over.");
            }

            ResultSetContainer rscCompText = (ResultSetContainer) m.get("long_problem_xml");
            if (rscCompText.size() == 0) {
                throw new NavigationException("Cannot find problem statement.");
            }

            String problemText = rscCompText.getStringItem(0, "component_text");
            StringReader reader = new StringReader(problemText);
            ProblemComponent pc = new ProblemComponentFactory().buildFromXML(reader, true);

            ResultSetContainer lastCompilation = (ResultSetContainer) m.get("long_contest_recent_compilation");
            int language = 0;
            if (getParameter(request, Constants.LANGUAGE_ID) != null) {
                language = Integer.parseInt(getParameter(request, Constants.LANGUAGE_ID));
                setDefault(Constants.LANGUAGE_ID, String.valueOf(language));
            } else if (!lastCompilation.isEmpty()) {
                if (!isNull(lastCompilation, 0, "language_id")) {
                    language = lastCompilation.getIntItem(0, "language_id");
                }
            } else {
                //load up their default language
                Coder coder = (Coder)createEJB(getInitialContext(), Coder.class);
                language = coder.getLanguageId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME);
            }

            if (language>0) {
                setDefault(Constants.LANGUAGE_ID, String.valueOf(language));
                getRequest().setAttribute(Constants.LANGUAGE_ID, String.valueOf(language));
            }

            // The class name for this problem
            String className = pc.getClassName();
            int methodCount = pc.getAllMethodNames().length;
            ArrayList methodNames = new ArrayList(methodCount);
            ArrayList returnTypes = new ArrayList(methodCount);
            ArrayList paramTypes = new ArrayList(methodCount);
            log.debug("there are " + methodCount + " methods in this problem");
            for (int i=(methodCount>1?1:0); i<methodCount; i++) {
                methodNames.add(pc.getAllMethodNames()[i]);
                log.debug("adding return type : " + pc.getAllReturnTypes()[i].getDescriptor(language));
                returnTypes.add(pc.getAllReturnTypes()[i].getDescriptor(language));
                DataType args[] = pc.getAllParamTypes()[i];
                StringBuffer argTypes = new StringBuffer();
                for (int j = 0; j < args.length; j++) {
                    if (j > 0) {
                        argTypes.append(", ");
                    }
                    argTypes.append(new DataTypeRenderer(args[j]).toPlainText(BaseLanguage.getLanguage(language>0?language:JavaLanguage.ID)));
                }
                paramTypes.add(argTypes.toString());

            }
            log.debug("there are " + returnTypes.size() + " return types in this problem");
            // Put these objects into request scope
            request.setAttribute(Constants.CLASS_NAME, className);
            request.setAttribute(Constants.METHOD_NAME, methodNames);
            request.setAttribute(Constants.RETURN_TYPE, returnTypes);
            request.setAttribute(Constants.ARG_TYPES, paramTypes);

            request.setAttribute(Constants.CODE, code);

            if (action == null) { // no action specified
                // any code in session?
                if (code == null) { // try and load the most recent code
                    code = "";
                    // Any code in the DB?
                    if (!lastCompilation.isEmpty()) {
                        code = lastCompilation.getStringItem(0, "compilation_text");
                    }
                    // put the updated values back into request
                    request.setAttribute(Constants.CODE, code);
                    if (language>0) {
                    }
                }
                log.debug("set message in request to " + message);
                request.setAttribute(Constants.LANGUAGES, getLanguages());
                request.setAttribute(Constants.MESSAGE, message);
                setNextPage(Constants.SUBMISSION_JSP);
                setIsNextPageInContext(true);
            } else if (action.equals("submit")) { // user is submiting code

                // Language specified?
                if (language <= 0) {
                    log.debug("set message in request to please select a language");
                    request.setAttribute(Constants.MESSAGE, "Please select a language.");
                    request.setAttribute(Constants.LANGUAGES, getLanguages());
                    setNextPage(Constants.SUBMISSION_JSP);
                    setIsNextPageInContext(true);
                    return;
                }


                //todo if we got a cray to do testing, we can take the limit off for practice rounds
                if (!lastCompilation.isEmpty()) {
                    long lastSubmit = lastCompilation.getItem(0, "submit_time").getResultData()==null?0:lastCompilation.getLongItem(0, "submit_time");
                    long now = System.currentTimeMillis();
                    long nextSubmit = lastSubmit +Constants.SUBMISSION_RATE*60*1000;
                    log.debug("now " + now + " last: " + lastSubmit + " diff: " + (now-lastSubmit));
                    if (now<nextSubmit) {
                        long minutes = (nextSubmit-now)/(60*1000);
                        long seconds = (nextSubmit-now-(minutes*60*1000))/1000;
                        StringBuffer buf = new StringBuffer(100);
                        buf.append("Sorry, you may not submit again for another");
                        if (minutes > 1) {
                            buf.append(" ");
                            buf.append(minutes);
                            buf.append(" minutes");
                        } else if (minutes==1) {
                            buf.append(" minute");
                        }
                        if(minutes>0&&seconds>0) {
                            buf.append(" and");
                        }
                        if (seconds>1) {
                            buf.append(" ");
                            buf.append(seconds);
                            buf.append(" seconds");
                        } else if (seconds==1) {
                            buf.append(" ");
                            buf.append(seconds);
                            buf.append(" second");
                        }
                        request.setAttribute(Constants.CODE, code);
                        if (language>0) {
                            setDefault(Constants.LANGUAGE_ID, String.valueOf(language));
                        }
                        request.setAttribute(Constants.LANGUAGES, getLanguages());
                        request.setAttribute(Constants.MESSAGE, buf.toString());
                        setNextPage(Constants.SUBMISSION_JSP);
                        setIsNextPageInContext(true);
                        return;
                    }
                }

                // The request info for the compiler
                if (code==null) {
                    log.debug("********************* code is null ***********************");
                }
                //todo bad, those should all be long
                LongCompileRequest lcr = new LongCompileRequest((int) uid, (int)cid, (int)rid, (int)cd,
                        language, ApplicationServer.WEB_SERVER_ID, code);

                try {
                    // Send the request!
                    send(lcr);
                } catch (ServerBusyException sbe) {
                    throw new NavigationException("A submit request is already being processed.");
                }

                // Tell the user that the code is compiling...
                showProcessingPage();

                try {

                    // Get the compilation response
                    LongCompileResponse res = receive(30 * 1000, uid, cid);

                    // Records errors and other info
                    if (res.getCompileStatus()) { // everything went ok! :)
                        closeProcessingPage(buildProcessorRequestString("SubmitSuccess",
                                new String[]{Constants.ROUND_ID}, new String[]{String.valueOf(rid)}));
                    } else { // Compilation errors!
                        // Save temp variables into session
                        request.getSession().setAttribute(Constants.CODE, code);
                        request.getSession().setAttribute(Constants.LANGUAGE_ID, String.valueOf(language));
                        log.debug("set message in session to " + res.getCompileError());
                        request.getSession().setAttribute(Constants.MESSAGE, res.getCompileError());
                        // Go back to coding.
                        closeProcessingPage(buildProcessorRequestString("Submit",
                                new String[]{Constants.ROUND_ID, Constants.CONTEST_ID, Constants.COMPONENT_ID, Constants.LANGUAGE_ID},
                                new String[]{String.valueOf(rid), String.valueOf(cd), String.valueOf(cid), String.valueOf(language)}));
                    }
                } catch (TimeOutException e) {
                    log.debug("compilation timed out...");
                    // The compilation timed out
                    log.debug("set message in session to code compilation request timed out");
                    request.getSession().setAttribute(Constants.MESSAGE, "Your code compilation request timed out.");
                    // Go back to coding.
                    closeProcessingPage(buildProcessorRequestString("Submit",
                            new String[]{Constants.ROUND_ID, Constants.CONTEST_ID, Constants.COMPONENT_ID, Constants.LANGUAGE_ID},
                            new String[]{String.valueOf(rid), String.valueOf(cd), String.valueOf(cid), String.valueOf(language)}));
                }

            } else if (action.equals("save")) { // user is saving code
                boolean res = saveCode(code, language, uid, cd, rid, cid);

                if (res) {
                    // save complete
                    // go back to coding!
                    log.debug("set message in request to successful save");
                    request.setAttribute(Constants.MESSAGE, "Your code has been saved.");
                    request.setAttribute(Constants.LANGUAGES, getLanguages());
                    setNextPage(Constants.SUBMISSION_JSP);
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Your code cannot be saved at this time.");
                }
            }
        } catch (TCWebException e) {
            log.error("Unexpected error in code submit module.", e);
            throw e;
        } catch (Exception e) {
            log.error("Unexpected error in code submit module.", e);
            throw new TCWebException("An error occurred while compiling your code", e);
        }
    }

    // Checks whether the specified field is null.
    private boolean isNull(ResultSetContainer r, int row, String colName) {
        return r.getItem(row, colName).getResultData() == null;
    }

    // Removes junk session variables that this class put into session
    private void cleanSession() {
        log.debug("Clearing submit session variables...");
        getRequest().getSession().removeAttribute(Constants.LANGUAGES);
        getRequest().getSession().removeAttribute(Constants.CLASS_NAME);
        getRequest().getSession().removeAttribute(Constants.CODE);
        getRequest().getSession().removeAttribute(Constants.MESSAGE);
    }

    /**
     * Looks for the attribute in the request first, and then the session.
     *
     * @param request The request object
     * @param key     The parameter key
     * @return The value for the specified parameter
     */
    public String getParameter(TCRequest request, String key) {
        String val = request.getParameter(key);
        if (val == null) val = (String) request.getSession().getAttribute(key);
        return val;
    }

    // Save the user's code into the database
    private boolean saveCode(String code, int lang, long uid, long cd, long rid, long cid) throws Exception {
        log.debug("saveCode called... lang=" + lang + " uid=" + uid + " cd=" + cd + " rid=" + rid + " cid=" + cid);

        // Find the DB_Services bean so we could set the problem state to open before saving the code.
        InitialContext ctx = getInitialContext();
        DBServicesHome dbsHome = (DBServicesHome) ctx.lookup(ApplicationServer.DB_SERVICES);
        DBServices dbs = dbsHome.create();

        if (!dbs.isComponentOpened((int)uid, (int)rid, (int)cid)) { // Is there a record of the user opening the problem?
            dbs.coderOpenComponent((int)uid, (int)cd, (int)rid, 0, (int)cid);
        }

        // Find the TestServices bean so we could save the code.
        TestServicesHome t = (TestServicesHome) ctx.lookup(ApplicationServer.TEST_SERVICES);
        TestServices ts = t.create();

        // Save the code!
        return ts.saveComponent((int)cd, (int)rid, (int)cid, (int)uid, code, lang).isSuccess();

    }

    // Checks to see if the user is registered for this round contest.
    protected boolean isUserRegistered(long userID, long roundID) throws Exception {
        boolean ret = false;
        try {
            RoundRegistration reg = (RoundRegistration) createEJB(getInitialContext(), RoundRegistration.class);
            ret = reg.exists(userID, roundID);
        } catch (Exception e) {
            log.error("Error isUserRegistered user: " + userID + " for round: "
                    + roundID, e);
            throw e;
        }
        return ret;
    }


    //todo this may need to be modified if in the future we limit which languages are available
    protected static List getLanguages() {
        List ret = new ArrayList(4);
        ret.add(JavaLanguage.JAVA_LANGUAGE);
        ret.add(CPPLanguage.CPP_LANGUAGE);
        ret.add(VBLanguage.VB_LANGUAGE);
        ret.add(CSharpLanguage.CSHARP_LANGUAGE);
        return ret;
    }

}
