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

import javax.sql.DataSource;
import javax.naming.InitialContext;
import java.sql.*;
import java.util.*;
import java.util.Date;

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
    private static final String[] CONTENT_IDS = {"module", "c", "task"};
    private HashMap sessionMap = new HashMap();
    private HashMap calendarMap = new HashMap();

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
    public void  performLoad() throws Exception {
        try {
            fStartTime = new java.sql.Timestamp(System.currentTimeMillis());
            log.info("It is now " + fStartTime.toString());

/*
            fLastLogTime = getLastUpdateTime(REQUEST_LOAD);
            log.debug("set last log time for request load to " + fLastLogTime);
*/
            fLastWebLogTime = getLastUpdateTime(WEB_REQUEST_LOAD);
            log.debug("set last log time for web request load to " + fLastWebLogTime);


/*            loadRequests();

            setLastUpdateTime(REQUEST_LOAD);
*/

            loadWebRequests();

            setLastUpdateTime(WEB_REQUEST_LOAD);

            log.info("SUCCESS: Requests load ran successfully.");
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            throw ex;
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


    private final static String REQUEST_LIST =
            " select user_id" +
            " , url" +
            " , session_id" +
            " , timestamp" +
            " from request" +
            " where timestamp > ?";

    private final static String ADD_SITE_HIT =
            " insert into site_hit (coder_id, url_id, timestamp, session_id, calendar_id)" +
            " values (?, ?, ?, ?, ?)";


    private void loadWebRequests() throws Exception {
        //log.debug("called loadWebRequests()");
        PreparedStatement psSel = null;
        PreparedStatement psIns = null;

        ResultSet rs = null;
        int count = 0;
        int retVal = 0;

        try {
            psSel = prepareStatement(REQUEST_LIST, SOURCE_DB);
            psSel.setTimestamp(1, fLastWebLogTime);

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
                psIns = prepareStatement(ADD_SITE_HIT, TARGET_DB);
                if (rs.getString("user_id")==null)
                    psIns.setNull(1, Types.DECIMAL);
                else psIns.setLong(1, rs.getLong("user_id"));
                psIns.setLong(2, urlId);
                psIns.setTimestamp(3, time);
                psIns.setLong(4, getSessionId(rs.getString("session_id")));
                psIns.setLong(5, getCalendarId(time));

                retVal = psIns.executeUpdate();

                count+=retVal;
                if (retVal != 1) {
                    log.info("TCLoadRequests:site_hit Insert for " +
                            "url_id  " + urlId + " user id " +  rs.getString("user_id") + " time " + time +
                            " session " + rs.getString("session_id") + " modified " + retVal + " rows, not one.");
                }

                printLoadProgress(count, "site_hit");
            }

            log.info("Records loaded for site_hit: " + count);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'site_hit' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(rs);
            close(psSel);
            close(psIns);
        }
    }

    private static final String CREATE_URL =
            " insert into url (url, coder_id, round_id, page_name) " +
            " values (?, ?, ?, ?)";

    /**
     *
     * @param url
     */
    private void createUrl(URL url) throws Exception {
        //log.debug("called createUrl " + url.getUrl());
        PreparedStatement ps = null;

        try {

            ps = prepareStatement(CREATE_URL, TARGET_DB);
            ps.setString(1, url.getUrl());
            if (url.hasCoderId())
                ps.setLong(2, url.getCoderId());
            else
                ps.setNull(2, Types.DECIMAL);
            if (url.hasRoundId())
                ps.setLong(3, url.getRoundId());
            else
                ps.setNull(3, Types.DECIMAL);
            ps.setString(4, url.getPageName());

            int ret = ps.executeUpdate();

            if (ret != 1)
                log.info("TCLoadRequests: Insert for " +
                        "url " + url.getUrl() + " coderId " + url.getCoderId() + " roundId " + url.getRoundId() +
                        " pageName " + url.getPageName()+ " modified "
                        + ret + " rows, not one.");


        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Load of 'url' table failed.\n" +
                    sqle.getMessage());
        } finally {
            close(ps);
        }
    }


    private final static String GET_URL =
            " select url_id" +
            " from url" +
            " where url = ?";

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
        if (urlMap.containsKey(url)) {
            ret = ((Long) urlMap.get(url)).longValue();
        } else {
            PreparedStatement psSel = null;
            ResultSet rs = null;

            try {
                psSel = prepareStatement(GET_URL, TARGET_DB);
                psSel.setString(1, url.getUrl());
                rs = psSel.executeQuery();
                int count = 0;
                while (rs.next()) {
                    if (count < 1) {
                        ret = rs.getLong("url_id");
                        urlMap.put(url, new Long(ret));
                    } else {
                        log.error("There was more than 1 entry for url " + url + " so I chose the first " + ret);
                        break;
                    }
                }

            } catch (SQLException sqle) {
                DBMS.printSqlException(true, sqle);
                throw new Exception("Load of 'request' table failed.\n" +
                        sqle.getMessage());
            } finally {
                close(rs);
                close(psSel);
            }
        }
        return ret;
    }


    private long getCalendarId(Timestamp time) throws Exception {
        //log.debug("called getCalendarId " + time);
        long ret = -1;
        Date d = new Date(time.getTime());
        if (calendarMap.containsKey(d)) {
            ret = ((Long)calendarMap.get(d)).longValue();
        } else {
            ret = lookupCalendarId(time, TARGET_DB);
            calendarMap.put(d, new Long(ret));
        }
        return ret;
    }

    private long getSessionId(String sessionId) throws Exception {
        //log.debug("called getSessionId() " + sessionId);
        long ret = 0;
        if (sessionMap.containsKey(sessionId)) {
            ret = ((Long)sessionMap.get(sessionId)).longValue();
        } else {
            //look it up and see if it's in the db
            InitialContext ctx = TCContext.getInitial();
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
            ret = IdGenerator.nextId("HTTP_SESSION_SEQ");
            sessionMap.put(sessionId, new Long(ret));
        }
        return ret;
    }


    private static final String UPDATE_LOG =
            "INSERT INTO update_log " +
            "      (log_id " +
            "       ,calendar_id " +
            "       ,timestamp " +
            "       ,log_type_id) " +
            " VALUES (0, ?, ?, ?)";

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

    private static HashMap pageNameMap = new HashMap();

    static {
        pageNameMap.put("member_profile", "Member Profile");
        pageNameMap.put("round_stats", "Round Statistics");
        pageNameMap.put("last_match", "Last Match Results");
        pageNameMap.put("round_stats_sorted", "Round Statistics");
        pageNameMap.put("last_match_sorted", "Last Match Results");
        pageNameMap.put("round_overview", "Round Overview");
        pageNameMap.put("", "Home Page");
        pageNameMap.put("/", "Home Page");
        pageNameMap.put("/tc", "Member Home Page");
    }


    private class URL {
        private String baseUrl;
        private TreeMap paramMap=new TreeMap();

        private URL(String url) {
            String trimedUrl = null;
            if (url.toLowerCase().startsWith("http://www.topcoder.com")) {
                trimedUrl = url.substring("http://www.topcoder.com".length());
            } else {
                trimedUrl = url;
            }

            if (trimedUrl.indexOf('?') < 0)
                this.baseUrl = trimedUrl;
            else baseUrl = trimedUrl.substring(0, trimedUrl.indexOf('?'));

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
                        paramMap.put(s.substring(0, s.indexOf('=')),
                                s.substring(s.indexOf('=')+1, s.length()));
                    } else {
                        paramMap.put(s, "");
                    }
                }
            }

        }

        public String getUrl() {
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
            return ret.toString();
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
            if (hasCoderId()) {
                boolean found = false;
                String temp = null;
                for (int i = 0; i < CODER_ID_KEYS.length & !found; i++) {
                    //returning the first found, so if there are more
                    //than one coder_id key in the query, then we'll be
                    //returning the first one
                    temp = (String)paramMap.get(CODER_ID_KEYS[i]);
                    if (temp!=null) {
                        ret = Long.parseLong(((String) paramMap.get(CODER_ID_KEYS[i])));
                        found = true;
                    }
                }
            }
            return ret;
        }

        public long getRoundId() {
            long ret = -1;
            if (hasRoundId()) {
                boolean found = false;
                String temp = null;
                for (int i = 0; i < ROUND_ID_KEYS.length & !found; i++) {
                    //returning the first found, so if there are more
                    //than one round_id key in the query, then we'll be
                    //returning the first one
                    temp = (String)paramMap.get(ROUND_ID_KEYS[i]);
                    if (temp!=null) {
                        ret = Long.parseLong(((String) paramMap.get(ROUND_ID_KEYS[i])));
                        found = true;
                    }
                }
            }
            return ret;
        }

        public String getContentId() {
            String ret = null;
            boolean found = false;
            for (int i = 0; i < CONTENT_IDS.length & !found; i++) {
                //returning the first found, so if there are more
                //than one round_id key in the query, then we'll be
                //returning the first one
                ret = (String) paramMap.get(CONTENT_IDS[i]);
                if (ret!=null)
                    found = true;
            }
            return ret;
        }

        public String getPageName() {
            String contentId = getContentId();
            if (pageNameMap.containsKey(contentId)) {
                return (String)pageNameMap.get(contentId);
            } else {
                return contentId;
            }
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
