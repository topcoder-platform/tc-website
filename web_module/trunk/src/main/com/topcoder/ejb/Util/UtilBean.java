package com.topcoder.ejb.Util;

import java.rmi.RemoteException;
import javax.naming.*;
import java.util.*;
import java.sql.*;
import javax.ejb.*;
import java.io.Serializable;
import weblogic.common.*;
import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.BaseEJB;

///////////////////////////////////////////////
public class UtilBean extends BaseEJB {
///////////////////////////////////////////////


  static final boolean VERBOSE = false;


  ////////////////////////////////////////////////////////////////////////////
  public java.sql.Date getCurrentDate () throws RemoteException {
  ////////////////////////////////////////////////////////////////////////////
    java.sql.Date result     = null;
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      /*********************************************************/
      /*************************Postgres************************/
      /*********************************************************/
      if ( DBMS.DB == DBMS.POSTGRES ) {
        ps = conn.prepareStatement( "SELECT CURRENT_TIMESTAMP" );
      }
      /*********************************************************/
      /*************************Informix************************/
      /*********************************************************/
      else if ( DBMS.DB == DBMS.INFORMIX ) {
        ps = conn.prepareStatement( "SELECT CURRENT FROM dual" );
      }
      rs = ps.executeQuery();
      if ( rs.next() ) result = rs.getDate(1);
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException("ejb.Util:getCurrentDate:ERROR:"+e);
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////
  public java.sql.Time getCurrentTime () throws RemoteException {
  ////////////////////////////////////////////////////////////////////////////
    java.sql.Time result     = null;
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      /*********************************************************/
      /*************************Postgres************************/
      /*********************************************************/
      if ( DBMS.DB == DBMS.POSTGRES ) {
        ps = conn.prepareStatement( "SELECT CURRENT_TIME" );
      }
      /*********************************************************/
      /*************************Informix************************/
      /*********************************************************/
      else if ( DBMS.DB == DBMS.INFORMIX ) {
        ps = conn.prepareStatement( "SELECT CURRENT FROM dual" );
      }
      rs = ps.executeQuery();
      if ( rs.next() ) result = rs.getTime(1);
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException("ejb.Util:getCurrentTime:ERROR:"+e);
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////
  public java.sql.Timestamp getCurrentTimestamp () throws RemoteException {
  ////////////////////////////////////////////////////////////////////////////
    java.sql.Timestamp result = null;
    java.sql.Connection conn  = null;
    PreparedStatement ps      = null;
    ResultSet rs              = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      /*********************************************************/
      /*************************Postgres************************/
      /*********************************************************/
      if ( DBMS.DB == DBMS.POSTGRES ) {
        ps = conn.prepareStatement( "SELECT CURRENT_TIMESTAMP" );
      }
      /*********************************************************/
      /*************************Informix************************/
      /*********************************************************/
      else if ( DBMS.DB == DBMS.INFORMIX ) {
        ps = conn.prepareStatement( "SELECT CURRENT FROM dual" );
      }
      rs = ps.executeQuery();
      if ( rs.next() ) result = rs.getTimestamp(1);
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException("ejb.Util:getCurrentTimestamp:ERROR:"+e);
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


  ////////////////////////////////////////////////////////
  public void insertJMSError ( int coderId, String msg ) {
  ////////////////////////////////////////////////////////
    if (VERBOSE) System.out.println ( "ejb.Util.insertJMSError():called." );
    /*********************************************************/
    String query             = "INSERT INTO jms_errors(coder_id,timestamp,message) VALUES(?,?,?)";
    /*********************************************************/
    PreparedStatement ps     = null;
    java.sql.Connection conn = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      conn.setAutoCommit ( true );
      ps = conn.prepareStatement ( query );
      ps.setInt    ( 1, coderId                               );
      ps.setLong   ( 2, DateTime.getCurrentTime(conn).getTime() );
      ps.setString ( 3, msg                                   );
      int rows = ps.executeUpdate ();
      if ( rows != 1 ) System.out.println ( 
        "ERROR: Failed to insert row into JMS_ERRORS" 
      );
    } catch ( Exception e ) { 
      e.printStackTrace();
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
      query = null;
    }
  }


  ////////////////////////////////////////////////////////////
  public void incrementAdvertiserHitCount ( int advertiserId ) 
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement   ps   = null;
    ResultSet rs = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query     = new StringBuffer ( 150  );
      /*********************************************************/
      query.append ( " SELECT"                         );
      query.append (   " 1"                            );
      query.append ( " FROM"                           );
      query.append (   " advertisement"                );
      query.append ( " WHERE"                          );
      query.append (   " advertisement_id = ?"         );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString()    );
      query.delete ( 0, 150                            );
      ps.setInt    ( 1, advertiserId                   );
      rs = ps.executeQuery();
      ps.clearParameters();
      if ( rs.next() ) {
        /*********************************************************/
        query.append ( " UPDATE"                         );
        query.append (   " advertisement"                );
        query.append (     " SET"                        );
        query.append (       " hit_count = hit_count+1"  );
        query.append ( " WHERE"                          );
        query.append (   " advertisement_id = ?"         );
        /*********************************************************/
        ps = conn.prepareStatement ( query.toString()    );
        ps.setInt    ( 1, advertiserId                   );
        ps.executeUpdate();
      } else {
        /*********************************************************/
        query.append ( " INSERT"                      );
        query.append (   " INTO"                      );
        query.append (     " advertisement ("         );
        query.append (       " advertisement_id"      );
        query.append (       " ,adv_desc"              );
        query.append (       " ,hit_count"             );
        query.append (     " )"                       );
        query.append ( " VALUES (?,'',1)"             );
        /*********************************************************/
        ps = conn.prepareStatement ( query.toString() );
        ps.setInt    ( 1, advertiserId                );
        ps.executeUpdate();
      }
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:incrementAdvertiserHitCount:ERROR:"  );
      msg.append ( "advertiserId="                                     );
      msg.append ( advertiserId                                        );
      msg.append ( ":"                                                 );
      msg.append ( e.getMessage()                                      );
      throw new RemoteException ( msg.toString()              );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ////////////////////////////////////////////////////////////
  public void incrementPressReleaseHitCount ( int id, String host )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement   ps   = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query     = new StringBuffer ( 175  );
      /*********************************************************/
      query.append ( " SELECT"                         );
      query.append (   " 1"                            );
      query.append ( " FROM"                           );
      query.append (   " press_release"                );
      query.append ( " WHERE"                          );
      query.append (   " press_release_id = ?"         );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString()    );
      query.delete ( 0, 175                            );
      ps.setInt    ( 1, id                             );
      rs = ps.executeQuery();
      ps.clearParameters();
      if ( rs.next() ) { 
        rs.close();
        /*********************************************************/
        query.append ( " SELECT"                         );
        query.append (   " 1"                            );
        query.append ( " FROM"                           );
        query.append (   " press_release_hit"            );
        query.append ( " WHERE"                          );
        query.append (   " press_release_id = ?"         );
        query.append (   " AND host = ?"                 );
        /*********************************************************/
        ps = conn.prepareStatement ( query.toString()    );
        query.delete ( 0, 175                            );
        ps.setInt    ( 1, id                             );
        ps.setString ( 2, host                           );
        rs = ps.executeQuery();
        ps.clearParameters();
        if ( rs.next() ) {
          updatePressReleaseHit ( id, host );
        } else {
          insertPressReleaseHit ( id, host );
        }
      } else {
        insertPressRelease ( id );
        insertPressReleaseHit ( id, host );
      }
    } catch ( Exception e ) {
      if ( VERBOSE ) e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:incrementPressReleaseHitCount:ERROR:" );
      msg.append ( "id="                                                );
      msg.append ( id                                                   );
      msg.append ( ":"                                                  );
      msg.append ( "host="                                              );
      msg.append ( host                                                 );
      msg.append ( ":"                                                  );
      msg.append ( e.getMessage()                                       );
      throw new RemoteException ( msg.toString()               );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ////////////////////////////////////////////////////////////
  private void insertPressReleaseHit ( int id, String host )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query     = new StringBuffer ( 150 );
      /*********************************************************/
      query.append ( " INSERT"                  );
      query.append (   " INTO"                  );
      query.append (     " press_release_hit (" );
      query.append (       " press_release_id"  );
      query.append (       " ,hit_count"        );
      query.append (       " ,host"             );
      query.append (     " )"                   );
      query.append ( " VALUES (?,1,?)"          );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1, id                          );
      ps.setString ( 2, host                        );
      ps.executeUpdate();
    } catch ( Exception e ) {
      if ( VERBOSE ) e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:insertPressReleaseHit:ERROR:" );
      msg.append ( "id="                                        );
      msg.append ( id                                           );
      msg.append ( ":"                                          );
      msg.append ( "host="                                      );
      msg.append ( host                                         );
      msg.append ( ":"                                          );
      msg.append ( e.getMessage()                               );
      throw new RemoteException ( msg.toString()       );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ////////////////////////////////////////////////////////////
  private void updatePressReleaseHit ( int id, String host )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query     = new StringBuffer ( 150 );
      /*********************************************************/
      query.append ( " UPDATE"                          );
      query.append (   " press_release_hit"             );
      query.append (     " SET"                         );
      query.append (       " hit_count = hit_count + 1" );
      query.append ( " WHERE"                           );
      query.append (   " press_release_id = ?"          );
      query.append (   " AND host = ?"                  );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1, id                          );
      ps.setString ( 2, host                        );
      ps.executeUpdate();
    } catch ( Exception e ) {
      if ( VERBOSE ) e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:updatePressReleaseHit:ERROR:" );
      msg.append ( "id="                                        );
      msg.append ( id                                           );
      msg.append ( ":"                                          );
      msg.append ( "host="                                      );
      msg.append ( host                                         );
      msg.append ( ":"                                          );
      msg.append ( e.getMessage()                               );
      throw new RemoteException ( msg.toString()       );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ////////////////////////////////////////////////////////////
  private void insertPressRelease ( int id )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query     = new StringBuffer ( 150 );
      /*********************************************************/
      query.append ( " INSERT"                 );
      query.append (   " INTO"                 );
      query.append (     " press_release ("    );  
      query.append (       " press_release_id" );  
      query.append (     " )"                  );
      query.append ( " VALUES (?)"             );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString() ); 
      ps.setInt    ( 1, id                          );
      ps.executeUpdate();
    } catch ( Exception e ) {
      if ( VERBOSE ) e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:insertPressRelease:ERROR:" );
      msg.append ( "id="                                     );
      msg.append ( id                                        );
      msg.append ( ":"                                       );
      msg.append ( e.getMessage()                            );
      throw new RemoteException ( msg.toString()    );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }




  ////////////////////////////////////////////////////////////
  public void incrementJobPostingHits ( int jobPostingId, int userId )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement   ps   = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query     = new StringBuffer ( 150  );
      /*********************************************************/
      query.append ( " SELECT"               );
      query.append (   " 1"                  );
      query.append ( " FROM"                 );
      query.append (   " job_posting_hits"   );
      query.append ( " WHERE"                );
      query.append (   " job_posting_id = ?" );
      query.append (   " AND user_id = ?"    );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString() );
      query.delete ( 0, 150                         );
      ps.setInt    ( 1, jobPostingId                );
      ps.setInt    ( 2, userId                      );
      rs = ps.executeQuery();
      ps.clearParameters();
      if ( rs.next() ) {
        /*********************************************************/
        query.append ( " UPDATE"                        );
        query.append (   " job_posting_hits"            );
        query.append (     " SET"                       );
        query.append (       " hit_count = hit_count+1" );
        query.append ( " WHERE"                         );
        query.append (   " job_posting_id = ?"          );
        query.append (   " AND user_id = ?"             );
        /*********************************************************/
        ps = conn.prepareStatement ( query.toString() );
        ps.setInt    ( 1, jobPostingId                );
        ps.setInt    ( 2, userId                      );
        ps.executeUpdate();
      } else {
        /*********************************************************/
        query.append ( " INSERT"                 );
        query.append (   " INTO"                 );
        query.append (     " job_posting_hits (" );
        query.append (       " job_posting_id"   );
        query.append (       " ,user_id"         );
        query.append (       " ,hit_count"       );
        query.append (     " )"                  );
        query.append ( " VALUES (?,?,1)"         );
        /*********************************************************/
        ps = conn.prepareStatement ( query.toString() );
        ps.setInt    ( 1, jobPostingId                );
        ps.setInt    ( 2, userId                      );
        ps.executeUpdate();
      }
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:incrementJobPostingHitCount:ERROR:" );
      msg.append ( "jobPostingId="                                    );
      msg.append ( jobPostingId                                       );
      msg.append ( ":userId="                                         );
      msg.append ( userId                                             );
      msg.append ( ":"                                                );
      msg.append ( e.getMessage()                                     );
      throw new RemoteException ( msg.toString()             );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }


  ////////////////////////////////////////////////////////////
  public String getRegionCode ( String stateCode, int userTypeId )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    String result            = null;
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      /*********************************************************/
      StringBuffer query = new StringBuffer ( 200 );
      query.append ( " SELECT"                 );
      query.append (   " region_code"          );
      query.append ( " FROM"                   );
      query.append (   " regional_states"      );
      query.append ( " WHERE"                  );
      query.append (   " state_code = ?"       );
      query.append (   " AND user_type_id = ?" );
      /*********************************************************/
      ps = conn.prepareStatement( query.toString() );
      ps.setString ( 1, stateCode  );
      ps.setInt    ( 2, userTypeId );
      rs = ps.executeQuery();
      if ( rs.next() ) result = rs.getString(1);
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException("ejb.Util:getRegionCode:ERROR:"+e);
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }

