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
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 23, 2002 12:44:49 AM
 */
public class SessionProfileBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SessionProfileBean.class);
    private static final String dataSourceName = "java:comp/env/datasource";

    /**
     *
     * @param desc
     * @param roundId
     * @param divisionId
     * @param companyId
     * @return The sessionProfileId created for this entry
     * @throws RemoteException
     */
    public long createSessionProfile(String desc, long roundId, int divisionId,
                                     long companyId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(400);
        StringBuffer varBuf = new StringBuffer(400);

        varBuf.append("desc: ");
        varBuf.append(desc);
        varBuf.append(" roundId: ");
        varBuf.append(roundId);
        varBuf.append(" divisionId: ");
        varBuf.append(divisionId);
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
            query.append("session_profile_desc, round_id, modify_date, ");
            query.append("create_date, division_id, company_id) ");
            query.append("VALUES(?,?,?,?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            sessionId = IdGeneratorClient.getSeqId("SESSION_PROFILE_SEQ");
            pstmt.setLong(1, sessionId);
            pstmt.setString(2, desc);
            pstmt.setLong(3, roundId);
            pstmt.setInt(6, divisionId);
            pstmt.setLong(7, companyId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("SQLException in createSessionProfile. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("NamingException in createSessionProfile. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
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
        StringBuffer debugBuf = new StringBuffer(400);
        StringBuffer varBuf = new StringBuffer(400);

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
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setString(1, desc);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();
        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("SQLException in setSessioProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("NamingException in setSessioProfileDesc. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("Exception in setSessioProfileDesc. ");
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
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET round_id = ? WHERE ");
            query.append("session_profile_id = ?");

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

    public void setDivisionId(long sessionProfileId, int divisionId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(400);
        StringBuffer varBuf = new StringBuffer(400);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" divisionId: ");
        varBuf.append(divisionId);

        debugBuf.append("setDivisionId called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("UPDATE session_profile SET division_id = ? WHERE ");
            query.append("session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, divisionId);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();
        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("SQLException in setDivisionId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("NamingException in setDivisionId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("Exception in setDivisionId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setDivisionId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setDivisionId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setDivisionId");}}
        }
    }

    public void setCompanyId(long sessionProfileId, long companyId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(400);
        StringBuffer varBuf = new StringBuffer(400);

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
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, companyId);
            pstmt.setLong(2, sessionProfileId);

            pstmt.executeUpdate();
        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("SQLException in setCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
            exceptionBuf.append("NamingException in setCompanyId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(400);
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
            ds = (DataSource)ctx.lookup(dataSourceName);
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
    public long getRoundId(long sessionProfileId)
            throws RemoteException {
          // construct debug message
        StringBuffer debugBuf = new StringBuffer(100);
        StringBuffer varBuf = new StringBuffer(100);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("getRoundId called. ");
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
            query.append("SELECT round_id FROM session_profile ");
            query.append("WHERE session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                roundId = rs.getLong(1);
            }
            else{
                throw new EJBException("EJBException in getRoundId. "
                    + " empty result set for query:  " + query.toString());

            }

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("SQLException in getRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("NamingException in getRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(100);
            exceptionBuf.append("NamingException in getRoundId. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getRoundId");}}
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getRoundId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getRoundId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getRoundId");}}
        }
        return roundId;
    }

    public int getDivisionId(long sessionProfileId)
            throws RemoteException {
        // construct debug message
      StringBuffer debugBuf = new StringBuffer(100);
      StringBuffer varBuf = new StringBuffer(100);

      varBuf.append("sessionProfileId: ");
      varBuf.append(sessionProfileId);

      debugBuf.append("getDivisionId called. ");
      debugBuf.append(varBuf.toString());

      log.debug(debugBuf.toString());

      // begin method
      Context ctx = null;
      PreparedStatement pstmt = null;
      Connection conn = null;
      DataSource ds = null;
      ResultSet rs = null;
      int divisionId = 0;

      try {
          StringBuffer query = new StringBuffer(120);
          query.append("SELECT division_id FROM session_profile ");
          query.append("WHERE session_profile_id = ?");

          ctx = new InitialContext();
          ds = (DataSource)ctx.lookup(dataSourceName);
          conn = ds.getConnection();
          pstmt = conn.prepareStatement(query.toString());

          pstmt.setLong(1,sessionProfileId);
          rs = pstmt.executeQuery();
          if ( rs.next() ) {
              divisionId = rs.getInt(1);
          }
          else{
              throw new EJBException("EJBException in getDivisionId. "
                  + " empty result set for query:  " + query.toString());

          }

      } catch (SQLException sqe) {
          StringBuffer exceptionBuf = new StringBuffer(100);
          exceptionBuf.append("SQLException in getDivisionId. ");
          exceptionBuf.append(varBuf.toString());
          throw new EJBException(exceptionBuf.toString());
      } catch (NamingException e) {
          StringBuffer exceptionBuf = new StringBuffer(100);
          exceptionBuf.append("NamingException in getDivisionId. ");
          exceptionBuf.append(varBuf.toString());
          throw new EJBException(exceptionBuf.toString());
      } catch (Exception e) {
          StringBuffer exceptionBuf = new StringBuffer(100);
          exceptionBuf.append("Exception in getDivisionId. ");
          exceptionBuf.append(varBuf.toString());
          throw new EJBException(exceptionBuf.toString());
      } finally {
          if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getDivisionId");}}
          if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getDivisionId");}}
          if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getDivisionId");}}
          if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getDivisionId");}}
      }
      return divisionId;
    }

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
          ds = (DataSource)ctx.lookup(dataSourceName);
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