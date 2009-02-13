package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.sql.*;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 23, 2002 12:44:49 AM
 */
public class SessionProfileBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionProfileBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    /**
     *
     * @param desc
     * @param companyId
     * @return The sessionProfileId created for this entry
     */
    public long createSessionProfile(String desc, long companyId) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("desc: ");
        varBuf.append(desc);
        varBuf.append(" companyId: ");
        varBuf.append(companyId);

        debugBuf.append("createSessionProfile called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionId = 0;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO session_profile (session_profile_id, ");
            query.append("session_profile_desc, company_id) ");
            query.append("VALUES(?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_PROFILE_SEQ");
            ps.setLong(1, sessionId);
            ps.setString(2, desc);
            ps.setLong(3, companyId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createSessionProfile. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in createSessionProfile. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createSessionProfile. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return sessionId;
    }

    /**
     *
     * @param sessionProfileId
     * @param desc
     */
    public void setSessionProfileDesc(long sessionProfileId, String desc) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" desc: ");
        varBuf.append(desc);

        debugBuf.append("setSessionProfileDesc called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET desc = ? WHERE ");
            query.append("session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setString(1, desc);
            ps.setLong(2, sessionProfileId);

            ps.executeUpdate();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setSessionProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in setSessionProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setSessionProfileDesc. ");
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
     * @param sessionRoundId
     */
    public void setSessionRoundId(long sessionProfileId, long sessionRoundId) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
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
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET session_round_id = ? ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionRoundId);
            ps.setLong(2, sessionProfileId);

            ps.executeUpdate();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
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
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param companyId
     */
    public void setCompanyId(long sessionProfileId, long companyId) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" companyId: ");
        varBuf.append(companyId);

        debugBuf.append("setCompanyId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET company_id = ? WHERE ");
            query.append("session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, companyId);
            ps.setLong(2, sessionProfileId);

            ps.executeUpdate();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in setCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in setCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in setCompanyId. ");
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
     * @return SessionProfile description corresponding to the sessionProfileId
     */
    public String getSessionProfileDesc(long sessionProfileId) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(100);
        StringBuffer varBuf = new StringBuffer(100);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("getSessionProfileDesc called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        String desc = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT session_profile_desc FROM session_profile ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            rs = ps.executeQuery();
            if (rs.next()) {
                desc = rs.getString(1);
            } else {
                throw new EJBException("EJBException in getSessionProfileDesc."
                        + " empty result set for query:  " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("SQLException in getSessionProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("NamingException in getSessionProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("Exception in getSessionProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return desc;
    }

    /**
     *
     * @param sessionProfileId
     * @return the round Id corresponding to the sessionProfileId passed in.
     */
    public long getSessionRoundId(long sessionProfileId) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(100);
        StringBuffer varBuf = new StringBuffer(100);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("getSessionRoundId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        long roundId = 0;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT session_round_id FROM session_profile ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            rs = ps.executeQuery();
            if (rs.next()) {
                roundId = rs.getLong(1);
            } else {
                throw new EJBException("EJBException in getSessionRoundId. "
                        + " empty result set for query:  " + query.toString());

            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("SQLException in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("NamingException in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("NamingException in getSessionRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return roundId;
    }

    /**
     *
     * @param sessionProfileId
     * @return long of companyId
     */
    public long getCompanyId(long sessionProfileId) {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(100);
        StringBuffer varBuf = new StringBuffer(100);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("getCompanyId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        long companyId = 0;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT division_id FROM session_profile ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            rs = ps.executeQuery();
            if (rs.next()) {
                companyId = rs.getLong(1);
            } else {
                throw new EJBException("EJBException in getCompanyId. "
                        + " empty result set for query:  " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("SQLException in getCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("NamingException in getCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("Exception in getCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return companyId;
    }
}

