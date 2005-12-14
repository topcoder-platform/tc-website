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
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;

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
            int cid = Integer.parseInt(getParameter(request, Constants.COMPONENT_ID));
            int rid = Integer.parseInt(getParameter(request, Constants.ROUND_ID));
            int cd = Integer.parseInt(getParameter(request, Constants.CONTEST_ID));
            int language = 0;
            if (getParameter(request, Constants.LANGUAGE_ID) != null) {
                language = Integer.parseInt(getParameter(request, Constants.LANGUAGE_ID));
                setDefault(Constants.LANGUAGE_ID, String.valueOf(language));
            }
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

            int roundTypeID = ((ResultSetContainer) m.get("long_contest_round_information")).getIntItem(0, "round_type_id");
            boolean practiceRound = (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID);

            // If the user is not registered s/he cannot submit code, unless this is a practice round.
            if (!practiceRound && !isUserRegistered(uid, rid)) {
                throw new NavigationException("User not registered for contest.");
            }

            // Check to make sure the contest has begun and is not over, unless this is a practice round.
            boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
            boolean over = ((ResultSetContainer) m.get("long_contest_over")).getBooleanItem(0, 0);
            if (!started) {
                throw new NavigationException("The contest has not started yet.");
            }
            if (!practiceRound && over) {
                throw new NavigationException("The contest is over.");
            }

            // These are the available programming languages
            ResultSetContainer rscCompText = (ResultSetContainer) m.get("long_problem_xml");
            if (rscCompText.size() == 0) {
                throw new NavigationException("Cannot find problem statement.");
            }

            String problemText = rscCompText.getStringItem(0, "component_text");
            StringReader reader = new StringReader(problemText);
            ProblemComponent pc = new ProblemComponentFactory().buildFromXML(reader, true);

            // The class name for this problem
            String className = pc.getClassName();
            int methodCount = pc.getAllMethodNames().length;
            ArrayList methodNames = new ArrayList(methodCount);
            ArrayList returnTypes = new ArrayList(methodCount);
            ArrayList paramTypes = new ArrayList(methodCount);
            log.debug("there are " + methodCount + " methods in this problem");
            log.debug("there are " + returnTypes.size() + " return types in this problem");
            for (int i=(methodCount>1?1:0); i<methodCount; i++) {
                methodNames.add(pc.getAllMethodNames()[i]);
                returnTypes.add(pc.getAllReturnTypes()[i].getDescriptor(language));
                DataType args[] = pc.getAllParamTypes()[i];
                StringBuffer argTypes = new StringBuffer();
                for (int j = 0; j < args.length; j++) {
                    if (argTypes.length() > 0) argTypes.append(", ");
                    argTypes.append(args[j].getDescription());
                }
                paramTypes.add(argTypes);

            }
            // Put these objects into request scope
            request.setAttribute(Constants.CLASS_NAME, className);
            request.setAttribute(Constants.METHOD_NAME, methodNames);
            request.setAttribute(Constants.RETURN_TYPE, returnTypes);
            request.setAttribute(Constants.ARG_TYPES, paramTypes);

            request.setAttribute(Constants.CODE, code);
            request.setAttribute(Constants.LANGUAGE_ID, String.valueOf(language));

            if (action == null) { // no action specified
                // any code in session?
                if (code == null) { // try and load the most recent code
                    ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_recent_compilation");
                    // default values
                    code = "";
                    // Any code in the DB?
                    if (rsc.size() > 0) {
                        code = rsc.getStringItem(0, "compilation_text");
                        if (!isNull(rsc, 0, "language_id")) {
                            language = rsc.getIntItem(0, "language_id");
                        }
                    }
                    // put the updated values back into request
                    request.setAttribute(Constants.CODE, code);
                    if (language>0) {
                        request.setAttribute(Constants.LANGUAGE_ID, String.valueOf(language));
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

                // The request info for the compiler
                LongCompileRequest lcr = new LongCompileRequest((int) uid, cid, rid, cd, language, ApplicationServer.WEB_SERVER_ID, code);

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
                boolean res = saveCode(code, language, (int) uid, cd, rid, cid);

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
    private boolean saveCode(String code, int lang, int uid, int cd, int rid, int cid) throws Exception {
        log.debug("saveCode called... lang=" + lang + " uid=" + uid + " cd=" + cd + " rid=" + rid + " cid=" + cid);

        // Find the DB_Services bean so we could set the problem state to open before saving the code.
        InitialContext ctx = getInitialContext();
        DBServicesHome dbsHome = (DBServicesHome) ctx.lookup(ApplicationServer.DB_SERVICES);
        DBServices dbs = dbsHome.create();

        if (!dbs.isComponentOpened(uid, rid, cid)) { // Is there a record of the user opening the problem?
            dbs.coderOpenComponent(uid, cd, rid, 0, cid);
        }

        // Find the TestServices bean so we could save the code.
        TestServicesHome t = (TestServicesHome) ctx.lookup(ApplicationServer.TEST_SERVICES);
        TestServices ts = t.create();

        // Save the code!
        return ts.saveComponent(cd, rid, cid, uid, code, lang).isSuccess();

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
