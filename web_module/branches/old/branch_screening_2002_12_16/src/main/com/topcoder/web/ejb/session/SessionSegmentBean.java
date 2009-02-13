package com.topcoder.web.ejb.session;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.*;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$ 
 * Jan 9, 2003 2:17:44 AM
 */
public class SessionSegmentBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionSegmentBean.class);
    private static final String dataSourceName = "java:comp/env/datasource";
    private static final String txDataSourceName = "java:comp/env/txdatasource";

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param segmentLength
     * @throws RemoteException
     */
    public void createSessionSegment(long sessionId,
                                     long sessionSegmentId,
                                     long segmentLength)
            throws RemoteException {
        log.debug("createCoder called. sessionId: " + sessionId +
                "sessionSegmentId: " + sessionSegmentId +
                "segmentLength: " + segmentLength);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(240);

            query.append("INSERT INTO session_segment (session_id,");
            query.append("session_segment_id,");
            query.append("segment_length)");
            query.append(" VALUES(?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionId);
            pstmt.setLong(2,sessionSegmentId);

            pstmt.setLong(3,segmentLength);
            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in createSessionSegment sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } catch (NamingException e) {
            throw new EJBException("NamingException in createSessionSegment sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } catch (Exception e) {
            throw new EJBException("Exception in createSessionSegment sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createSessionSegment");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createSessionSegment");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createSessionSegment");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param startTime
     * @throws RemoteException
     */
    public void setStartTime(long sessionId,
                             long sessionSegmentId,
                             Date startTime)
            throws RemoteException {

        log.debug("setStartTime called. sessionId: "
                 + sessionId + " sessionSegmentId: " + sessionSegmentId
                + " startTime: " + startTime);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_segment SET start_time = ? WHERE ");
            query.append("session_id = ? AND session_segment_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setDate(1, startTime);
            pstmt.setLong(2, sessionId);
            pstmt.setLong(3, sessionSegmentId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setStartTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " startTime: " + startTime);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setStartTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " startTime: " + startTime);
        } catch (Exception e) {
            throw new EJBException("Exception in setStartTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " startTime: " + startTime);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setStartTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setStartTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setStartTime");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param endTime
     * @throws RemoteException
     */
    public void setEndTime(long sessionId,
                           long sessionSegmentId,
                           Date endTime)
            throws RemoteException {
        log.debug("setEndTime called. sessionId: "
                 + sessionId + " sessionSegmentId: " + sessionSegmentId
                + " endTime: " + endTime);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_segment SET end_time = ? WHERE ");
            query.append("session_id = ? AND session_segment_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setDate(1, endTime);
            pstmt.setLong(2, sessionId);
            pstmt.setLong(3, sessionSegmentId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setEndTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " endTime: " + endTime);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setEndTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " endTime: " + endTime);
        } catch (Exception e) {
            throw new EJBException("Exception in setEndTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " endTime: " + endTime);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setEndTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setEndTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setEndTime");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param segmentLength
     * @throws RemoteException
     */
    public void setSegmentLength(long sessionId,
                                 long sessionSegmentId,
                                 long segmentLength)
            throws RemoteException {
        log.debug("setSegmentLength called. sessionId: "
                 + sessionId + " sessionSegmentId: " + sessionSegmentId
                + " segmentLength: " + segmentLength);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_segment SET segment_length = ? ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(txDataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, segmentLength);
            pstmt.setLong(2, sessionId);
            pstmt.setLong(3, sessionSegmentId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setSegmentLength sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setSegmentLength sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } catch (Exception e) {
            throw new EJBException("Exception in setSegmentLength sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSegmentLength");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSegmentLength");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSegmentLength");}}
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment startTime Date
     * @throws RemoteException
     */
    public Date getStartTime(long sessionId, long sessionSegmentId)
            throws RemoteException {
        log.debug("getStartTime called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        Date startTime = null;

        try {
            StringBuffer query = new StringBuffer(120);

            query.append("SELECT start_time FROM session_segment ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);
            pstmt.setLong(2, sessionSegmentId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                startTime = rs.getDate(1);
            }
            else{
                throw new EJBException("EJBException in getStartTime."
                + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getStartTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getStartTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getStartTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getStartTime");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close Statement in getStartTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getStartTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getStartTime");}}
        }
        return startTime;
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment endTime Date
     * @throws RemoteException
     */
    public Date getEndTime(long sessionId, long sessionSegmentId)
            throws RemoteException {
        log.debug("getEndTime called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        Date endTime = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT end_time FROM session_segment ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);
            pstmt.setLong(2, sessionSegmentId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                endTime = rs.getDate(1);
            }
            else{
                throw new EJBException("EJBException in getEndTime."
                + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getEndTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getEndTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getEndTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getEndTime");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close Statement in getEndTime");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getEndTime");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getEndTime");}}
        }
        return endTime;
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return segmentLength in millesecs
     * @throws RemoteException
     */
    public long getSegmentLength(long sessionId, long sessionSegmentId)
            throws RemoteException {
        log.debug("getEndTime called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        long segmentLength = 0;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT segment_length FROM session_segment ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);
            pstmt.setLong(2, sessionSegmentId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                segmentLength = rs.getLong(1);
            }
            else{
                throw new EJBException("EJBException in getEndTime."
                + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getSegmentLength sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSegmentLength sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSegmentLength sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSegmentLength");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close Statement in getSegmentLength");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSegmentLength");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSegmentLength");}}
        }
        return segmentLength;
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegement Description
     * @throws RemoteException
     */

    public String getSessionSegmentDesc(long sessionId, long sessionSegmentId)
            throws RemoteException {
        log.debug("getSessionSegmentDesc called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        String sessionSegmentDesc = null;

        try {
            StringBuffer query = new StringBuffer(300);

            query.append("SELECT session_segment_desc ");
            query.append("FROM session_segment a, session_segment_lu b ");
            query.append("WHERE a.session_id = ? ");
            query.append("AND a.session_segment_id = ? ");
            query.append("AND a.session_segment_id = b.session_segment_id");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionId);
            pstmt.setLong(2, sessionSegmentId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                sessionSegmentDesc = rs.getString(1);
            }
            else{
                throw new EJBException("EJBException in getSessionSegmentDesc."
                + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getSessionSegmentDesc sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSessionSegmentDesc sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSessionSegmentDesc sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSessionSegmentDesc");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close Statement in getSessionSegmentDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSessionSegmentDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSessionSegmentDesc");}}
        }
        return sessionSegmentDesc;
    }
}
