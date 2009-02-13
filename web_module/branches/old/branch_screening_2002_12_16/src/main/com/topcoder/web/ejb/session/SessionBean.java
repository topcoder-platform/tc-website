package com.topcoder.web.ejb.session;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.sql.*;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 2, 2003 9:48:30 PM
 */
public class SessionBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionBean.class);
    private static final String dataSourceName = "java:comp/env/datasource";
    private static final String txDataSourceName = "java:comp/env/txdatasource";

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
                              long createUserId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionId = 0;

        try {
            StringBuffer query = new StringBuffer();

            query.append("INSERT INTO session (session_id, " );
            query.append("session_profile_id, user_id, begin_time, end_time, ");
            query.append("send_rep_email, send_candidate_email, ");
            query.append("create_user_id) ");
            query.append("VALUES(?,?,?,?,?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_SEQ");

            pstmt.setLong(1,sessionId);
            pstmt.setLong(2,sessionProfileId);
            pstmt.setLong(3,userId);
            pstmt.setTimestamp(4,beginTime);
            pstmt.setTimestamp(5,endTime);
            pstmt.setLong(6,sendRepEmail?1:0);
            pstmt.setLong(7,sendCandidateEmail?1:0);
            pstmt.setLong(8,createUserId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in createSession. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in createSession. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in createSession. ");
            exceptionBuf.append(varBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore){log.error("FAILED to close PreparedStatement in createSession");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore){log.error("FAILED to close Connection in createSession");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore){log.error("FAILED to close Context in createSession");}}
        }
        return sessionId;
    }

    /**
     *
     * @param sessionId
     * @param sessionProfileId
     */
    public void setSessionProfileId(long sessionId, long sessionProfileId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session SET session_profile_id = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore){log.error("FAILED to close PreparedStatement in setSessionProfileId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore){log.error("FAILED to close Connection in setSessionProfileId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore){log.error("FAILED to close Context in setSessionProfileId");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param userId
     */
    public void setUserId(long sessionId, long userId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session SET user_id = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, userId);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in setUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore){log.error("FAILED to close PreparedStatement in setUserId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore){log.error("FAILED to close Connection in setUserId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore){log.error("FAILED to close Context in setUserId");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param beginTime
     */
    public void setBeginTime(long sessionId, Timestamp beginTime)
            throws RemoteException {

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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE session SET begin_time = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setTimestamp(1, beginTime);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in setBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore){log.error("FAILED to close PreparedStatement in setBeginTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore){log.error("FAILED to close Connection in setBeginTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setBeginTime");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param endTime
     */
    public void setEndTime(long sessionId, Timestamp endTime)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET end_time = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setTimestamp(1, endTime);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
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
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setEndTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setEndTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setEndTime");}}
       }
    }

    /**
     *
     * @param sessionId
     * @param sendRepEmail
     */
    public void setSendRepEmail(long sessionId, boolean sendRepEmail)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET send_rep_email = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setBoolean(1, sendRepEmail);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in setSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSendRepEmail");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSendRepEmail");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSendRepEmail");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param sendCandidateEmail
     */
    public void setSendCandidateEmail(long sessionId,
                                      boolean sendCandidateEmail)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET send_candidate_email = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setBoolean(1, sendCandidateEmail);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in setSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSendRepEmail");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSendRepEmail");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSendRepEmail");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param createUserId
     */
    public void setCreateUserId(long sessionId, long createUserId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE session SET create_user_id = ? WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, createUserId);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in setCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in setCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in setCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCreateUserId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCreateUserId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCreateUserId");}}
        }
    }

    /**
     *
     * @param sessionId
     * @return long of session profile Id
     */
    public long getSessionProfileId(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getSessionProfileId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionProfileId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT session_profile_id FROM session WHERE ");
            query.append("session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                sessionProfileId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getSessionProfileId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSessionProfileId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSessionProfileId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSessionProfileId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSessionProfileId");}}
        }

        return sessionProfileId;
    }

    /**
     *
     * @param sessionId
     * @return long of user id
     */
    public long getUserId(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getUserId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long userId = -1;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT user_id FROM session WHERE session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                userId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getUserId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getUserId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getUserId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getUserId");}}
        }

        return userId;
    }

    /**
     *
     * @param sessionId
     * @return Timestamp of beginning session time
     */
    public Timestamp getBeginTime(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getBeginTime called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Timestamp beginTime = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT begin_time FROM session WHERE session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                beginTime = rs.getTimestamp(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getBeginTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getBeginTime");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getBeginTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getBeginTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getBeginTime");}}
        }

        return beginTime;
    }

    /**
     *
     * @param sessionId
     * @return Timestamp of ending session time
     */
    public Timestamp getEndTime(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getEndTime called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Timestamp endTime = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT end_time from session where session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                endTime = rs.getTimestamp(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getEndTime. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getEndTime");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getEndTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getEndTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getEndTime");}}
        }

        return endTime;
    }

    /**
     *
     * @param sessionId
     * @return
     */
    public boolean getSendRepEmail(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getSendRepEmail called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        boolean sendRepEmail = false;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT send_rep_email FROM session ");
            query.append("WHERE session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                sendRepEmail = rs.getBoolean(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getSendRepEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSendRepEmail");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSendRepEmail");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSendRepEmail");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSendRepEmail");}}
        }

        return sendRepEmail;
    }

    /**
     *
     * @param sessionId
     * @return
     */
    public boolean getSendCandidateEmail(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getSendCandidateEmail called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        boolean sendCandidateEmail = false;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT send_candidate_email FROM session ");
            query.append("WHERE session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                sendCandidateEmail = rs.getBoolean(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getSendCandidateEmail. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSendCandidateEmail");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSendCandidateEmail");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSendCandidateEmail");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSendCandidateEmail");}}
        }

        return sendCandidateEmail;
    }

    /**
     *
     * @param sessionId
     * @return
     */
    public long getCreateUserId(long sessionId)
            throws RemoteException {
        // constructing debugging information
        StringBuffer debugBuf = new StringBuffer(500);
        StringBuffer varBuf = new StringBuffer(500);

        varBuf.append("sessionId: ");
        varBuf.append(sessionId);

        debugBuf.append("getCreateUserId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long createUserId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT create_user_id FROM session ");
            query.append("WHERE session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                createUserId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("SQLException in getCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("NamingException in getCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(500);
            exceptionBuf.append("Exception in getCreateUserId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCreateUserId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCreateUserId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCreateUserId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCreateUserId");}}
        }

        return createUserId;
    }
}
