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
    private static final String dsName = "java:comp/env/datasource";
    private static final String transDsName = "java:comp/env/jts_datasource";

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
                                            int sortOrder,
                                            long sessionRoundId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);
        varBuf.append(" problemTypeId: ");
        varBuf.append(problemTypeId);
        varBuf.append(" sortOrder: ");
        varBuf.append(sortOrder);
        varBuf.append(" sessionRoundId: ");
        varBuf.append(sessionRoundId);

        debugBuf.append("createSessionProfileProblem called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(240);

            query.append("INSERT INTO session_profile_problem_xref ");
            query.append("(session_profile_id, problem_id, problem_type_id, ");
            query.append("sort_order, ");
            query.append("session_round_id) VALUES(?,?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            pstmt.setLong(2,problemId);
            pstmt.setInt(3,problemTypeId);
            pstmt.setInt(4,sortOrder);
            pstmt.setLong(5,sessionRoundId);

            pstmt.executeUpdate();
            
        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createSessionProfileProblem. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in createSessionProfileProblem. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createSessionProfileProblem. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
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
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);
        varBuf.append(" problemTypeId: ");
        varBuf.append(problemTypeId);

        debugBuf.append("setProblemTypeId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);

            query.append("UPDATE session_profile_problem_xref ");
            query.append("SET problem_type_id = ? WHERE ");
            query.append("session_profile_id = ? AND problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, problemTypeId);
            pstmt.setLong(2, sessionProfileId);
            pstmt.setLong(3, problemId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in setProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
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
     * @param problemTypeId
     * @param sortOrder
     * @throws RemoteException
     */
    public void setSortOrder(long sessionProfileId, long problemId,
                             int problemTypeId,
                             int sortOrder)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);
        varBuf.append(" problemTypeId: ");
        varBuf.append(problemTypeId);
        varBuf.append(" sortOrder: ");
        varBuf.append(sortOrder);

        debugBuf.append("setSortOrder called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("UPDATE session_profile_problem_xref ");
            query.append("SET sort_order = ? WHERE ");
            query.append("session_profile_id = ? AND problem_id = ?");
            query.append(" AND problem_type_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, sortOrder);
            pstmt.setLong(2, sessionProfileId);
            pstmt.setLong(3, problemId);
            pstmt.setInt(4, problemTypeId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in setSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
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
     * @param problemTypeId
     * @param sessionRoundId
     * @throws RemoteException
     */
    public void setSessionRoundId(long sessionProfileId,
                                  long problemId,
                                  int problemTypeId,
                                  long sessionRoundId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);
        varBuf.append(" problemTypeId: ");
        varBuf.append(problemTypeId);
        varBuf.append(" sessionRoundId: ");
        varBuf.append(sessionRoundId);

        debugBuf.append("setSessionRoundId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("UPDATE session_profile_problem_xref ");
            query.append("SET session_round_id = ? WHERE ");
            query.append("session_profile_id = ? AND problem_id = ?");
            query.append(" AND problem_type_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, sessionRoundId);
            pstmt.setLong(2, sessionProfileId);
            pstmt.setLong(3, problemId);
            pstmt.setInt(4, problemTypeId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in setSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSessionRoundId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSessionRoundId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSessionRoundId");}}
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
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);

        debugBuf.append("getProblemTypeId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int problemTypeId = -1;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("SELECT problem_type_id ");
            query.append("FROM session_profile_problem_xref ");
            query.append("WHERE session_profile_id = ? AND problem_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, problemId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                problemTypeId = rs.getInt(1);
            }

        } catch (SQLException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in getProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
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
    public int getSortOrder(long sessionProfileId,
                            long problemId,
                            int problemTypeId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);
        varBuf.append(" problemTypeId: ");
        varBuf.append(problemTypeId);

        debugBuf.append("getSortOrder called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int sortOrder = -1;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("SELECT problem_type_id ");
            query.append("FROM session_profile_problem_xref ");
            query.append("WHERE session_profile_id = ? AND problem_id = ?");
            query.append(" AND problem_type_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, problemId);
            pstmt.setInt(3, problemTypeId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                sortOrder = rs.getInt(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in getSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSortOrder");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore){log.error("FAILED to close PreparedStatement in getSortOrder");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore){log.error("FAILED to close Connection in getSortOrder");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore){log.error("FAILED to close Context in getSortOrder");}}
        }

        return sortOrder;
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return long of sessionRoundId
     * @throws RemoteException
     */
    public long getSessionRoundId(long sessionProfileId,
                                  long problemId,
                                  int problemTypeId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);

        debugBuf.append("getSessionRoundId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionRoundId = -1;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("SELECT session_round_id ");
            query.append("FROM session_profile_problem_xref ");
            query.append("WHERE session_profile_id = ? AND problem_id = ?");
            query.append(" AND problem_type_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setLong(1, sessionProfileId);
            pstmt.setLong(2, problemId);
            pstmt.setInt(3, problemTypeId);

            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                sessionRoundId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSessionRoundId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore){log.error("FAILED to close PreparedStatement in getSessionRoundId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore){log.error("FAILED to close Connection in getSessionRoundId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore){log.error("FAILED to close Context in getSessionRoundId");}}
        }

        return sessionRoundId;
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return problemTypeDesc
     * @throws RemoteException
     */

    /*
    public String getProblemTypeDesc(long sessionProfileId, long problemId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" problemId: ");
        varBuf.append(problemId);

        debugBuf.append("getProblemTypeDesc called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String problemTypeDesc = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("SELECT problem_type_desc ");
            query.append("FROM session_profile_problem_xref ");
            query.append("WHERE session_profile_id = ? AND problem_id = ?");

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
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getProblemTypeDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in getProblemTypeDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getProblemTypeDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getProblemTypeDesc");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getProblemTypeDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getProblemTypeDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getProblemTypeDesc");}}
        }
        return problemTypeDesc;
    }
    */
}