package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.server.ejb.DBServices.DBServices;
import com.topcoder.server.ejb.DBServices.DBServicesHome;
import com.topcoder.server.ejb.TestServices.TestServices;
import com.topcoder.server.ejb.TestServices.TestServicesHome;
import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
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
            int language = Integer.parseInt((getParameter(request, Constants.SELECTED_LANGUAGE) == null ? "-1" : getParameter(request, Constants.SELECTED_LANGUAGE)));
            String action = getParameter(request, Constants.ACTION_KEY);
            String code = getParameter(request, Constants.CODE);
/*
            Boolean compStatus = ((Boolean) request.getSession().getAttribute(Constants.COMPILE_STATUS));
            String compMsg = getParameter(request, Constants.COMPILE_MESSAGE);
*/

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
            ResultSetContainer lang = (ResultSetContainer) m.get("long_languages");

            ResultSetContainer rscCompText = (ResultSetContainer) m.get("long_problem_xml");
            if (rscCompText.size() == 0) {
                throw new NavigationException("Cannot find problem statement.");
            }

            String problemText = rscCompText.getStringItem(0, "component_text");
            StringReader reader = new StringReader(problemText);
            ProblemComponent pc = new ProblemComponentFactory().buildFromXML(reader, true);

            // The class name for this problem
            String className = pc.getClassName();
            String methodName = pc.getMethodName();
            String returnType = pc.getReturnType().getDescription();
            DataType args[] = pc.getAllParamTypes()[0];

            StringBuffer argTypes = new StringBuffer();
            for (int i = 0; i < args.length; i++) {
                if (argTypes.length() > 0) argTypes.append(", ");
                argTypes.append(args[i].getDescription());
            }

            // Put these objects into request scope
            request.setAttribute(Constants.LANGUAGES, lang);
            request.setAttribute(Constants.CLASS_NAME, className);
            request.setAttribute(Constants.METHOD_NAME, methodName);
            request.setAttribute(Constants.RETURN_TYPE, returnType);
            request.setAttribute(Constants.ARG_TYPES, argTypes.toString());

            request.setAttribute(Constants.CODE, code);
            request.setAttribute(Constants.SELECTED_LANGUAGE, String.valueOf(language));
/*
            request.setAttribute(Constants.COMPILE_STATUS, compStatus);
            request.setAttribute(Constants.COMPILE_MESSAGE, compMsg);
*/

            if (action == null) { // no action specified
                // any code in session?
                if (code == null) { // try and load the most recent code
                    ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_recent_compilation");
                    // default values
                    code = "";
                    language = -1;
                    // Any code in the DB?
                    if (rsc.size() > 0) {
                        code = rsc.getStringItem(0, "compilation_text");
                        if (!isNull(rsc, 0, "language_id")) {
                            language = rsc.getIntItem(0, "language_id");
                        } else {
                            language = -1;
                        }
                    }
                    // put the updated values back into request
                    request.setAttribute(Constants.CODE, code);
                    request.setAttribute(Constants.SELECTED_LANGUAGE, String.valueOf(language));
                    request.setAttribute(Constants.MESSAGE, request.getSession().getAttribute(Constants.MESSAGE));
                }
                setNextPage(Constants.SUBMISSION_JSP);
                setIsNextPageInContext(true);
            } else if (action.equals("submit")) { // user is submiting code

                // Language specified?
                if (language == -1) {
                    request.setAttribute(Constants.MESSAGE, "Please select a language.");
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
                        cleanSession();
                        // Go to standings!
                        closeProcessingPage(buildProcessorRequestString("SubmitSuccess",
                                new String[]{Constants.ROUND_ID}, new String[]{String.valueOf(rid)}));
                    } else { // Compilation errors!
                        // Save temp variables into session
                        request.getSession().setAttribute(Constants.LANGUAGES, lang);
                        request.getSession().setAttribute(Constants.CODE, code);
                        request.getSession().setAttribute(Constants.SELECTED_LANGUAGE, String.valueOf(language));
                        request.getSession().setAttribute(Constants.MESSAGE, res.getCompileError());
/*
                        request.getSession().setAttribute(Constants.COMPILE_STATUS, new Boolean(res.getCompileStatus()));
                        request.getSession().setAttribute(Constants.COMPILE_MESSAGE, htmlEncode(res.getCompileError()));
*/
                        // Go back to coding.
                        closeProcessingPage(buildProcessorRequestString("Submit",
                                new String[]{Constants.ROUND_ID, Constants.CONTEST_ID, Constants.COMPONENT_ID},
                                new String[]{String.valueOf(rid), String.valueOf(cd), String.valueOf(cid)}));
                    }
                } catch (TimeOutException e) {
                    log.debug("compilation timed out...");
                    // The compilation timed out
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
                    request.setAttribute(Constants.MESSAGE, "Your code has been saved.");
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
        getRequest().getSession().removeAttribute(Constants.SELECTED_LANGUAGE);
        getRequest().getSession().removeAttribute(Constants.MESSAGE);
/*
        getRequest().getSession().removeAttribute(Constants.COMPILE_STATUS);
        getRequest().getSession().removeAttribute(Constants.COMPILE_MESSAGE);
*/
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
        return ts.saveComponent(cd, rid, cid, uid, code).isSuccess();

/*
        if (!r.isSuccess()) { // Could not save!
            return false;
        } else { // Save the language along w/ the code...
            //todo get rid of this shit!!!!!!!
            if (lang != -1) {
                Connection conn = null;
                PreparedStatement ps = null;
                StringBuffer sqlStr = new StringBuffer(200);
                ResultSet rs = null;
                try {
                    conn = DBMS.getConnection();
                    long csid = getComponentStateID(uid, rid, cid, conn);
                    sqlStr.append("UPDATE compilation SET language_id = ? WHERE component_state_id = ?");
                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setInt(1, lang);
                    ps.setLong(2, csid);
                    ps.executeUpdate();
                } catch (Exception e) {
                    log.error("Unexpected exception in saveCode.", e);
                    throw e;
                } finally {
                    DBMS.close(conn, ps, rs);
                }
            }
        }
        return true;
*/

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

    /**
     * Helper function which gets the problemstateid for a given coder's problem
     */
/*    private long getComponentStateID(long coderId, long roundId, long componentId, Connection conn) throws SQLException {

        PreparedStatement ps = null;
        StringBuffer sqlStr = new StringBuffer(200);
        ResultSet rs = null;

        try {
            sqlStr.append("SELECT component_state_id FROM component_state ");
            sqlStr.append("WHERE round_id = ? AND component_id = ? AND coder_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setLong(1, roundId);
            ps.setLong(2, componentId);
            ps.setLong(3, coderId);
            rs = ps.executeQuery();
            if (!rs.next()) return -1;
            return rs.getLong(1);
        } finally {
            DBMS.close(null, ps, rs);
        }
    }*/
}
