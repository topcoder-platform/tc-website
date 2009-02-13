package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
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
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 23, 2002 12:44:49 AM
 */
public class SessionProfileBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionProfileBean.class);
    private static final String dsName = "java:comp/env/datasource";
    private static final String transDsName = "java:comp/env/jts_datasource";

    /**
     *
     * @param desc
     * @param sessionRoundId
     * @param companyId
     * @return The sessionProfileId created for this entry
     * @throws RemoteException
     */
    public long createSessionProfile(String desc, long sessionRoundId,
                                     long companyId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("desc: ");
        varBuf.append(desc);
        varBuf.append(" sessionRoundId: ");
        varBuf.append(sessionRoundId);
        varBuf.append(" companyId: ");
        varBuf.append(companyId);

        debugBuf.append("createSessionProfile called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        long sessionId = 0;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO session_profile (session_profile_id, ");
            query.append("session_profile_desc, session_round_id, ");
            query.append("company_id) ");
            query.append("VALUES(?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_PROFILE_SEQ");
            pstmt.setLong(1, sessionId);
            pstmt.setString(2, desc);
            pstmt.setLong(3, sessionRoundId);
            pstmt.setLong(4, companyId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET desc = ? WHERE ");
            query.append("session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setString(1, desc);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setSessionProfileDesc");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setSessionProfileDesc");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setSessionProfileDesc");}}
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param sessionRoundId
     * @throws RemoteException
     */
    public void setSessionRoundId(long sessionProfileId, long sessionRoundId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET session_round_id = ? ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, sessionRoundId);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();
         } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
     * @param companyId
     * @throws RemoteException
     */
    public void setCompanyId(long sessionProfileId, long companyId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET company_id = ? WHERE ");
            query.append("session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, companyId);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCompanyId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCompanyId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCompanyId");}}
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        String desc = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT session_profile_desc FROM session_profile ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, sessionProfileId);
            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                desc = rs.getString(1);
            }
            else{
                throw new EJBException("EJBException in getSessionProfileDesc."
                + " empty result set for query:  " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSessionProfileDesc");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSessionProfileDesc");}}
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
    public long getSessionRoundId(long sessionProfileId)
            throws RemoteException {
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
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        long roundId = 0;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("SELECT session_round_id FROM session_profile ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                roundId = rs.getLong(1);
            }
            else{
                throw new EJBException("EJBException in getSessionRoundId. "
                    + " empty result set for query:  " + query.toString());

            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getSessionRoundId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getSessionRoundId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getSessionRoundId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getSessionRoundId");}}
        }
        return roundId;
    }

    /**
     *
     * @param sessionProfileId
     * @return long of companyId
     * @throws RemoteException
     */
    public long getCompanyId(long sessionProfileId)
            throws RemoteException {
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
      PreparedStatement pstmt = null;
      Connection conn = null;
      DataSource ds = null;
      ResultSet rs = null;
      long companyId = 0;

      try {
          StringBuffer query = new StringBuffer(120);
          query.append("SELECT division_id FROM session_profile ");
          query.append("WHERE session_profile_id = ?");

          ctx = new InitialContext();
          ds = (DataSource)ctx.lookup(dsName);
          conn = ds.getConnection();
          pstmt = conn.prepareStatement(query.toString());

          pstmt.setLong(1,sessionProfileId);
          rs = pstmt.executeQuery();
          if ( rs.next() ) {
              companyId = rs.getLong(1);
          }
          else{
              throw new EJBException("EJBException in getCompanyId. "
                  + " empty result set for query:  " + query.toString());
          }

      } catch (SQLException sqe) {
          DBMS.printSqlException(true,sqe);
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
          if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCompanyId");}}
          if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCompanyId");}}
          if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCompanyId");}}
          if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCompanyId");}}
      }
      return companyId;
    }
}