/* 
  ////////////////////////////////////////////////////////////
  public JobPostingAttributes getJobPosting ( int jobPostingId )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    JobPostingAttributes result = null;
    java.sql.Connection conn    = null;
    PreparedStatement ps        = null;
    ResultSet rs                = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query = new StringBuffer ( 200 );
      query.append ( " SELECT"                 );
      query.append (   " subscriber_id"        );
      query.append (   " title"                );
      query.append (   " description"          );
      query.append (   " salary_min"           );
      query.append (   " salary_max"           );
      query.append (   " status"               );
      query.append ( " FROM"                   );
      query.append (   " job_posting"          );
      query.append ( " WHERE"                  );
      query.append (   " job_posting_id = ?"   );
      ps = conn.prepareStatement( query.toString() );
      ps.setInt    ( 1, jobPostingId );
      rs = ps.executeQuery();
      if ( rs.next() ) {
        result = new JobPostingAttributes();
        result.setJobPostingId ( jobPostingId     );
        result.setSubscriptionId ( rs.getInt    (1) );
        result.setTitle        ( rs.getString (2) );
        result.setDescription  ( rs.getString (3) );
        result.setSalaryMin    ( rs.getInt    (4) );
        result.setSalaryMax    ( rs.getInt    (5) );
        result.setStatus       ( rs.getString (6) );
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException("ejb.Util:getRegionCode:ERROR:"+e);
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }
*/
 
  ////////////////////////////////////////////////////////////
  public boolean allowFullResume ( int subscriberId, int coderId )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    boolean result = false;
    java.sql.Connection conn    = null;
    PreparedStatement ps        = null;
    ResultSet rs                = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      /*********************************************************/
      StringBuffer query = new StringBuffer ( 200 );
      query.append ( " SELECT"              );
      query.append (   " 1"                 );
      query.append ( " FROM"                );
      query.append (   " inquiry"           );
      query.append ( " WHERE"               );
      query.append (   " subscriber_id = ?" );
      query.append (   " AND coder_id = ?"  );
      query.append (   " AND status = 'A'"  );
      /*********************************************************/
      ps = conn.prepareStatement( query.toString() );
      ps.setInt    ( 1, subscriberId );
      ps.setInt    ( 2, coderId      );
      rs = ps.executeQuery();
      if ( rs.next() ) {
        result = true;
      }
    } catch (Exception e) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "ejb.Util:allowFullResume:ERROR:"  );
      msg.append ( "subscriberId="                    );
      msg.append ( subscriberId                       );
      msg.append ( ":coderId="                        );
      msg.append ( coderId                            );
      msg.append ( ":"                                );
      msg.append ( e.getMessage()                     );
      throw new RemoteException ( msg.toString() );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
    return result;
  }

