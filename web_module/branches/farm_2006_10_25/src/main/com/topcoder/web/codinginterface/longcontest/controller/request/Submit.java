package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.io.StringReader;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.server.ejb.DBServices.DBServices;
import com.topcoder.server.ejb.DBServices.DBServicesLocator;
import com.topcoder.server.ejb.TestServices.CompilationTimeoutException;
import com.topcoder.server.ejb.TestServices.TestServices;
import com.topcoder.server.ejb.TestServices.TestServicesLocator;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.PythonLanguage;
import com.topcoder.shared.language.VBLanguage;
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
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.longcompresult.LongCompResult;
import com.topcoder.web.ejb.longcompresult.LongCompResultLocal;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;

/**
 * Allows a coder to submit code for a round.
 *
 * @author farsight
 * @version 1.0
 */
public class Submit extends Base {

    private static final String NEAR_END =
            "Note: There are less than " + Constants.SUBMISSION_RATE / 60 + " hours remaining in this event.  " +
                    "If you make\na full submission at any point between now and the end of the event\nyou will " +
                    "not be able to make any further full subimssions for\nthe duration of the event.";

    protected void longContestProcessing() throws TCWebException {
        TCRequest request = getRequest();

        // The user must be signed in to submit code
        if (!SecurityHelper.hasPermission(getUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        // Get the user's id
        long uid = getUser().getId();

        try {

            // Get the query parameters
            long cid = Long.parseLong(getParameter(request, Constants.COMPONENT_ID));
            long rid = Long.parseLong(getParameter(request, Constants.ROUND_ID));
            long cd = Long.parseLong(getParameter(request, Constants.CONTEST_ID));
            boolean examplesOnly = "true".equals(getParameter(request, Constants.EXAMPLES_ONLY));
            log.debug("the examples only flag is " + examplesOnly);
            String action = getParameter(request, Constants.ACTION_KEY);
            String code = getParameter(request, Constants.CODE);
            String message = getParameter(request, Constants.MESSAGE);

            if (!acceptingSubmissions(cid)) {
                throw new NavigationException("Sorry, we are currently not accepting submissions.");
            }

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

            boolean practiceRound = (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID ||
                    roundTypeID == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID);

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
                Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
                language = coder.getLanguageId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME);
            }

            if (language > 0) {
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
            for (int i = (methodCount > 1 ? 1 : 0); i < methodCount; i++) {
                methodNames.add(pc.getAllMethodNames()[i]);
                log.debug("adding return type : " + pc.getAllReturnTypes()[i].getDescriptor(language));
                returnTypes.add(pc.getAllReturnTypes()[i].getDescriptor(language));
                DataType args[] = pc.getAllParamTypes()[i];
                StringBuffer argTypes = new StringBuffer();
                for (int j = 0; j < args.length; j++) {
                    if (j > 0) {
                        argTypes.append(", ");
                    }
                    argTypes.append(new DataTypeRenderer(args[j]).toPlainText(BaseLanguage.getLanguage(language > 0 ? language : JavaLanguage.ID)));
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
                }
                log.debug("set message in request to " + message);
                request.setAttribute(Constants.LANGUAGES, getLanguages(roundTypeID));
                setNextPage(Constants.SUBMISSION_JSP);
                if (isNearEnd(rid)) {
                    request.setAttribute(Constants.MESSAGE, message != null ? message + "\n\n" : "" + NEAR_END);
                } else {
                    request.setAttribute(Constants.MESSAGE, message);
                }
                setIsNextPageInContext(true);
            } else if (action.equals("submit")) { // user is submiting code

                // Language specified?
                if (language <= 0) {
                    log.debug("set message in request to please select a language");
                    request.setAttribute(Constants.MESSAGE, "Please select a language.");
                    request.setAttribute(Constants.LANGUAGES, getLanguages(roundTypeID));
                    setNextPage(Constants.SUBMISSION_JSP);
                    setIsNextPageInContext(true);
                    return;
                } else if ("".equals(StringUtils.checkNull(code).trim())) {
                    request.setAttribute(Constants.MESSAGE, "Please include some code.");
                    request.setAttribute(Constants.LANGUAGES, getLanguages(roundTypeID));
                    setNextPage(Constants.SUBMISSION_JSP);
                    setIsNextPageInContext(true);
                    return;
                }


                ResultSetContainer lastExampleCompilation =
                        (ResultSetContainer) m.get("long_contest_recent_example_compilation");

                ThrottleResult tRes;
                if (examplesOnly) {
                    tRes = getMessage(lastExampleCompilation, true);
                } else {
                    tRes = getMessage(lastCompilation, false);
                }
                if (tRes.isOnHold()) {
                    request.setAttribute(Constants.CODE, code);
                    if (language > 0) {
                        setDefault(Constants.LANGUAGE_ID, String.valueOf(language));
                    }
                    request.setAttribute(Constants.LANGUAGES, getLanguages(roundTypeID));
                    request.setAttribute(Constants.MESSAGE, tRes.getMessage());
                    setNextPage(Constants.SUBMISSION_JSP);
                    setIsNextPageInContext(true);
                    return;
                }

                // The request info for the compiler
                if (code == null) {
                    log.debug("********************* code is null ***********************");
                }
                //todo bad, those should all be long
                LongCompileRequest lcr = new LongCompileRequest(uid, cid, rid, cd,
                        language, com.topcoder.shared.util.ApplicationServer.WEB_SERVER_ID, code, examplesOnly);

                LongCompResultLocal longCompResult = (LongCompResultLocal) createLocalEJB(getInitialContext(), LongCompResult.class);
                if (!longCompResult.exists(rid, getUser().getId(), DBMS.OLTP_DATASOURCE_NAME)) {
                    longCompResult.createLongCompResult(rid, getUser().getId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    longCompResult.setAttended(rid, getUser().getId(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
                }
                try {
                    lock();
                    
                    LongCompileResponse res = null;
                    try {
                        //Tell the user that the code is compiling...
                        showProcessingPage();
                        
                        res = TestServicesLocator.getService().submitLong(lcr);
                    } catch (ServerException e) {
                        if (e.getCause() != null) {
                            throw (Exception) e.getCause();
                        }
                        throw e;
                    } finally { 
                        unlock();
                    }
    
                    // Records errors and other info
                    if (res.getCompileStatus()) { // everything went ok! :)
                        closeProcessingPage(buildProcessorRequestString("SubmitSuccess",
                                new String[]{Constants.ROUND_ID}, new String[]{String.valueOf(rid)}));
                    } else { // Compilation errors!
                        // Save temp variables into session
                        request.getSession().setAttribute(Constants.CODE, code);
                        request.getSession().setAttribute(Constants.LANGUAGE_ID, String.valueOf(language));
                        log.debug("set message in session to " + res.getCompileError());
                        if (isNearEnd(rid)) {
                            request.getSession().setAttribute(Constants.MESSAGE, res.getCompileError() + "\n\n"
                                    + NEAR_END);
                        } else {
                            request.getSession().setAttribute(Constants.MESSAGE, res.getCompileError());
                        }
                        // Go back to coding.
                        closeProcessingPage(buildProcessorRequestString("Submit",
                                new String[]{Constants.ROUND_ID, Constants.CONTEST_ID, Constants.COMPONENT_ID, Constants.LANGUAGE_ID},
                                new String[]{String.valueOf(rid), String.valueOf(cd), String.valueOf(cid), String.valueOf(language)}));
                    }
                } catch (CompilationTimeoutException e) {
                    log.debug("compilation timed out...");
                    // The compilation timed out
                    log.debug("set message in session to code compilation request timed out");
                    if (isNearEnd(rid)) {
                        request.getSession().setAttribute(Constants.MESSAGE, "Your code compilation request timed out.\n\n"
                                + NEAR_END);
                    } else {
                        request.getSession().setAttribute(Constants.MESSAGE, message);
                    }

                    request.getSession().setAttribute(Constants.CODE, code);
                    request.getSession().setAttribute(Constants.LANGUAGE_ID, String.valueOf(language));
                    // Go back to coding.
                    closeProcessingPage(buildProcessorRequestString("Submit",
                            new String[]{Constants.ROUND_ID, Constants.CONTEST_ID, Constants.COMPONENT_ID, Constants.LANGUAGE_ID},
                            new String[]{String.valueOf(rid), String.valueOf(cd), String.valueOf(cid), String.valueOf(language)}));
                } catch (ServerBusyException sbe) {
                    throw new NavigationException("A submit request is already being processed.");
                }
            } else if (action.equals("save")) { // user is saving code
                boolean res = saveCode(code, language, uid, cd, rid, cid);

                if (res) {
                    // save complete
                    // go back to coding!
                    log.debug("set message in request to successful save");
                    if (isNearEnd(rid)) {
                        request.setAttribute(Constants.MESSAGE, "Your code has been saved.\n\n" + NEAR_END);
                    } else {
                        request.setAttribute(Constants.MESSAGE, "Your code has been saved.");
                    }
                    request.setAttribute(Constants.LANGUAGES, getLanguages(roundTypeID));
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

    private boolean isNearEnd(long roundId) throws Exception {
        log.debug("isNearEnd called on round: " + roundId);
        ResultSetContainer rsc = getRoundInfo(roundId);
        if (rsc.getIntItem(0, "round_type_id") == Constants.LONG_PRACTICE_ROUND_TYPE_ID ||
                rsc.getIntItem(0, "round_type_id") == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
            return false;
        } else {
            long end = rsc.getTimestampItem(0, "end_time").getTime();
            long curr = System.currentTimeMillis();
            long diff = Constants.SUBMISSION_RATE * 60 * 1000;
            log.debug("end: " + end + " curr: " + curr + " diff: " + diff);
            return (end - curr) < diff;
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
        DBServices dbs = DBServicesLocator.getService();


        if (!dbs.isLongComponentOpened((int) uid, (int) rid, (int) cid))
        { // Is there a record of the user opening the problem?
            dbs.coderOpenLongComponent((int) uid, (int) cd, (int) rid, (int) cid);
        }

        // Find the TestServices bean so we could save the code.
        TestServices ts = TestServicesLocator.getService();

        // Save the code!
        return ts.saveLongComponent(cd, rid, cid, uid, code, lang).isSuccess();

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
    protected static List getLanguages(int roundType) {
        List ret = new ArrayList(4);
        ret.add(JavaLanguage.JAVA_LANGUAGE);
        ret.add(CPPLanguage.CPP_LANGUAGE);
        ret.add(VBLanguage.VB_LANGUAGE);
        ret.add(CSharpLanguage.CSHARP_LANGUAGE);
        if (roundType == Constants.LONG_PRACTICE_ROUND_TYPE_ID || roundType == Constants.LONG_ROUND_TYPE_ID) {
            ret.add(PythonLanguage.PYTHON_LANGUAGE);
        }
        return ret;
    }

    private boolean acceptingSubmissions(long componentId) throws Exception {
        Request r = new Request();
        r.setContentHandle("long_contest_accept_submissions");
        r.setProperty(Constants.COMPONENT_ID, String.valueOf(componentId));
        return !((ResultSetContainer) getDataAccess().getData(r).get("long_contest_accept_submissions")).isEmpty();
    }

    private ThrottleResult getMessage(ResultSetContainer lastCompilation, boolean examplesOnly) {
        StringBuffer buf = null;
        if (!lastCompilation.isEmpty()) {
            long lastSubmit = lastCompilation.getItem(0, "submit_time").getResultData() == null ? 0 : lastCompilation.getLongItem(0, "submit_time");
            long now = System.currentTimeMillis();
            long nextSubmit;
            if (examplesOnly) {
                nextSubmit = lastSubmit + Constants.EXAMPLE_SUBMISSION_RATE * 60 * 1000;
            } else {
                nextSubmit = lastSubmit + Constants.SUBMISSION_RATE * 60 * 1000;
            }
            log.debug("now " + now + " last: " + lastSubmit + " diff: " + (now - lastSubmit) + " examplesonly " + examplesOnly);
            long minutes = 0;
            long seconds = 0;
            if (now < nextSubmit) {
                minutes = (nextSubmit - now) / (60 * 1000);
                seconds = (nextSubmit - now - (minutes * 60 * 1000)) / 1000;
            }
            if (minutes > 0 || seconds > 0) {
                buf = new StringBuffer(100);
                buf.append("Sorry, you may not ");
                buf.append(examplesOnly ? "test" : "submit");
                buf.append(" again for another");
                if (minutes > 1) {
                    buf.append(" ");
                    buf.append(minutes);
                    buf.append(" minutes");
                } else if (minutes == 1) {
                    buf.append(" minute");
                }
                if (minutes > 0 && seconds > 0) {
                    buf.append(" and");
                }
                if (seconds > 1) {
                    buf.append(" ");
                    buf.append(seconds);
                    buf.append(" seconds");
                } else if (seconds == 1) {
                    buf.append(" ");
                    buf.append(seconds);
                    buf.append(" second");
                }
            }
        }
        if (buf == null) {
            return new ThrottleResult(false, null);
        } else {
            return new ThrottleResult(true, buf.toString());
        }
    }

    private static class ThrottleResult {
        private boolean onHold;
        private String message;

        ThrottleResult(boolean onHold, String message) {
            this.onHold = onHold;
            this.message = message;
        }

        public boolean isOnHold() {
            return onHold;
        }

        public void setOnHold(boolean onHold) {
            this.onHold = onHold;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }

}
