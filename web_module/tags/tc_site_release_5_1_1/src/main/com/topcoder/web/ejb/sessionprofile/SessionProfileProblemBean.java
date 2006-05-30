package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 3, 2003 2:13:50 AM
 */
public class SessionProfileProblemBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionProfileProblemBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sortOrder
     */
    public void createSessionProfileProblem(long sessionProfileId,
                                            long problemId,
                                            int problemTypeId,
                                            int sortOrder,
                                            long sessionRoundId) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(240);

            query.append("INSERT INTO session_profile_problem_xref ");
            query.append("(session_profile_id, problem_id, problem_type_id, ");
            query.append("sort_order, ");
            query.append("session_round_id) VALUES(?,?,?,?,?) ");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            ps.setLong(2, problemId);
            ps.setInt(3, problemTypeId);
            ps.setInt(4, sortOrder);
            ps.setLong(5, sessionRoundId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createSessionProfileProblem. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createSessionProfileProblem. ");
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
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     */
    public void setProblemTypeId(long sessionProfileId,
                                 long problemId,
                                 int problemTypeId) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);

            query.append("UPDATE session_profile_problem_xref ");
            query.append("SET problem_type_id = ? WHERE ");
            query.append("session_profile_id = ? AND problem_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setInt(1, problemTypeId);
            ps.setLong(2, sessionProfileId);
            ps.setLong(3, problemId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setProblemTypeId. ");
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
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sortOrder
     */
    public void setSortOrder(long sessionProfileId, long problemId,
                             int problemTypeId,
                             int sortOrder) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("UPDATE session_profile_problem_xref ");
            query.append("SET sort_order = ? WHERE ");
            query.append("session_profile_id = ? AND problem_id = ?");
            query.append(" AND problem_type_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setInt(1, sortOrder);
            ps.setLong(2, sessionProfileId);
            ps.setLong(3, problemId);
            ps.setInt(4, problemTypeId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setSortOrder. ");
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
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sessionRoundId
     */
    public void setSessionRoundId(long sessionProfileId,
                                  long problemId,
                                  int problemTypeId,
                                  long sessionRoundId) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("UPDATE session_profile_problem_xref ");
            query.append("SET session_round_id = ? WHERE ");
            query.append("session_profile_id = ? AND problem_id = ?");
            query.append(" AND problem_type_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionRoundId);
            ps.setLong(2, sessionProfileId);
            ps.setLong(3, problemId);
            ps.setInt(4, problemTypeId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setSessionRoundId. ");
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
     * @param sessionProfileId
     * @param problemId
     * @return problem type id enum from database. -1 if error occurs.
     */
    public int getProblemTypeId(long sessionProfileId, long problemId) {
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
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int problemTypeId = -1;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("SELECT problem_type_id ");
            query.append("FROM session_profile_problem_xref ");
            query.append("WHERE session_profile_id = ? AND problem_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionProfileId);
            ps.setLong(2, problemId);

            rs = ps.executeQuery();
            if (rs.next()) {
                problemTypeId = rs.getInt(1);
            }

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getProblemTypeId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return problemTypeId;
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return sort Order int. -1 if error occurs
     */
    public int getSortOrder(long sessionProfileId,
                            long problemId,
                            int problemTypeId) {
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
        PreparedStatement ps = null;
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

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionProfileId);
            ps.setLong(2, problemId);
            ps.setInt(3, problemTypeId);

            rs = ps.executeQuery();
            if (rs.next()) {
                sortOrder = rs.getInt(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getSortOrder. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return sortOrder;
    }

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return long of sessionRoundId
     */
    public long getSessionRoundId(long sessionProfileId,
                                  long problemId,
                                  int problemTypeId) {
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
        PreparedStatement ps = null;
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

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionProfileId);
            ps.setLong(2, problemId);
            ps.setInt(3, problemTypeId);

            rs = ps.executeQuery();
            if (rs.next()) {
                sessionRoundId = rs.getLong(1);
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return sessionRoundId;
    }


    /**
     *
     * @param sessionProfileId
     */
    public ResultSetContainer getProblems(long sessionProfileId) {
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("getProblems called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSetContainer ret = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append(" SELECT problem_id");
            query.append(" , session_round_id");
            query.append(" , problem_type_id");
            query.append(" FROM session_profile_problem_xref");
            query.append(" WHERE session_profile_id = ?");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionProfileId);

            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getProblems. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in getProblems. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getProblems. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return ret;
    }


}