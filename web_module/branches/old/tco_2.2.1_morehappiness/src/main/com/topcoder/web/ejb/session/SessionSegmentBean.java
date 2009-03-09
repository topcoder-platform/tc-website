package com.topcoder.web.ejb.session;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.*;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 9, 2003 2:17:44 AM
 */
public class SessionSegmentBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionSegmentBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param segmentLength
     */
    public void createSessionSegment(long sessionId,
                                     long sessionSegmentId,
                                     long segmentLength) {
        log.debug("createCoder called. sessionId: " + sessionId +
                "sessionSegmentId: " + sessionSegmentId +
                "segmentLength: " + segmentLength);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(240);

            query.append("INSERT INTO session_segment (session_id,");
            query.append("session_segment_id,");
            query.append("segment_length)");
            query.append(" VALUES(?,?,?) ");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionId);
            ps.setLong(2, sessionSegmentId);

            ps.setLong(3, segmentLength);
            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in createSessionSegment sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } catch (Exception e) {
            throw new EJBException("Exception in createSessionSegment sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param startTime
     */
    public void setStartTime(long sessionId,
                             long sessionSegmentId,
                             Date startTime) {

        log.debug("setStartTime called. sessionId: "
                + sessionId + " sessionSegmentId: " + sessionSegmentId
                + " startTime: " + startTime);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_segment SET start_time = ? WHERE ");
            query.append("session_id = ? AND session_segment_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setDate(1, startTime);
            ps.setLong(2, sessionId);
            ps.setLong(3, sessionSegmentId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setStartTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " startTime: " + startTime);
        } catch (Exception e) {
            throw new EJBException("Exception in setStartTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " startTime: " + startTime);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param endTime
     */
    public void setEndTime(long sessionId,
                           long sessionSegmentId,
                           Date endTime) {
        log.debug("setEndTime called. sessionId: "
                + sessionId + " sessionSegmentId: " + sessionSegmentId
                + " endTime: " + endTime);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_segment SET end_time = ? WHERE ");
            query.append("session_id = ? AND session_segment_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setDate(1, endTime);
            ps.setLong(2, sessionId);
            ps.setLong(3, sessionSegmentId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setEndTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " endTime: " + endTime);
        } catch (Exception e) {
            throw new EJBException("Exception in setEndTime sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " endTime: " + endTime);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @param segmentLength
     */
    public void setSegmentLength(long sessionId,
                                 long sessionSegmentId,
                                 long segmentLength) {
        log.debug("setSegmentLength called. sessionId: "
                + sessionId + " sessionSegmentId: " + sessionSegmentId
                + " segmentLength: " + segmentLength);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_segment SET segment_length = ? ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, segmentLength);
            ps.setLong(2, sessionId);
            ps.setLong(3, sessionSegmentId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setSegmentLength sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } catch (Exception e) {
            throw new EJBException("Exception in setSegmentLength sessionId: " + sessionId + "sessionSegmentId: " + sessionSegmentId + " segmentLength: " + segmentLength);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment startTime Date
     */
    public Date getStartTime(long sessionId, long sessionSegmentId) {
        log.debug("getStartTime called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        Date startTime = null;

        try {
            StringBuffer query = new StringBuffer(120);

            query.append("SELECT start_time FROM session_segment ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);
            ps.setLong(2, sessionSegmentId);

            rs = ps.executeQuery();
            if (rs.next()) {
                startTime = rs.getDate(1);
            } else {
                throw new EJBException("EJBException in getStartTime."
                        + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getStartTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getStartTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return startTime;
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegment endTime Date
     */
    public Date getEndTime(long sessionId, long sessionSegmentId) {
        log.debug("getEndTime called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        Date endTime = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT end_time FROM session_segment ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);
            ps.setLong(2, sessionSegmentId);

            rs = ps.executeQuery();
            if (rs.next()) {
                endTime = rs.getDate(1);
            } else {
                throw new EJBException("EJBException in getEndTime."
                        + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getEndTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getEndTime sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
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
     * @param sessionSegmentId
     * @return segmentLength in millesecs
     */
    public long getSegmentLength(long sessionId, long sessionSegmentId) {
        log.debug("getEndTime called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        long segmentLength = 0;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT segment_length FROM session_segment ");
            query.append("WHERE session_id = ? AND session_segment_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);
            ps.setLong(2, sessionSegmentId);

            rs = ps.executeQuery();
            if (rs.next()) {
                segmentLength = rs.getLong(1);
            } else {
                throw new EJBException("EJBException in getEndTime."
                        + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getSegmentLength sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSegmentLength sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return segmentLength;
    }

    /**
     *
     * @param sessionId
     * @param sessionSegmentId
     * @return SessionSegement Description
     */

    public String getSessionSegmentDesc(long sessionId, long sessionSegmentId) {
        log.debug("getSessionSegmentDesc called. sessionId: " + sessionId +
                " sessionSegmentId: " + sessionSegmentId);

        Context ctx = null;
        PreparedStatement ps = null;
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

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionId);
            ps.setLong(2, sessionSegmentId);

            rs = ps.executeQuery();
            if (rs.next()) {
                sessionSegmentDesc = rs.getString(1);
            } else {
                throw new EJBException("EJBException in getSessionSegmentDesc."
                        + " Empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getSessionSegmentDesc sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSessionSegmentDesc sessionId: " + sessionId + " sessionSegmentId: " + sessionSegmentId);
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return sessionSegmentDesc;
    }
}
