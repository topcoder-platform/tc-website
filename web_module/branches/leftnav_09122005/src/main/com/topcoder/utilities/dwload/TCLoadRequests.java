package com.topcoder.utilities.dwload;

/*****************************************************************************
 * TCLoadRequests.java
 *
 * TCLoadCoders loads applet requests from the RDBMS to the Data Warehouse.
 *
 * @author Matthew Lahut [TCid: Garzahd] (mlahut@andrew.cmu.edu)
 * Much thanks to Chris Hopkins [TCid: darkstalker] (chrism_hopkins@yahoo.com)
 * for the template
 * @version $Revision$
 *
 *****************************************************************************/

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

public class TCLoadRequests extends TCLoad {
    private static Logger log = Logger.getLogger(TCLoadRequests.class);
    protected java.sql.Timestamp fStartTime = null;
    protected java.sql.Timestamp fLastLogTime = null;
    protected java.sql.Timestamp fLastWebLogTime = null;
    private HashMap urlMap = new HashMap();
    private static final int WEB_REQUEST_LOAD = 5;
    private static final int REQUEST_LOAD = 3;
    private static final String[] CODER_ID_KEYS = {"cr", "uid", "mid"};
    private static final String[] ROUND_ID_KEYS = {"rd", "RoundId"};
    //since t is after c, it'll choose c over t if they're both in the query string
    private static final String[] CONTENT_IDS = {"module", "c", "task", "t"};
    private HashMap sessionMap = new HashMap();
    private HashMap calendarMap = new HashMap();
    private PreparedStatement getUrlPs = null;
    private PreparedStatement getNamePs = null;
    private PreparedStatement addSiteHitPs = null;
    private PreparedStatement createUrlPs = null;

    private final static String GET_URL =
            " select url_id" +
            " from url" +
            " where url = ?";

    private final static String GET_NAME =
            " select page_name" +
            " from url " +
            " where url = ?";

    private final static String REQUEST_LIST =
            " select user_id" +
            " , url" +
            " , session_id" +
            " , timestamp" +
            " from request" +
            " where timestamp > ?" +
            "   and timestamp <= ?";

    private final static String ADD_SITE_HIT =
            " insert into site_hit (coder_id, url_id, timestamp, session_id, calendar_id)" +
            " values (?, ?, ?, ?, ?)";

    private static final String CREATE_URL =
            " insert into url (url, coder_id, round_id, page_name) " +
            " values (?, ?, ?, ?)";

    private static final String UPDATE_LOG =
            "INSERT INTO update_log " +
            "      (log_id " +
            "       ,calendar_id " +
            "       ,timestamp " +
            "       ,log_type_id) " +
            " VALUES (0, ?, ?, ?)";

    private static final String NEWEST_REQUEST_TIME =
            " select max(timestamp) from request";

    private static final String DELETE =
            " delete from request where timestamp <= ?";


    public TCLoadRequests() {
        //DEBUG = false;
    }

    /**
     * This method is passed any parameters passed to this load
     */
    public boolean setParameters(Hashtable params) {
        return true;
    }

    /**
     * This method performs the load for the coder information tables
     */
    public void performLoad() throws Exception {
        try {
            //this should only be use for web requests, it doesn't mean anything for other
            //types of requests.
            fStartTime = getNewestTime();
/*
            fLastLogTime = getLastUpdateTime(REQUEST_LOAD);
            log.debug("set last log time for request load to " + fLastLogTime);
*/
            fLastWebLogTime = getLastUpdateTime(WEB_REQUEST_LOAD);
            log.info("loading requests that happened between " +
                    fLastWebLogTime + " and " + fStartTime);


/*            loadRequests();

            setLastUpdateTime(REQUEST_LOAD);
*/


            //creating this one ahead of time so that we can reuse it.
            getUrlPs = prepareStatement(GET_URL, TARGET_DB);
            getNamePs = prepareStatement(GET_NAME, TARGET_DB);
            addSiteHitPs = prepareStatement(ADD_SITE_HIT, TARGET_DB);
            createUrlPs = prepareStatement(CREATE_URL, TARGET_DB);

            loadWebRequests();


            setLastUpdateTime(WEB_REQUEST_LOAD);

            log.info("SUCCESS: Requests load ran successfully.");
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            throw ex;
        } finally {
            close(getUrlPs);
            close(addSiteHitPs);
            close(createUrlPs);
            close(getNamePs);
        }
    }