/**
 *****************************************************************
 * The logMail method creates a log of all out goimg
 * mail messages being sent from the TC Web.  Mail that 
 * is sent directly to the Exchange Server will be handled 
 * directly (no record of these are stored in the mail_log.
 *****************************************************************
 */
  public int logMail(EMailMessage mail) throws RemoteException  {
    Connection conn = null;
    PreparedStatement ps = null;
    int RetVal = 0;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      ps = conn.prepareStatement("INSERT INTO mail_log (coder_id, reason, timestamp) VALUES (?,?,?)");
      // coder_mail
      ps.setInt(1, mail.getCoderId());
      ps.setString(2, mail.getReason());
      ps.setTimestamp(3, DateTime.getCurrentTimestamp(conn));
      RetVal = ps.executeUpdate();			
    // Close the try
    } catch (SQLException sqe) {
      sqe.printStackTrace();
      throw new RemoteException (sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new RemoteException (e.getMessage());
    } finally {
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {System.out.println("ps   close problem");}
      try { if (conn   != null) conn.close();  } catch (Exception ignore) {System.out.println ( "conn   close problem");}
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
      ps = null;
      conn = null;
    }
    return RetVal;
  }


/*
  ////////////////////////////////////////////////////////////
  public void incrementSponsorHitCount ( String link, String refer )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement   ps = null;
    ResultSet rs = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query = new StringBuffer ( 150  );
      query.append ( " SELECT" );
      query.append (   " calendar_id" );
      query.append ( " FROM" );
      query.append (   " calendar" );
      query.append ( " WHERE" );
      query.append (   " year = ?" );
      query.append (   " AND month_numeric = ?" );
      query.append (   " AND day_of_month = ?" );
      ps = conn.prepareStatement ( query.toString() );
      query.delete ( 0, 150 );
      Calendar now = Calendar.getInstance(); 
      int year = now.get(Calendar.YEAR);
      int mo = ( now.get(Calendar.MONTH) + 1 );
      int day = now.get(Calendar.DAY_OF_MONTH);
      if (VERBOSE) System.out.println ( "YEAR="+year+" MONTH="+mo+" DAY="+day );
      ps.setInt ( 1, year );
      ps.setInt ( 2, mo );
      ps.setInt ( 3, day );
      rs = ps.executeQuery();
      ps.clearParameters();
      if ( rs.next() ) {
        int calendarId = rs.getInt(1);
        if (VERBOSE) System.out.println ( "CALENDAR_ID="+calendarId );
        if ( rs != null ) rs.close();
        query.append ( " SELECT" );
        query.append (   " link_id" );
        query.append ( " FROM" );
        query.append (   " link_hit" );
        query.append ( " WHERE" );
        query.append (   " link = ?" );
        query.append (   " AND refer = ?" );
        query.append (   " AND calendar_id = ?" );
        ps = conn.prepareStatement ( query.toString() );
        query.delete ( 0, 150 );
        ps.setString ( 1, link );
        ps.setString ( 2, refer );
        ps.setInt ( 3, calendarId );
        rs = ps.executeQuery();
        ps.clearParameters();
        if ( rs.next() ) {
          int linkId = rs.getInt(1);
          if ( rs != null ) rs.close();
          if (VERBOSE) System.out.println ( "LINK_ID="+linkId );
          query.append ( " UPDATE" );
          query.append (   " link_hit" );
          query.append (     " SET" );
          query.append (       " hit = hit + 1" );
          query.append ( " WHERE" );
          query.append (   " link_id = ?" );
          ps = conn.prepareStatement ( query.toString() );
          query.delete ( 0, 150 );
          ps.setInt ( 1, linkId );
          ps.executeUpdate();
        } else {
          if ( rs != null ) rs.close();
          javax.naming.Context env = (javax.naming.Context) ctx.lookup ( "java:comp/env" );
          int seq = ((java.lang.Integer)env.lookup("LINK_SEQ")).intValue();
          query.append ( " EXECUTE PROCEDURE nextval(?)" );
          ps = conn.prepareStatement ( query.toString() );
          query.delete ( 0, 150 );
          ps.setInt ( 1, seq );
          rs = ps.executeQuery();
          ps.clearParameters();
          if ( rs.next() ) {
            int newLinkId = rs.getInt(1);
            if (VERBOSE) System.out.println ( "NEW_LINK_ID="+newLinkId );
            query.append ( " INSERT" );
            query.append (   " INTO" );
            query.append (     " link_hit (" );
            query.append (       " link_id" );
            query.append (       " ,link" );
            query.append (       " ,refer" );
            query.append (       " ,hit" );
            query.append (       " ,calendar_id" );
            query.append (     " )" );
            query.append ( " VALUES (?,?,?,1,?)" );
            ps = conn.prepareStatement ( query.toString() );
            ps.setInt ( 1, newLinkId );
            ps.setString ( 2, link );
            ps.setString ( 3, refer );
            ps.setInt ( 4, calendarId );
            ps.executeUpdate();
          }
        }
      }
    } catch ( Exception e ) {
      e.printStackTrace();
      throw new RemoteException ( e.getMessage() );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }
*/


  ////////////////////////////////////////////////////////////
  public void incrementSponsorHitCount ( String link, String refer )
    throws RemoteException {
  ////////////////////////////////////////////////////////////
    java.sql.Connection conn = null;
    PreparedStatement   ps = null;
    ResultSet rs = null;
    javax.naming.Context ctx = null;
    try {
      ctx = new javax.naming.InitialContext();
      javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("OLTP");
      conn = ds.getConnection();
      StringBuffer query = new StringBuffer ( 150  );
      javax.naming.Context env = (javax.naming.Context) ctx.lookup ( "java:comp/env" );
      int seq = ((java.lang.Integer)env.lookup("LINK_SEQ")).intValue();
      /*********************************************************/
      query.append ( " EXECUTE PROCEDURE nextval(?)" );
      /*********************************************************/
      ps = conn.prepareStatement ( query.toString() );
      query.delete ( 0, 150 );
      ps.setInt ( 1, seq );
      rs = ps.executeQuery();
      ps.clearParameters();
      if ( rs.next() ) {
        int newLinkId = rs.getInt(1);
        if (VERBOSE) System.out.println ( "NEW_LINK_ID="+newLinkId );
        /*********************************************************/
        query.append ( " INSERT" );
        query.append (   " INTO" );
        query.append (     " link_hit (" );
        query.append (       " link_id" );
        query.append (       " ,link" );
        query.append (       " ,refer" );
        query.append (       " ,timestamp" );
        query.append (     " )" );
        query.append ( " VALUES (?,?,?,CURRENT)" );
        /*********************************************************/
        ps = conn.prepareStatement ( query.toString() );
        ps.setInt ( 1, newLinkId );
        ps.setString ( 2, link );
        ps.setString ( 3, refer );
        ps.executeUpdate();
      }
      
    } catch ( Exception e ) {
      e.printStackTrace();
      throw new RemoteException ( e.getMessage() );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      if (ctx != null)  { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }



}
