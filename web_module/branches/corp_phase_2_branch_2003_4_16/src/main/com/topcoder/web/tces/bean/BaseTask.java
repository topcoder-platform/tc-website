package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.corp.model.SessionInfo;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.StringTokenizer;


/**
 * A basic implementation of Task.
 * @author bigjake <kitz@mit.edu>
 * @author swif0ne <dancohn1@yahoo.com>
 * @version $Revision$
 */

public abstract class BaseTask implements Task {

    private static Logger log = Logger.getLogger(BaseTask.class);

    /* Holds the InitialContext of a request being processed by this task */
    private InitialContext ctx;

    /* Holds next page where controller should forward after task processing */
    private String nextPage;
    private List trail;
    private String servletPath;
    private SessionInfo info;

    /* Holds the ID of the currently logged-in user */
    protected long uid;

    /* Authentication for getting current user or logging in/out a user */
    private WebAuthentication authToken = null;


    /* Makes a new BaseTask */
    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
        setTrail(null);
        setServletPath(null);
        setSessionInfo(null);
    }

    public abstract void processStep(String step) throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx = ctx;
    }

    public InitialContext getInitialContext() {
        return ctx;
    }

    public void setNextPage(String nextPage) {
        this.nextPage = nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public List getTrail() {
        return trail;
    }

    public void setTrail(List trail) {
        this.trail = trail;
    }

    public String getServletPath() {
        return servletPath;
    }

    public void setServletPath(String servletPath) {
        this.servletPath = servletPath;
    }

    public void servletPreAction(HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        User curUser = getAuthenticityToken().getActiveUser();
        uid = curUser.getId();

        log.debug("TCES Task = " + this.getClass().getName() +
                " called with user id = " + uid);

    }

    public void servletPostAction(HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {

    }

    public abstract void setAttributes(String paramName, String paramValues[]);


    /**
     * For request being proccessed returns user's authenticity token.
     *
     * @return WebAuthentication authentication token used in tasks for
     *         retrieving the current user's Id
     */
    protected WebAuthentication getAuthenticityToken() {
        return authToken;
    }

    /**
     * Just stores given authentification object for later use
     * @param auth WebAuthentication to store in authToken
     */
    public void setAuthToken(WebAuthentication auth) {
        authToken = auth;
    }


    /** Retreives and parses a date from a ResultSetRow
     * @param row Row from which the date should be retreived
     * @param key Key for the date item within row
     */
    public String getDate(ResultSetContainer.ResultSetRow row,
                          String key) {
        String defaultVal = "00/00/0000";
        try {
            StringTokenizer tok1 = new StringTokenizer(
                    (row.getItem(key)).toString());
            StringTokenizer token = new StringTokenizer(
                    (String) tok1.nextElement(), "-");

            String year = (String) token.nextElement();
            String returnString = "";
            while (token.hasMoreElements()) {
                returnString += (String) token.nextElement() + "/";
            }

            return returnString + year;
        } catch (Exception e) {
            log.debug("getDate got excepted with key=" + key);
            e.printStackTrace();

            if (defaultVal != null && defaultVal.equals("00/00/00"))
                return "00/00/0000";
            else
                return defaultVal;
        }
    }

    public SessionInfo getSessionInfo() {
        return info;
    }

    public void setSessionInfo(SessionInfo info) {
        this.info = info;
    }


}
