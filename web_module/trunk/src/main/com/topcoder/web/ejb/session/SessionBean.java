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
    private static final String dataSourceName = "SCREENING_OLTP";

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
                              Date beginTime,
                              Date endTime,
                              boolean sendRepEmail,
                              boolean sendCandidateEmail,
                              long createUserId)
            throws RemoteException {
        log.debug("createSession called. sessionProfileId: "
                + sessionProfileId + " userId: " + userId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionId = 0;

        try {
            StringBuffer query = new StringBuffer();

            query.append("INSERT INTO session (session_id, " +
                "session_profile_id, user_id, begin_time, end_time, " +
                "send_rep_email, send_candidate_email, modify_date, " +
                "create_date, create_user_id) " +
                "values(?,?,?,?,?,?,?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_SEQ");

            pstmt.setLong(1,sessionId);
            pstmt.setLong(2,sessionProfileId);
            pstmt.setLong(3,userId);
            pstmt.setDate(4,beginTime);
            pstmt.setDate(5,endTime);
            pstmt.setBoolean(6,sendRepEmail);
            pstmt.setBoolean(7,sendCandidateEmail);
            pstmt.setLong(10,createUserId);

            int rowNum = pstmt.executeUpdate();
            if (rowNum != sessionId)
                throw new EJBException("row number does not match with primary key session id. row num:  "
                        + rowNum + " sessionId: "
                        + sessionId + " in createSession");

        } catch (SQLException sqe) {
            throw new EJBException("SQLException creating Session sessionId: " + sessionId + " sessionProfileId: " + sessionProfileId);
        } catch (NamingException e) {
            throw new EJBException("NamingException creating Session sessionId: " + sessionId + " sessionProfileId: " + sessionProfileId);
        } catch (Exception e) {
            throw new EJBException("Exception creating Session sessionId: " + sessionId + " sessionProfileId: " + sessionProfileId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createSession");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createSession");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createSession");}}
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
        log.debug("setSessionProfileId called. sessionId: "
            + sessionId + " sessionProfileId: " + sessionProfileId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set session_profile_id = ? where " +
                     "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setSessionProfileId sessionProfileId: " + sessionProfileId + " sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setSessionProfileId sessionProfileId: " + sessionProfileId + " sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in setSessionProfileId sessionProfileId: " + sessionProfileId + " sessionId: " + sessionId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSessionProfileId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSessionProfileId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSessionProfileId");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param userId
     */
    public void setUserId(long sessionId, long userId)
            throws RemoteException {
        log.debug("setUserId called. sessionId: "
                 + sessionId + " userId: " + userId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set user_id = ? where " +
                "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, userId);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setUserId sessionId: " + sessionId + " userId: " + userId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setUserId sessionId: " + sessionId + " userId: " + userId);
        } catch (Exception e) {
            throw new EJBException("Exception in setUserId sessionId: " + sessionId + " userId: " + userId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setUserId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setUserId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setUserId");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param beginTime
     */
    public void setBeginTime(long sessionId, Date beginTime)
            throws RemoteException {

        log.debug("setBeginTime called. sessionId: "
            + sessionId + " beginTime: " + beginTime);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set begin_time = ? where " +
                "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setDate(1, beginTime);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setBeginTime sessionId: " + sessionId + " beginTime: " + beginTime);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setBeginTime sessionId: " + sessionId + " beginTime: " + beginTime);
        } catch (Exception e) {
            throw new EJBException("Exception in setBeginTime sessionId: " + sessionId + " beginTime: " + beginTime);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setBeginTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setBeginTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setBeginTime");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param endTime
     */
    public void setEndTime(long sessionId, Date endTime)
            throws RemoteException {
        log.debug("setEndTime called. sessionId: "
            + sessionId + " beginTime: " + endTime);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set end_time = ? where " +
                "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setDate(1, endTime);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setBeginTime sessionId: " + sessionId + " endTime: " + endTime);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setBeginTime sessionId: " + sessionId + " endTime: " + endTime);
        } catch (Exception e) {
            throw new EJBException("Exception in setBeginTime sessionId: " + sessionId + " endTime: " + endTime);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setBeginTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setBeginTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setBeginTime");}}
       }
    }

    /**
     *
     * @param sessionId
     * @param sendRepEmail
     */
    public void setSendRepEmail(long sessionId, boolean sendRepEmail)
            throws RemoteException {
        log.debug("setSendRepEmail called. sessionId: "
                 + sessionId + " sendRepEmail: " + sendRepEmail);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set send_rep_email = ? where " +
                "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setBoolean(1, sendRepEmail);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setSendRepEmail sessionId: " + sessionId + " sendRepEmail: " + sendRepEmail);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setSendRepEmail sessionId: " + sessionId + " sendRepEmail: " + sendRepEmail);
        } catch (Exception e) {
            throw new EJBException("Exception in setSendRepEmail sessionId: " + sessionId + " sendRepEmail: " + sendRepEmail);
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
    public void setSendCandidateEmail(long sessionId, boolean sendCandidateEmail)
            throws RemoteException {
        log.debug("setSendRepEmail called. sessionId: "
                 + sessionId + " sendCandidateEmail: " + sendCandidateEmail);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set send_candidate_email = ? where " +
                "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setBoolean(1, sendCandidateEmail);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setSendCandidateEmail sessionId: " + sessionId + " sendCandidateEmail: " + sendCandidateEmail);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setSendCanidateEmail sessionId: " + sessionId + " sendCandidateEmail: " + sendCandidateEmail);
        } catch (Exception e) {
            throw new EJBException("Exception in setSendCanidateEmail sessionId: " + sessionId + " sendCandidateEmail: " + sendCandidateEmail);
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
        log.debug("setSendRepEmail called. sessionId: "
                 + sessionId + " createUserId: " + createUserId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session set create_user_id = ? where " +
                "session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, createUserId);
            pstmt.setLong(2, sessionId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setCreateUserId sessionId: " + sessionId + " createUserId: " + createUserId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setCreateUserId sessionId: " + sessionId + " createUserId: " + createUserId);
        } catch (Exception e) {
            throw new EJBException("Exception in setCreateUserId sessionId: " + sessionId + " createUserId: " + createUserId);
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
        log.debug("getSessionProfileId called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionProfileId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT session_profile_id from session where " +
                "session_id = ?");

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
            throw new EJBException("SQLException in getSessionProfileId sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSessionProfileId sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSessionProfileId sessionId: " + sessionId);
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
        log.debug("getUserId called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long userId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT user_id from session where session_id = ?");

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
            throw new EJBException("SQLException in getUserId sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getUserId sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getUserId sessionId: " + sessionId);
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
     * @return Date of beginning session time
     */
    public Date getBeginTime(long sessionId)
            throws RemoteException {
        log.debug("getBeginTime called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date beginTime = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT begin_time from session where session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                beginTime = rs.getDate(1);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getBeginTime sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getBeginTime sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getBeginTime sessionId: " + sessionId);
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
     * @return Date of ending session time
     */
    public Date getEndTime(long sessionId)
            throws RemoteException {
        log.debug("getEndTime called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        Date endTime = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT end_time from session where session_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                endTime = rs.getDate(1);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getEndTime sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getEndTime sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getEndTime sessionId: " + sessionId);
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
        log.debug("getSendRepEmail called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        boolean sendRepEmail = false;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT send_rep_email from session where session_id = ?");

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
            throw new EJBException("SQLException in getSendRepEmail sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSendRepEmail sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSendRepEmail sessionId: " + sessionId);
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
        log.debug("getSendCandidateEmail called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        boolean sendCandidateEmail = false;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT send_candidate_email from session where session_id = ?");

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
            throw new EJBException("SQLException in getSendCandidateEmail sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSendCandidateEmail sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSendCandidateEmail sessionId: " + sessionId);
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
        log.debug("getCreateUserId called. sessionId: " + sessionId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long createUserId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT create_user_id from session where session_id = ?");

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
            throw new EJBException("SQLException in getCreateUserId sessionId: " + sessionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getCreateUserId sessionId: " + sessionId);
        } catch (Exception e) {
            throw new EJBException("Exception in getCreateUserId sessionId: " + sessionId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCreateUserId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCreateUserId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCreateUserId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCreateUserId");}}
        }

        return createUserId;
    }
}