package com.topcoder.web.ejb.session;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.*;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 2, 2003 9:48:30 PM
 */
public class SessionBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    /**
     *
     * @param sessionProfileId
     * @param userId
     * @param beginTime
     * @param endTime
     * @param sendRepEmail
     * @param sendCandidateEmail
     * @param createUserId
     * @return a session Id generated from this method call
     */
    public long createSession(long sessionProfileId,
                              long userId,
                              Timestamp beginTime,
                              Timestamp endTime,
                              boolean sendRepEmail,
                              boolean sendCandidateEmail,
                              long createUserId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" userId: ");
        varBuf.append(userId);
        varBuf.append(" beginTime: ");
        varBuf.append(beginTime.toString());
        varBuf.append(" endTime: ");
        varBuf.append(endTime.toString());
        varBuf.append(" sendRepEmail: ");
        varBuf.append(sendRepEmail);
        varBuf.append(" sendCandidateEmail: ");
        varBuf.append(sendCandidateEmail);
        varBuf.append(" createUserId: ");
        varBuf.append(createUserId);

        debugBuf.append("createSession called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionId = 0;

        try {
            StringBuffer query = new StringBuffer();

            query.append("INSERT INTO session (session_id, ");
            query.append("session_profile_id, user_id, begin_time, end_time, ");
            query.append("send_rep_email, send_candidate_email, ");
            query.append("create_user_id) ");
            query.append("VALUES(?,?,?,?,?,?,?,?) ");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_SEQ");

            ps.setLong(1, sessionId);
            ps.setLong(2, sessionProfileId);
            ps.setLong(3, userId);
            ps.setTimestamp(4, beginTime);
            ps.setTimestamp(5, endTime);
            ps.setLong(6, sendRepEmail ? 1 : 0);
            ps.setLong(7, sendCandidateEmail ? 1 : 0);
            ps.setLong(8, createUserId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in createSession. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in createSession. ");
            exceptionBuf.append(varBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return sessionId;
    }

    /**
     *
     * @param sessionId
     * @param jobId
     */
    public void setJobId(long sessionId, long jobId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" jobId: ");
        varBuf.append(jobId);

        debugBuf.append("setJobId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session SET job_id = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, jobId);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionProfileId
     */
    public void setSessionProfileId(long sessionId, long sessionProfileId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("setSessionProfileId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session SET session_profile_id = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param userId
     */
    public void setUserId(long sessionId, long userId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" userId: ");
        varBuf.append(userId);

        debugBuf.append("setUserId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session SET user_id = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, userId);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param beginTime
     */
    public void setBeginTime(long sessionId, Timestamp beginTime) {

        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" beginTime: ");
        varBuf.append(beginTime.toString());

        debugBuf.append("setBeginTime called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE session SET begin_time = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setTimestamp(1, beginTime);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param endTime
     */
    public void setEndTime(long sessionId, Timestamp endTime) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" endTime: ");
        varBuf.append(endTime.toString());

        debugBuf.append("setEndTime called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET end_time = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setTimestamp(1, endTime);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sendRepEmail
     */
    public void setSendRepEmail(long sessionId, boolean sendRepEmail) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" sendRepEmail: ");
        varBuf.append(sendRepEmail);

        debugBuf.append("setSendRepEmail called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET send_rep_email = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setBoolean(1, sendRepEmail);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sendCandidateEmail
     */
    public void setSendCandidateEmail(long sessionId,
                                      boolean sendCandidateEmail) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" sendCandidateEmail: ");
        varBuf.append(sendCandidateEmail);

        debugBuf.append("setSendCandidateEmail called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET send_candidate_email = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setBoolean(1, sendCandidateEmail);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param createUserId
     */
    public void setCreateUserId(long sessionId, long createUserId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);
        varBuf.append(" createUserId: ");
        varBuf.append(createUserId);

        debugBuf.append("setCreateUserId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET create_user_id = ? WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, createUserId);
            ps.setLong(2, sessionId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @return long of session profile Id
     */
    public long getSessionProfileId(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getSessionProfileId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionProfileId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT session_profile_id FROM session WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                sessionProfileId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return sessionProfileId;
    }

    /**
     *
     * @param sessionId
     * @return long of Job Id
     */
    public long getJobId(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getJobId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long jobId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT job_id FROM session WHERE ");
            query.append("session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                jobId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getJobId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getJobId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return jobId;
    }

    /**
     *
     * @param sessionId
     * @return long of user id
     */
    public long getUserId(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getUserId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long userId = -1;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT user_id FROM session WHERE session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return userId;
    }

    /**
     *
     * @param sessionId
     * @return Timestamp of beginning session time
     */
    public Timestamp getBeginTime(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getBeginTime called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Timestamp beginTime = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT begin_time FROM session WHERE session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                beginTime = rs.getTimestamp(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return beginTime;
    }

    /**
     *
     * @param sessionId
     * @return Timestamp of ending session time
     */
    public Timestamp getEndTime(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getEndTime called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Timestamp endTime = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT end_time from session where session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                endTime = rs.getTimestamp(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return endTime;
    }

    /**
     *
     * @param sessionId
     * @return
     */
    public boolean getSendRepEmail(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getSendRepEmail called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        boolean sendRepEmail = false;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT send_rep_email FROM session ");
            query.append("WHERE session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                sendRepEmail = rs.getBoolean(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return sendRepEmail;
    }

    /**
     *
     * @param sessionId
     * @return
     */
    public boolean getSendCandidateEmail(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getSendCandidateEmail called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        boolean sendCandidateEmail = false;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT send_candidate_email FROM session ");
            query.append("WHERE session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                sendCandidateEmail = rs.getBoolean(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return sendCandidateEmail;
    }

    /**
     *
     * @param sessionId
     * @return
     */
    public long getCreateUserId(long sessionId) {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getCreateUserId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long createUserId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT create_user_id FROM session ");
            query.append("WHERE session_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);

            rs = ps.executeQuery();
            if (rs.next()) {
                createUserId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return createUserId;
    }
}
