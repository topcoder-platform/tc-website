package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.*;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$ 
 * Dec 23, 2002 12:44:49 AM
 */
public class SessionProfileBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionProfileBean.class);
    private static final String dataSourceName = "SCREENING_OLTP";

    /**
     *
     * @param desc
     * @param roundId
     * @return The sessionProfileId created for this entry
     * @throws RemoteException
     */
    public long createSessionProfile(String desc, long roundId)
            throws RemoteException {

        log.debug("createSessionProfile called. desc: "
                + desc + " roundId: " + roundId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionId = 0;

        try {
            StringBuffer query = new StringBuffer();

            query.append("INSERT INTO session_profile (session_profile_id, " +
                    "session_profile_desc, round_id, modify_date, create_date)"
                    + " values(?,?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_PROFILE_SEQ");
            pstmt.setLong(1,sessionId);
            pstmt.setString(2, desc);
            pstmt.setLong(3, roundId);

            int rowNum = pstmt.executeUpdate();
            if (rowNum != sessionId)
                throw new EJBException("row number does not match with primary key session id. row num:  "
                        + rowNum + " sessionId: "
                        + sessionId + " in createSessionProfile");

        } catch (SQLException sqe) {
            throw new EJBException("SQLException creating Session Profile roundId: " + roundId + " desc: " + desc);
        } catch (NamingException e) {
            throw new EJBException("NamingException creating Session Profile roundId: " + roundId + " desc: " + desc);
        } catch (Exception e) {
            throw new EJBException("Exception creating Session Profile roundId: " + roundId + " desc: " + desc);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createSessionProfile");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createSessionProfile");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createSessionProfile");}}
        }
        return sessionId;
    }

    /**
     *
     * @param sessionProfileId
     * @param desc
     * @throws RemoteException
     */
    public void setSessionProfileDesc(long sessionProfileId, String desc)
            throws RemoteException {

        log.debug("setSessionProfileDesc called. desc: "
                 + desc + " sessionProfileId: " + sessionProfileId);

         Context ctx = null;
         PreparedStatement pstmt = null;
         Connection conn = null;
         DataSource ds = null;

         try {
             StringBuffer query = new StringBuffer();

             query.append("UPDATE session_profile set desc = ? where " +
                     "session_profile_id = ?");

             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             pstmt = conn.prepareStatement(query.toString());

             pstmt.setString(1, desc);
             pstmt.setLong(2, sessionProfileId);

             pstmt.executeUpdate();

         } catch (SQLException sqe) {
             throw new EJBException("SQLException in setSessioProfileDesc sessionProfileId: " + sessionProfileId + " desc: " + desc);
         } catch (NamingException e) {
             throw new EJBException("NamingException in setSessioProfileDesc sessionProfileId: " + sessionProfileId + " desc: " + desc);
         } catch (Exception e) {
             throw new EJBException("Exception in setSessioProfileDesc sessionProfileId: " + sessionProfileId + " desc: " + desc);
         } finally {
             if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSessionProfileDesc");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSessionProfileDesc");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSessionProfileDesc");}}
         }
    }

    /**
     *
     * @param sessionProfileId
     * @param roundId
     * @throws RemoteException
     */
    public void setRoundId(long sessionProfileId, long roundId)
            throws RemoteException {
        log.debug("setRoundId called. sessionProfileId: "
                 + sessionProfileId + " roundId: " + roundId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append("UPDATE session_profile set round_id = ? where " +
                     "session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, roundId);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();

         } catch (SQLException sqe) {
            throw new EJBException("SQLException in setRoundId sessionProfileId: " + sessionProfileId + " roundId: " + roundId);
         } catch (NamingException e) {
            throw new EJBException("NamingException in setRoundId sessionProfileId: " + sessionProfileId + " roundId: " + roundId);
         } catch (Exception e) {
            throw new EJBException("Exception in setRoundId sessionProfileId: " + sessionProfileId + " roundId: " + roundId);
         } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setRoundId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setRoundId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setRoundId");}}
         }
    }

    /**
     *
     * @param sessionProfileId
     * @return SessionProfile description corresponding to the sessionProfileId
     * @throws RemoteException
     */
    public String getSessionProfileDesc(long sessionProfileId)
            throws RemoteException {
        log.debug("getSessionProfileDesc called. sessionProfileId: "
                 + sessionProfileId);

        Context ctx = null;
        Statement stmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        String desc = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT session_profile_desc from session_profile " +
                     " where session_profile_id = " + sessionProfileId);

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            stmt = conn.createStatement();

            rs = stmt.executeQuery(query.toString());
            if ( rs.next() ) {
                desc = rs.getString(1);
            }
            else{
                throw new EJBException("EJBException in getSessionProfileDesc"
                + " empty result set for session id:  " + sessionProfileId);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getSessionProfileDesc sessionProfileId: " + sessionProfileId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getSessionProfileDesc sessionProfileId: " + sessionProfileId);
        } catch (Exception e) {
            throw new EJBException("Exception in getSessionProfileDesc sessionProfileId: " + sessionProfileId);
        } finally {
            if (stmt != null) {try {stmt.close();} catch (Exception ignore) {log.error("FAILED to close Statement in getSessionProfileDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSessionProfileDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSessionProfileDesc");}}
        }
        return desc;
    }

    /**
     *
     * @param sessionProfileId
     * @return the round Id corresponding to the sessionProfileId passed in.
     * @throws RemoteException
     */
    public long getRoundId(long sessionProfileId)
            throws RemoteException {
        log.debug("getRoundId called. sessionProfileId: " + sessionProfileId);

        Context ctx = null;
        Statement stmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        long roundId = 0;

        try {
            StringBuffer query = new StringBuffer();

            query.append("SELECT round_id from session_profile " +
                     " where session_profile_id = " + sessionProfileId);

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            stmt = conn.createStatement();

            rs = stmt.executeQuery(query.toString());
            if ( rs.next() ) {
                roundId = rs.getLong(1);
            }
            else{
                throw new EJBException("EJBException in getRoundId"
                + " empty result set for session id:  " + sessionProfileId);
            }

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in getRoundId sessionProfileId: " + sessionProfileId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in getRoundId sessionProfileId: " + sessionProfileId);
        } catch (Exception e) {
            throw new EJBException("Exception in getRoundId sessionProfileId: " + sessionProfileId);
        } finally {
            if (stmt != null) {try {stmt.close();} catch (Exception ignore) {log.error("FAILED to close Statement in getRoundId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getRoundId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getRoundId");}}
        }
        return roundId;
    }
}