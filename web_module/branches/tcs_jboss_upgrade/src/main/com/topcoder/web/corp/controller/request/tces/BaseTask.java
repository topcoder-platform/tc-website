package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.WebAuthentication;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


/**
 * A basic implementation of Task.
 * @author bigjake <kitz@mit.edu>
 * @author swif0ne <dancohn1@yahoo.com>
 * @version $Revision$
 */

public abstract class BaseTask implements Task {

    private static Logger log = Logger.getLogger(BaseTask.class);
    private static final int TRANSACTIONAL_DB_TYPE = 2;
    private static final int DW_DB_TYPE = 3;

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

    /**
     * returns the transactional database to be used for the
     * authenticated user.  if it's not in the database,
     * we'll return a default.
     * @return
     * @throws java.lang.Exception
     */
    protected String getOltp() throws Exception {
        String ret = getDb(TRANSACTIONAL_DB_TYPE);
        if (ret == null) {
            ret = DBMS.OLTP_DATASOURCE_NAME;
        }
        return ret;
    }

    /**
     * returns the datawarehouse database to be used for
     * the authenticated user.  if it's not in the database
     * we'll return a default
     * @return
     * @throws java.lang.Exception
     */
    protected String getDw() throws Exception {
        String ret = getDb(DW_DB_TYPE);
        if (ret == null) {
            ret = DBMS.DW_DATASOURCE_NAME;
        }
        return ret;
    }

    private String getDb(int type) throws Exception {
        Request r = new Request();
        r.setContentHandle("contact_datasource");
        r.setProperty("uid", String.valueOf(getAuthenticityToken().getActiveUser().getId()));
        r.setProperty("dstid", String.valueOf(type));
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("contact_datasource");
        String ret = null;
        if (!(rsc == null || rsc.isEmpty())) {
            ret = rsc.getStringItem(0, "datasource_name");
        }
        return ret;
    }


    protected static DataAccessInt getDataAccess(String db) throws Exception {
        return getDataAccess(db, false);
    }

    protected static DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null)
            throw new IllegalArgumentException("datasource name is null.");
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

    protected boolean isRestrictedCampaign(long campaignId) throws Exception {
        Request r = new Request();
        r.setContentHandle("restricted_campaign");
        r.setProperty("cid", String.valueOf(campaignId));
        return !((ResultSetContainer) getDataAccess(getOltp()).getData(r).get("restricted_campaign")).isEmpty();
    }

    protected String getRoundList(long campaignId) throws Exception {
        StringBuffer buf = new StringBuffer();
        List l = getRoundIds(campaignId);
        int i = 0;
        for (Iterator it = l.iterator(); it.hasNext(); i++) {
            buf.append(it.next().toString());
            buf.append(", ");
        }
        if (i > 0)
            buf.setLength(buf.length() - 2);
        log.debug("round list is " + buf.toString());
        return buf.toString();

    }

    protected List getRoundIds(long campaignId) throws Exception {
        Request r = new Request();
        r.setContentHandle("campaign_rounds");
        r.setProperty("cid", String.valueOf(campaignId));
        ResultSetContainer rsc = ((ResultSetContainer) getDataAccess(getOltp()).getData(r).get("campaign_rounds"));
        ArrayList ret = new ArrayList(rsc.size());
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret.add(new Long(row.getLongItem("round_id")));
        }
        return ret;
    }

}
