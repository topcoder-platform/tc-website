package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.StringTokenizer;
import java.util.List;

import com.topcoder.shared.security.User;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.TCESAuthorization;


/**
 * A basic implementation of Task.
 * @author bigjake <kitz@mit.edu>
 * @author swif0ne <dancohn1@yahoo.com>
 * @version 1.2.8.7
 */

public abstract class BaseTask implements Task {

    private static Logger log = Logger.getLogger(BaseTask.class);

    /* Holds the InitialContext of a request being processed by this task */
    private InitialContext ctx;

    /* Holds the next page to which the controller should forward after task processing */
    private String nextPage;
    private List trail;
    private String servletPath;


    /* Authentication for getting current user or logging in/out a user */
    private WebAuthentication authToken = null;


    /* Makes a new BaseTask */
    public BaseTask() {
        setInitialContext(null);
        setNextPage(null);
        setTrail(null);
        setServletPath(null);
    }

    public abstract void processStep(String step)  throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx=ctx;
    }

    public InitialContext getInitialContext() {
        return ctx;
    }

    public void setNextPage(String nextPage) {
        this.nextPage=nextPage;
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

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
         throws Exception {

        User curUser = getAuthenticityToken().getActiveUser();
        uid = curUser.getId();

        // For testing purposes only:
        String testUser = request.getParameter("testUserId");
        if (testUser != null) {
            uid = Long.parseLong(testUser);
        }
        log.debug(getClass().className()+": User id set: "+uid);

    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

    }

    public abstract void setAttributes(String paramName, String paramValues[]);



//------------------------------
    /**
     * For request being proccessed returns user's authenticity token. Anonymous
     * users (Guests) are authentic always forever by definition however
     * there is not the way to get them logged in neither via cookies nor via
     * login page.
     *
     * @return BasicAuthentication
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

//-----------------------------


    /** Retreives and parses a date from a ResultSetRow
     * @param row Row from which the date should be retreived
     * @param key Key for the date item within row
     */
    public String getDate(ResultSetContainer.ResultSetRow row,
                                     String key) {
        String defaultVal = "00/00/0000";
        try {
            StringTokenizer tok1 = new StringTokenizer(
                    ((TCTimestampResult) row.getItem(key)).toString());
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

}

