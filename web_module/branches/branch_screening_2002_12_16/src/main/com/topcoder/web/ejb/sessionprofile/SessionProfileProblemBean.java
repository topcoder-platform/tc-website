package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$ 
 * Jan 3, 2003 2:13:50 AM
 */
public class SessionProfileProblemBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionProfileProblemBean.class);
    private static final String dataSourceName = "SCREENING_OLTP";
    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sortOrder
     * @throws RemoteException
     */
    public void createSessionProfileProblem(long sessionProfileId,
                                            long problemId,
                                            int problemTypeId,
                                            int sortOrder)
            throws RemoteException {
        log.debug("createSessionProfileProblem called. sessionProfileId: "
            + sessionProfileId + " problemId: " + problemId
            + " problemTypeId: " + problemTypeId + " sortOrder: " + sortOrder );

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("INSERT INTO session_profile_problem_xref (session_profile_id, " +
                "problem_id, problem_type_id, sort_order, modify_date, " +
                "create_date) values(?,?,?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            pstmt.setLong(2,problemId);
            pstmt.setInt(3,problemTypeId);
            pstmt.setInt(4,sortOrder);

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in createSessionProfileProblem session_profile_id: " + sessionProfileId + " problemId: " + problemId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in createSessionProfileProblem session_profile_id: " + sessionProfileId + " problemId: " + problemId);
        } catch (Exception e) {
            throw new EJBException("Exception in createSessionProfileProblem session_profile_id: " + sessionProfileId + " problemId: " + problemId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createSessionProfileProblem");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createSessionProfileProblem");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createSessionProfileProblem");}}
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @throws RemoteException
     */
    public void setProblemTypeId(long sessionProfileId,
                                 long problemId,
                                 int problemTypeId)
            throws RemoteException {
        log.debug("setProblemTypeId called. sessionProfileId: "
            + sessionProfileId + " problemId: " + problemId + "problemTypeId: "
            + problemTypeId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session_profile_problem_xref set problem_type_id = ? where " +
                     "session_profile_id = ? and problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, problemTypeId);
            pstmt.setLong(2, sessionProfileId);
            pstmt.setLong(3, problemId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setProblemTypeId sessionProfileId: " + sessionProfileId + " problemId: " + problemId + " problemTypeId: " + problemTypeId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setProblemTypeId sessionProfileId: " + sessionProfileId + " problemId: " + problemId + " problemTypeId: " + problemTypeId);
        } catch (Exception e) {
            throw new EJBException("Exception in setProblemTypeId sessionProfileId: " + sessionProfileId + " problemId: " + problemId + " problemTypeId: " + problemTypeId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setProblemTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setProblemTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setProblemTypeId");}}
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param sortOrder
     * @throws RemoteException
     */
    public void setSortOrder(long sessionProfileId, long problemId,
                             int sortOrder)
            throws RemoteException {
        log.debug("setSortOrder called. sessionProfileId: "
            + sessionProfileId + " problemId: " + problemId + "sortOrder: "
            + sortOrder);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE session_profile_problem_xref set sort_order = ? where " +
                     "session_profile_id = ? and problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, sortOrder);
            pstmt.setLong(2, sessionProfileId);
            pstmt.setLong(3, problemId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setSortOrder sessionProfileId: " + sessionProfileId + " problemId: " + problemId + " sortOrder: " + sortOrder);
        } catch (NamingException e) {
            throw new EJBException("NamingException in setSortOrder sessionProfileId: " + sessionProfileId + " problemId: " + problemId + " sortOrder: " + sortOrder);
        } catch (Exception e) {
            throw new EJBException("Exception in setSortOrder sessionProfileId: " + sessionProfileId + " problemId: " + problemId + " sortOrder: " + sortOrder);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSortOrder");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSortOrder");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSortOrder");}}
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return problem type id enum from database. -1 if error occurs.
     * @throws RemoteException
     */
    public int getProblemTypeId(long sessionProfileId, long problemId)
            throws RemoteException {
        log.debug("getProblemTypeId called. sessionProfileId: "
                + sessionProfileId + " problemId: " + problemId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int problemTypeId = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT problem_type_id from session_profile_problem_xref "
                + " where session_profile_id = ? and problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, problemId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                problemTypeId = rs.getInt(1);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getProblemTypeId sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getProblemTypeId sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } catch (Exception e) {
            throw new EJBException("Exception in getProblemTypeId sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getProblemTypeId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getProblemTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getProblemTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getProblemTypeId");}}
        }

        return problemTypeId;
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return sort Order int. -1 if error occurs
     * @throws RemoteException
     */
    public int getSortOrder(long sessionProfileId, long problemId)
            throws RemoteException {
        log.debug("getSortOrder called. sessionProfileId: "
                + sessionProfileId + " problemId: " + problemId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int sortOrder = -1;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT problem_type_id from session_profile_problem_xref "
                + " where session_profile_id = ? and problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, problemId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                sortOrder = rs.getInt(1);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getSortOrder sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSortOrder sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSortOrder sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSortOrder");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSortOrder");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSortOrder");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSortOrder");}}
        }

        return sortOrder;
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return problemTypeDesc
     * @throws RemoteException
     */
    public String getProblemTypeDesc(long sessionProfileId, long problemId)
            throws RemoteException {
        log.debug("getProblemTypeDesc called. sessionProfileId: "
                + sessionProfileId + " problemId: " + problemId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String problemTypeDesc = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT problem_type_desc from session_profile_problem_xref "
                + " where session_profile_id = ? and problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, problemId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                problemTypeDesc = rs.getString(1);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getProblemTypeDesc sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getProblemTypeDesc sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } catch (Exception e) {
            throw new EJBException("Exception in getProblemTypeDesc sessionProfileId: " + sessionProfileId + " problemId: " + problemId);
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getProblemTypeDesc");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getProblemTypeDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getProblemTypeDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getProblemTypeDesc");}}
        }

        return problemTypeDesc;
    }
}