    private final static String LAST_UPDATE =
            " select timestamp from update_log where log_id = " +
            " (select max(log_id) from update_log " +
            " where log_type_id = ?)";

    private Timestamp getLastUpdateTime(int type) throws Exception {
        //log.debug("getLastUpdateTime called");
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = prepareStatement(LAST_UPDATE, TARGET_DB);
            stmt.setInt(1, type);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getTimestamp(1);
            } else {
                // A little misleading here as we really didn't hit a SQL
                // exception but all we are doing outside this method is
                // catching and setting the reason for failure to be the
                // message of the exception.
                throw new Exception("Last log time not found in " +
                        "request_update_log table.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to retrieve last log time.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(stmt);
        }
    }


    private void loadWebRequests() throws Exception {
        //log.debug("called loadWebRequests()");
        PreparedStatement psSel = null;
        PreparedStatement psDel = null;

        ResultSet rs = null;
        int count = 0;
        int retVal = 0;

        try {
            psSel = prepareStatement(REQUEST_LIST, SOURCE_DB);
            psSel.setTimestamp(1, fLastWebLogTime);
            psSel.setTimestamp(2, fStartTime);

            rs = psSel.executeQuery();
            URL url = null;

            long urlId;
            Timestamp time;
            while (rs.next()) {
                url = new URL(rs.getString("url"));
                time = rs.getTimestamp("timestamp");
                urlId = getUrlId(url);
                if (urlId < 0) {
                    //create the url in the db
                    createUrl(url);
                    urlId = getUrlId(url);
                }
                addSiteHitPs.clearParameters();
                if (rs.getString("user_id") == null)
                    addSiteHitPs.setNull(1, Types.DECIMAL);
                else
                    addSiteHitPs.setLong(1, rs.getLong("user_id"));
                addSiteHitPs.setLong(2, urlId);
                addSiteHitPs.setTimestamp(3, time);
                addSiteHitPs.setLong(4, getSessionId(rs.getString("session_id")));
                addSiteHitPs.setLong(5, getCalendarId(time));

                retVal = addSiteHitPs.executeUpdate();

                count += retVal;
                if (retVal != 1) {
                    log.info("TCLoadRequests:site_hit Insert for " +
                            "url_id  " + urlId + " user id " + rs.getString("user_id") + " time " + time +
                            " session " + rs.getString("session_id") + " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "site_hit");
            }
            log.info("deleting transactional records.");
            psDel = prepareStatement(DELETE, SOURCE_DB);
            psDel.setTimestamp(1, fStartTime);
            psDel.executeUpdate();

            log.info("Records loaded for site_hit: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'site_hit' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
        }
    }


    /**
     *
     * @param url
     */
    private void createUrl(URL url) throws Exception {
        //log.debug("called createUrl " + url.getUrl());

        try {

            createUrlPs.clearParameters();
            createUrlPs.setString(1, url.getUrl());
            if (url.hasCoderId())
                createUrlPs.setLong(2, url.getCoderId());
            else
                createUrlPs.setNull(2, Types.DECIMAL);
            if (url.hasRoundId())
                createUrlPs.setLong(3, url.getRoundId());
            else
                createUrlPs.setNull(3, Types.DECIMAL);
            createUrlPs.setString(4, url.getPageName());

            int ret = createUrlPs.executeUpdate();

            if (ret != 1)
                log.info("TCLoadRequests: Insert for " +
                        "url " + url.getUrl() + " coderId " + url.getCoderId() + " roundId " + url.getRoundId() +
                        " pageName " + url.getPageName() + " modified "
                        + ret + " rows, not one.");


        } catch (SQLException sqle) {
            log.error("TCLoadRequests: Insert for " +
                        "url " + url.getUrl() + " coderId " + url.getCoderId() + " roundId " + url.getRoundId() +
                        " pageName " + url.getPageName());
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'url' table failed.\n" +
                    sqle.getMessage());
        }
    }


    /**
     * Returns the url_id of the url from a cache
     * if we have seen it before.  If not, check
     * the database.  If not in the database, return -1
     * @param url
     * @return
     */
    private long getUrlId(URL url) throws Exception {
        //log.debug("called getUrlId " + url.getUrl());
        long ret = -1;
        if (urlMap.containsKey(url.getUrl())) {
            //log.debug("url " + url + " found");
            ret = ((Long) urlMap.get(url.getUrl())).longValue();
        } else {
            //log.debug("url " + url + " not found");
            ResultSet rs = null;

            try {
                getUrlPs.clearParameters();
                getUrlPs.setString(1, url.getUrl());
                rs = getUrlPs.executeQuery();
                int count = 0;
                while (rs.next()) {
                    if (count < 1) {
                        ret = rs.getLong("url_id");
                        urlMap.put(url.getUrl(), new Long(ret));
                    } else {
                        log.error("There was more than 1 entry for url " + url + " so I chose the first " + ret);
                        break;
                    }
                    count++;
                }

            } catch (SQLException sqle) {
                DBMS.printSqlException(true, sqle);
                throw new Exception("Load of 'request' table failed.\n" +
                        sqle.getMessage());
            } finally {
                close(rs);
            }
        }
        return ret;
    }


    private long getCalendarId(Timestamp time) throws Exception {
        //log.debug("called getCalendarId " + time);
        long ret = -1;
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        String dateString = cal.get(Calendar.YEAR) + " " +
                (cal.get(Calendar.MONTH) + 1) + " " +
                cal.get(Calendar.DAY_OF_MONTH);

        if (calendarMap.containsKey(dateString)) {
            //log.debug("date " + time + " found");
            ret = ((Long) calendarMap.get(dateString)).longValue();
        } else {
            //log.debug("date " + time + " not found");
            ret = lookupCalendarId(time, TARGET_DB);
            calendarMap.put(dateString, new Long(ret));
        }
        return ret;
    }

    private long getSessionId(String sessionId) throws Exception {
        //log.debug("called getSessionId() " + sessionId);
        long ret = 0;

        if (sessionMap.containsKey(sessionId)) {
            ret = ((Long) sessionMap.get(sessionId)).longValue();
        } else {
            //look it up and see if it's in the db
            InitialContext ctx = null;
            try {
                ctx = TCContext.getInitial();
                if (!IdGenerator.isInitialized()) {
                    IdGenerator.init(
                            new SimpleDB(),
                            (DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME),
                            "sequence_object",
                            "name",
                            "current_value",
                            9999999999L,
                            1,
                            false
                    );
                }
            } finally {
                if (ctx!=null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {

                    }
                }
                
            }
            ret = IdGenerator.nextId("HTTP_SESSION_SEQ");
            sessionMap.put(sessionId, new Long(ret));
        }
        return ret;
    }


    private void setLastUpdateTime(int type) throws Exception {
        //log.debug("called setLastUpdateTime " + type);
        PreparedStatement psUpd = null;

        try {
            int retVal = 0;
            psUpd = prepareStatement(UPDATE_LOG, TARGET_DB);

            int calendar_id = lookupCalendarId(fStartTime, TARGET_DB);
            psUpd.setInt(1, calendar_id);
            psUpd.setTimestamp(2, fStartTime);
            psUpd.setInt(3, type);

            retVal = psUpd.executeUpdate();
            if (retVal != 1) {
                throw new SQLException("SetLastUpdateTime " +
                        " modified " + retVal + " rows, not one.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to set last log time.\n" +
                    sqle.getMessage());
        } finally {
            close(psUpd);
        }
    }

    /**
     * Get the time of the most recent request in the system
     * this is important because the timestamp on the request is
     * baseed on the time of the actual site hit.  If the application
     * server's time was different than the db's time, we could end
     * up missing requests.  We could end up with the situation where
     * according to our update log we've loaded requests up to date
     * x, but the application server may still thing it's before x.
     * In that case, the next load would miss everything that happened
     * in that window.
     * @return
     * @throws Exception
     */
    private Timestamp getNewestTime() throws Exception {
        ResultSet rs = null;
        PreparedStatement ps = null;
        Timestamp ret = null;
        try {
            ps = prepareStatement(NEWEST_REQUEST_TIME, SOURCE_DB);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getTimestamp(1);
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'request' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }


    private static HashMap pageNameMap = new HashMap();

    static {
        pageNameMap.put("member_profile", "Member Profile");
        pageNameMap.put("round_stats", "Round Statistics");
        pageNameMap.put("last_match", "Last Match Results");
        pageNameMap.put("round_stats_sorted", "Round Statistics");
        pageNameMap.put("last_match_sorted", "Last Match Results");
        pageNameMap.put("round_overview", "Round Overview");
        pageNameMap.put("LegacyReport", "TopCoder Reporting");
        pageNameMap.put("srm", "SRM Details");

    }

    //this stuff is generally for other servlets and stuff like that
    //stuff that isn't acccessed by a content id
    private static HashMap otherPageNameMap = new HashMap();

    static {
        otherPageNameMap.put("", "Home Page");
        otherPageNameMap.put("/", "Home Page");
        otherPageNameMap.put("/tc", "Member Home Page");
        otherPageNameMap.put("/query/query", "Query Tool");
        otherPageNameMap.put("/Registration", "Registration");
        otherPageNameMap.put("/corp/", "Corporate Home Page");
        otherPageNameMap.put("/corp/testing", "Technical Assessment Home");
    }


    private class URL {
        private String baseUrl;
        private TreeMap paramMap = new TreeMap();
        private String url = null;

        private URL(String url) {
            String trimedUrl = null;
            if (url.toLowerCase().startsWith("http://www.topcoder.com")) {
                trimedUrl = url.substring("http://www.topcoder.com".length());
            } else {
                trimedUrl = url;
            }
            if (trimedUrl.indexOf('?') < 0)
                this.baseUrl = trimedUrl;
            else
                baseUrl = trimedUrl.substring(0, trimedUrl.indexOf('?'));

            //log.debug("url " + baseUrl);

            //we only want the query string for the parameter extraction
            if (trimedUrl.indexOf('?') > 0) {
                trimedUrl = trimedUrl.substring(trimedUrl.indexOf('?'));
                //log.debug("trimedurl " + trimedUrl);
                StringTokenizer st = new StringTokenizer(trimedUrl, "?&");
                String s;
                for (; st.hasMoreTokens();) {
                    s = st.nextToken();
                    if (s.indexOf('=') == 0) {
                        //this shouldn't ever happen, cuz that would mean the url was something
                        //like &=blah, but we'll throw a case in anyway
                        paramMap.put("", s);
                    } else if (s.indexOf('=') > 0) {
/*
                        log.debug("adding " + s.substring(0, s.indexOf('=')) +
                                " " + s.substring(s.indexOf('=')+1, s.length()));
*/

                        if (!s.substring(0, s.indexOf('=')).equals("WebLogicSession"))
                            paramMap.put(s.substring(0, s.indexOf('=')),
                                    s.substring(s.indexOf('=') + 1, s.length()));
                    } else {
                        paramMap.put(s, "");
                    }
                }
            }
            Map.Entry me = null;
            StringBuffer ret = new StringBuffer(baseUrl.length());
            ret.append(baseUrl);
            int i = 0;
            for (Iterator it = paramMap.entrySet().iterator(); it.hasNext(); i++) {
                me = (Map.Entry) it.next();
                if (i > 0) {
                    ret.append('&');
                } else {
                    ret.append("?");
                }
                ret.append(me.getKey());
                ret.append("=");
                ret.append(me.getValue());
            }

            //254 is as long as we can fit in the column, so we'll do everything based on a trimmed version of the url
            if (ret.length()>254)
                this.url = ret.toString().substring(0, 254);
            else this.url = ret.toString();
        }

        public String getUrl() {
            return url;
        }

        public boolean hasCoderId() {
            return hasParam(CODER_ID_KEYS);
        }

        public boolean hasRoundId() {
            return hasParam(ROUND_ID_KEYS);
        }

        public boolean hasContentId() {
            return hasParam(CONTENT_IDS);
        }

        private boolean hasParam(String[] arr) {
            boolean found = false;
            for (int i = 0; i < arr.length & !found; i++) {
                found = hasParam(arr[i]);
            }
            return found;
        }

        private boolean hasParam(String param) {
            return paramMap.containsKey(param);
        }

        public long getCoderId() {
            //log.debug("getCoderId called " + getUrl());
            long ret = -1;
            try {
                if (hasCoderId()) {
                    boolean found = false;
                    String temp = null;
                    for (int i = 0; i < CODER_ID_KEYS.length & !found; i++) {
                        //returning the first found, so if there are more
                        //than one coder_id key in the query, then we'll be
                        //returning the first one
                        temp = (String) paramMap.get(CODER_ID_KEYS[i]);
                        if (temp != null) {
                            ret = Long.parseLong(((String) paramMap.get(CODER_ID_KEYS[i])));
                            found = true;
                        }
                    }
                }
            } catch (Exception e) {
                log.error("problem figuring out the coder_id for " + getUrl());
            }
            return ret;
        }

        public long getRoundId() {
            long ret = -1;
            try {
                if (hasRoundId()) {
                    boolean found = false;
                    String temp = null;
                    for (int i = 0; i < ROUND_ID_KEYS.length & !found; i++) {
                        //returning the first found, so if there are more
                        //than one round_id key in the query, then we'll be
                        //returning the first one
                        temp = (String) paramMap.get(ROUND_ID_KEYS[i]);
                        if (temp != null) {
                            ret = Long.parseLong(((String) paramMap.get(ROUND_ID_KEYS[i])));
                            found = true;
                        }
                    }
                }
            } catch (Exception e) {
                log.error("problem figuring out the round_id for " + getUrl());
            }
            return ret;
        }

        public String getContentId() {
            String ret = null;
            boolean found = false;
            for (int i = 0; i < CONTENT_IDS.length & !found; i++) {
                //returning the first found, so if there are more
                //than one content_id in the query, then we'll be
                //returning the first one
                ret = (String) paramMap.get(CONTENT_IDS[i]);
                if (ret != null)
                    found = true;
            }
            return ret;
        }

        public String getPageName() {
            String contentId = getContentId();
            String ret = contentId;
            if (pageNameMap.containsKey(contentId)) {
                ret = (String) pageNameMap.get(contentId);
            } else {
                //look through the other stuff that might indicate what page name to use
                Map.Entry me = null;
                String url = getUrl();
                if (url == null) url = "";
                boolean found = false;
                for (Iterator it = otherPageNameMap.entrySet().iterator(); it.hasNext() && !found;) {
                    me = (Map.Entry) it.next();
                    if (url.equals(me.getKey())) {
                        ret = (String) me.getKey();
                        found = true;
                    }
                }
                if (!found) {
                    //perhaps we've seen this before and it's got a name in the database
                    ResultSet rs = null;

                    try {
                        getNamePs.clearParameters();
                        getNamePs.setString(1, url);
                        rs = getNamePs.executeQuery();
                        if (rs.next()) {
                            ret = rs.getString("page_name");
                            otherPageNameMap.put(url, ret);
                        }

                    } catch (SQLException sqle) {
                        DBMS.printSqlException(true, sqle);
                        //ignore otherwise...we'll just have to use our default page name
                    } finally {
                        close(rs);
                    }

                }
            }
            return ret;
        }

        public String toString() {
            return getUrl();
        }

    }



/*
    private void loadRequests() throws Exception {
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        PreparedStatement psDel = null;
        StringBuffer query = null;

        ResultSet rs = null;
        int count = 0;
        int retVal = 0;

        try {
            // Our select statement
            query = new StringBuffer(100);
            query.append("SELECT rt.request_id ");           // 1
            query.append("       ,rt.request_type_id ");     // 2
            query.append("       ,rt.coder_id ");            // 3
            query.append("       ,rt.round_id ");            // 4
            query.append("       ,rt.room_id ");             // 5
            query.append("       ,rt.open_window ");         // 6
            query.append("       ,rt.open_period ");         // 7
            query.append("       ,rt.connection_id ");       // 8
            query.append("       ,rt.server_id ");           // 9
            query.append("       ,rt.timestamp ");           //10
            query.append("       ,rt.close_window ");        //11
            query.append("  FROM request rt ");
            query.append("   WHERE timestamp > ?");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = rt.coder_id ");
            query.append("           AND gu.group_id = 13)");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM group_user gu ");
            query.append("         WHERE gu.user_id = rt.coder_id ");
            query.append("           AND gu.group_id = 14)");
            query.append("   AND NOT EXISTS ");
            query.append("       (SELECT 'pops' ");
            query.append("          FROM room ro ");
            query.append("         WHERE ro.room_id = rt.room_id ");
            query.append("           AND ro.room_type_id <> 1)");

            psSel = prepareStatement(query.toString(), SOURCE_DB);
            // Our insert statement
            query = new StringBuffer(100);
            query.append("INSERT INTO request ");
            query.append("       (request_id ");          // 1
            query.append("       ,request_type_id ");     // 2
            query.append("       ,coder_id ");            // 3
            query.append("       ,round_id ");            // 4
            query.append("       ,room_id ");             // 5
            query.append("       ,open_window ");         // 6
            query.append("       ,open_period ");         // 7
            query.append("       ,connection_id ");       // 8
            query.append("       ,server_id ");           // 9
            query.append("       ,timestamp ");           //10
            query.append("       ,close_window) ");        //11
            query.append("VALUES (");
            query.append("?,?,?,?,?,?,?,?,?,?,");  // 10
            query.append("?)");                    // 11

            psIns = prepareStatement(query.toString(), TARGET_DB);

            query = new StringBuffer(100);
            query.append("DELETE FROM request ");
            query.append(" WHERE request_id = ? ");
            psDel = prepareStatement(query.toString(), TARGET_DB);

            // On to the load
            psSel.setTimestamp(1, fLastLogTime);
            rs = psSel.executeQuery();

            while (rs.next()) {
                int request_id = rs.getInt(1);

                psDel.clearParameters();
                psDel.setInt(1, request_id);
                psDel.executeUpdate();
                int round_id = rs.getInt(4);
//          System.out.println(round_id);
                int room_id = rs.getInt(5);
//          System.out.println(room_id);

                psIns.clearParameters();
                psIns.setInt(1, request_id);  // request_id
                psIns.setInt(2, rs.getInt(2));  // request_type_id
                psIns.setInt(3, rs.getInt(3));  // coder_id
                psIns.setInt(4, round_id);  // round_id
                psIns.setInt(5, room_id);  // room_id
                psIns.setTimestamp(6, rs.getTimestamp(6));  // open_window
                psIns.setTimestamp(7, rs.getTimestamp(7));  // open_period
                psIns.setInt(8, rs.getInt(8));  // connection_id
                psIns.setInt(9, rs.getInt(9));  // server_id
                psIns.setTimestamp(10, rs.getTimestamp(10)); // timestamp
                psIns.setTimestamp(11, rs.getTimestamp(11)); // close_window

                //System.out.println(rs.getInt(1)+" "+rs.getInt(2)+" "+rs.getInt(3)+" "+rs.getInt(4)+" "+rs.getInt(5)+rs.getTimestamp(10).toString());

                retVal = psIns.executeUpdate();
                count += retVal;
                if (retVal != 1) {
                    log.info("TCLoadRequests: Insert for " +
                            "request_id " + request_id +
                            " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "request");
            }

            log.info("Records loaded for request: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'request' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
            close(psDel);
        }
    }
*/


}
