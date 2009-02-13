package com.topcoder.web.common;

import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:12:26 AM
 */
public class RequestTracker {

    private static final User GUEST = SimpleUser.createGuest();
    private static final int BATCH_PERIOD = 60 * 1000;
    private static final String[] IGNORE_LIST = {"65.112.118.194", "172.16.1.182"};

    static {
        Arrays.sort(IGNORE_LIST);
    }

    private static Queue q = new Queue();

    private static Logger log = Logger.getLogger(RequestTracker.class);
    private static Thread t = null;

    /*
     * Create the thread to batch the inserts to the database
     * and kick it off.
     */
    static {
        log.info("starting request tracker thread");
        t = new RequestTrackerThread();
        t.start();
    }


    /**
     * Track a request.  This version does not have a user associated with
     * the request so we'll assume they are anonymous
     * @param request
     */
    public static void trackRequest(TCRequest request) {
        trackRequest(GUEST, request);
    }

    /**
     * Track a request.
     * @param u
     * @param request
     */
    public static void trackRequest(User u, TCRequest request) {
        if (Arrays.binarySearch(IGNORE_LIST, request.getRemoteAddr()) < 0)
            q.add(new UserRequest(u, request));
    }

    /**
     * A thread class that is used to load all the requests to the db once
     * every batch period.
     */
    private static class RequestTrackerThread extends Thread {
        public void run() {
            while (true) {
                try {
                    Thread.sleep(BATCH_PERIOD);
                    loadRequests();
                } catch (InterruptedException e) {
                    log.error("Interrupted while waiting for the next batch", e);
                }
            }
        }

        /**
         * Method to iterate through all the requests in the queue
         * and add them to the database.  First we pull them out
         * of the queue and put them in a temporary location so that
         * we only lock up the queue for a short period of time, then
         * it can continue to be loaded with more requests.
         */
        private static void loadRequests() {
            ArrayList a = new ArrayList(q.size());
            synchronized (q) {
                while (!q.isEmpty())
                    a.add(q.pop());
            }
            try {
                //log.debug("begin request batch load");
                String sessionId = null;
                for (Iterator it = a.iterator(); it.hasNext();) {
                    UserRequest r = (UserRequest) it.next();
                    if (ApplicationServer.SESSION_ID_LENGTH > 0) {
                        sessionId = r.sessionId.substring(0, ApplicationServer.SESSION_ID_LENGTH);
                    } else {
                        sessionId = r.sessionId;
                    }
                    if (r.userId == GUEST.getId()) {
                        createRequest(r.url, new Timestamp(r.time),
                                sessionId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    } else {
                        createRequest(r.userId, r.url, new Timestamp(r.time),
                                sessionId,
                                DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    }
                }
                //log.debug("end request batch load");

            } catch (Exception e) {
                log.error("Problem inserting request" + e);
            }

        }
    }


    protected static void createRequest(long userId, String url, Timestamp time,
                                        String sessionId, String dataSource) throws TCWebException {
/*
        log.debug("createRequest called. url: " + url
                + " userId: " + userId + " time: " + time + " session: " + sessionId);
*/

        StringBuffer query = new StringBuffer(200);
        query.append("insert into request (user_id, url, timestamp, session_id) ");
        query.append(" values (?, ?, ?, ?)");

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setString(2, url);
            ps.setTimestamp(3, time);
            ps.setString(4, sessionId);

            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new TCWebException(e);
        } finally {
            ApplicationServer.close(ps);
            ApplicationServer.close(conn);
            ApplicationServer.close(ctx);
        }
    }

    protected static void createRequest(String url, Timestamp time, String sessionId, String dataSource) throws TCWebException {
//        log.debug("createRequest called. url: " + url + " time: " + time + " session: " + sessionId);
        StringBuffer query = new StringBuffer(200);
        query.append("insert into request (url, timestamp, session_id) ");
        query.append(" values (?, ?, ?)");

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, url);
            ps.setTimestamp(2, time);
            ps.setString(3, sessionId);

            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new TCWebException(e);
        } finally {
            ApplicationServer.close(ps);
            ApplicationServer.close(conn);
            ApplicationServer.close(ctx);
        }
    }


    /**
     * An object that contains all the useful data that we will be
     * adding to the database.
     */
    private static class UserRequest {
        private long userId;
        private String url;
        private String sessionId;
        private long time;

        /**
         * We parse out the request here so that
         * we don't have to maintain a reference after the request has
         * been serviced.
         * @param u
         * @param r
         */
        private UserRequest(User u, TCRequest r) {
            this.userId = u == null ? GUEST.getId() : u.getId();
            StringBuffer buf = new StringBuffer(254);
            buf.append("http://");
            buf.append(r.getServerName());
            buf.append(r.getContextPath());
            buf.append(r.getServletPath());
            String query = r.getQueryString();
            buf.append((query == null) ? ("") : ("?" + query));
            this.url = buf.toString();
            this.time = System.currentTimeMillis();
            this.sessionId = r.getSession().getId();
            log.debug("session: " + this.sessionId);
        }
    }

    private static class Queue {
        private final LinkedList q = new LinkedList();

        public synchronized boolean add(Object o) {
            return q.add(o);
        }

        public synchronized int size() {
            return q.size();
        }

        public synchronized boolean isEmpty() {
            return q.isEmpty();
        }

        public synchronized Object pop() {
            return q.removeLast();
        }


    }
}
