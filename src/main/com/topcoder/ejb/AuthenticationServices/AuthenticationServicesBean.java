package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.rmi.RemoteException;
import java.sql.*;
import com.topcoder.ejb.BaseEJB;
import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;


public class AuthenticationServicesBean extends BaseEJB {

  private static final boolean VERBOSE = false;

//****************************************************************************************
//                                 Public Members
//****************************************************************************************

 /**
  * Returns true for a valid user name. 
  * @param handle the Handle.
  * @return boolean true for a valid user name.
  */
  ///////////////////////////////////////////////////////////////////////////////
  public boolean validHandle(String handle) throws TCException { 
  ///////////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.validHandle() called...");
    boolean result = false;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int check = 0;

    String query  = null; 
    /*************************************************************************************/
    /********************************** Postgres *****************************************/
    /*************************************************************************************/
    if (DBMS.DB == DBMS.POSTGRES)
      query  = "SELECT 1 FROM users WHERE UPPER(user_name)=UPPER(?)"; 
    /*************************************************************************************/
    /********************************** Informix *****************************************/
    /*************************************************************************************/
    else if (DBMS.DB == DBMS.INFORMIX)
      query  = "SELECT 1 FROM user WHERE UPPER(handle)=UPPER(?)"; 
    /*************************************************************************************/

    try {
      conn = DBMS.getConnection();
      ps = conn.prepareStatement(query);
      ps.setString(1,handle);
      rs = ps.executeQuery();
      if (rs.next()) check = rs.getInt(1); 
      if (check != 1) result = true; 
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:validHandle: ERROR \n "+sqe.getMessage() );
    } catch (Exception e) {
      throw new TCException( "AuthenticationServicesBean:validHandle: ERROR \n "+e.getMessage() );
    } finally { 
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


 /**
  * Returns true for sector agreement
  * @param sectorId the id for the security sector
  * @param userId the user's id.
  * @return boolean true for a sector agreement
  */
  ///////////////////////////////////////////////////////////////////////////////
  public boolean agreed ( int sectorId, int userId ) throws TCException {
  ///////////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.agreed() called...");
    boolean result = false;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int check = 0;

    String query = "SELECT 1 FROM sector_agreement WHERE sector_id=? AND user_id=?";

    try {
      conn = DBMS.getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1,sectorId);
      ps.setInt(2,userId);
      rs = ps.executeQuery();
      if ( rs.next() ) {
        result = true;
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:agreed: ERROR \n "+sqe.getMessage() );
    } catch (Exception e) {
      throw new TCException( "AuthenticationServicesBean:agreed: ERROR \n "+e.getMessage() );
    } finally {
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


 /**
  * Returns an ArrayList of User with like user names.
  * NOTE: only the UserId and Handle fields of the User are populated.
  * @param handle the Handle.
  * @return Arraylist of User with only the UserId and Handle populated.
  */
  ///////////////////////////////////////////////////////////////////////////////
  public ArrayList getLikeUsers ( String handle ) throws TCException {
  ///////////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.getLikeUsers() called...");
    ArrayList result = null;
    if ( handle != null ) {
      Connection conn = null;
      ResultSet rs = null;
      PreparedStatement ps = null;
      StringBuffer query = new StringBuffer ( 200 );
      /*************************************************************************************/
      /********************************** Postgres *****************************************/
      /*************************************************************************************/
      if (DBMS.DB == DBMS.POSTGRES) {
        query.append ( " SELECT"                            );
        query.append (   " user_id"                         );
        query.append (   " ,user_name"                      );
        query.append (   " ,UPPER(user_name) AS upper_name" );
        query.append ( " FROM"                              );
        query.append (   " users"                           );
        query.append ( " WHERE"                             );
        query.append (   " UPPER(user_name) LIKE '%"        );
        query.append (   handle.toUpperCase()             );
        query.append (   "%'"                               );
        query.append ( " ORDER BY"                          );
        query.append (   " upper_name"                      );
      }
      /*************************************************************************************/
      /********************************** Informix *****************************************/
      /*************************************************************************************/
      else if (DBMS.DB == DBMS.INFORMIX) {
        query.append ( " SELECT user_id");
        query.append (        " ,handle");
        query.append (        " ,UPPER(handle) AS upper_handle");
        query.append ( " FROM user");
        query.append ( " WHERE UPPER(handle) LIKE '%");
        query.append (          handle.toUpperCase());
        query.append (         "%'");
        query.append ( " ORDER BY 3");
      }
      /*************************************************************************************/
      try {
        conn = DBMS.getConnection();
        ps = conn.prepareStatement(query.toString());
        rs = ps.executeQuery();
        while ( rs.next() ) {
          if ( result == null ) result = new ArrayList();
          User user = new User();
          user.setUserId ( rs.getInt(1) );
          user.setHandle ( rs.getString(2) );
          result.add ( user );
        }
      } catch (SQLException sqe) {
        DBMS.printSqlException(true, sqe);
        throw new TCException( "AuthenticationServicesBean:getLikeUsers: ERROR \n "+sqe.getMessage() );
      } catch ( Exception e ) {
        e.printStackTrace();
        throw new TCException ( 
          "AuthenticationServicesBean:getLikeUsers: ERROR \n "+e.getMessage() 
        );
      } finally {
        if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
        if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
        if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
      }
    }
    return result;
  }


 /**
  * Returns the coder id for a valid user name. 
  * @param handle the user's name.
  * @param password the user's password.
  * @return an int representing the coder's unique identification number.
  */
  ///////////////////////////////////////////////////////////////////////////////
  public Authentication authenticate(String handle, String password) 
    throws TCException { 
  ///////////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.authenticate("+handle+",*****) called...");
    Authentication result = new Authentication();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    StringBuffer query = new StringBuffer(100);
    /*************************************************************************************/
    /********************************** Postgres *****************************************/
    /*************************************************************************************/
    if (DBMS.DB == DBMS.POSTGRES) {
      query.append( " SELECT user_id");
      query.append(        " ,status");
      query.append(   " FROM users");
      query.append(  " WHERE UPPER(user_name)=UPPER(?)");
      query.append(    " AND password=?");
    } 
    /*************************************************************************************/
    /********************************** Informix *****************************************/
    /*************************************************************************************/
    else if (DBMS.DB == DBMS.INFORMIX) {
      query.append( " SELECT user_id");
      query.append(        " ,status");
      query.append(   " FROM user");
      query.append(  " WHERE UPPER(handle)=UPPER(?)");
      query.append(    " AND password=?");
    }
    /*************************************************************************************/

    try {
      conn = DBMS.getConnection();
      ps = conn.prepareStatement( query.toString() );
      ps.setString(1,handle);
      ps.setString(2,password);
      rs = ps.executeQuery();
      if ( rs.next() ) {
        result.setUserId( rs.getInt(1) );
        result.setStatus( rs.getString(2) );
      }
    } catch (SQLException sqe ) {
      Log.msg(VERBOSE, "the query: \n" + query.toString());
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:authenticate:ERROR:" );
    } catch (Exception e) {
      e.printStackTrace();
      throw new TCException( "AuthenticationServicesBean:authenticate:ERROR:\n"+e.getMessage() );
    } finally { 
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
    return result;
  }




  /////////////////////////////////////////////////////////////////////////
  public Authentication getActivation(int coderId) 
    throws TCException {
  /////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.getActivation() called...");
    Authentication result = new Authentication();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      conn = DBMS.getConnection();
      StringBuffer query = new StringBuffer(100);
      /*************************************************************************************/
      /********************************** Postgres *****************************************/
      /*************************************************************************************/
      if (DBMS.DB == DBMS.POSTGRES) {
        query.append( "SELECT c.activation_code");
        query.append(       " ,u.status");
        query.append(  " FROM users u");
        query.append(       " ,coder c");
        query.append( " WHERE u.user_id=c.coder_id");
        query.append(   " AND c.coder_id=?");
      } 
      /*************************************************************************************/
      /********************************** Informix *****************************************/
      /*************************************************************************************/
      else if (DBMS.DB == DBMS.INFORMIX) {
        query.append( "SELECT c.activation_code");
        query.append(       " ,u.status");
        query.append(  " FROM user u");
        query.append(       " ,coder c");
        query.append( " WHERE u.user_id=c.coder_id");
        query.append(   " AND c.coder_id=?");
      }
      /*************************************************************************************/

      ps = conn.prepareStatement( query.toString() );
      ps.setLong( 1, new Long(coderId).longValue() );
      rs = ps.executeQuery();
      if (rs.next()) {
        result.setUserId(coderId);
        result.setActivationCode(rs.getString(1));
        result.setStatus(rs.getString(2));
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:getActivation:coder_id = " + coderId + "  ERROR \n "+sqe.getMessage() );
    } catch (Exception e)  {
      StringBuffer msg = new StringBuffer(200);
      msg.append("ejb.AuthenticationServicesBean:getActivation:coderId=");
      msg.append(coderId);
      msg.append(":ERROR:\n");
      msg.append(e.getMessage());
      throw new TCException(msg.toString());
    } finally {
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


  /////////////////////////////////////////////////////////////////////////
  public Authentication getCredentials(String firstName, 
    String lastName, String email) throws TCException {
  /////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.getCredentials() called...");
    Authentication result = new Authentication();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      conn = DBMS.getConnection();
      StringBuffer query = new StringBuffer(200);
      /*************************************************************************************/
      /********************************** Postgres *****************************************/
      /*************************************************************************************/
      if (DBMS.DB == DBMS.POSTGRES) {
        query.append( "SELECT u.user_id");
        query.append(       " ,u.user_name");
        query.append(       " ,u.password");
        query.append(  " FROM users u");
        query.append(       " ,coder c");
        query.append( " WHERE u.user_id=c.coder_id");
        query.append(   " AND UPPER(c.first_name) = UPPER(?)");
        query.append(   " AND UPPER(c.last_name) = UPPER(?)");
        query.append(   " AND UPPER(u.email) = UPPER(?)");
      } 
      /*************************************************************************************/
      /********************************** Informix *****************************************/
      /*************************************************************************************/
      else if (DBMS.DB == DBMS.INFORMIX) {
        query.append( "SELECT u.user_id");
        query.append(       " ,u.handle");
        query.append(       " ,u.password");
        query.append(  " FROM user u");
        query.append(       " ,coder c");
        query.append( " WHERE u.user_id=c.coder_id");
        query.append(   " AND UPPER(c.first_name) = UPPER(?)");
        query.append(   " AND UPPER(c.last_name) = UPPER(?)");
        query.append(   " AND UPPER(u.email) = UPPER(?)");
      }
      /*************************************************************************************/

      ps = conn.prepareStatement( query.toString() );
      ps.setString( 1, firstName );
      ps.setString( 2, lastName );
      ps.setString( 3, email );
      rs = ps.executeQuery();
      if (rs.next()) {
        result.setUserId(rs.getInt(1));
        result.setHandle(rs.getString(2));
        result.setPassword(rs.getString(3));
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:getCredentialsl: " + firstName + " " + lastName + " " + email + " ERROR \n "+sqe.getMessage() );
    } catch (Exception e)  {
      StringBuffer msg = new StringBuffer(200);
      msg.append("ejb.AuthenticationServicesBean:getCredentials:firstName=");
      msg.append(firstName);
      msg.append(":lastName=");
      msg.append(lastName);
      msg.append(":email=");
      msg.append(email);
      msg.append(":ERROR:\n");
      msg.append(e.getMessage());
      throw new TCException(msg.toString());
    } finally {
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
    return result;
  }


  ////////////////////////////////////////////////////////////
  public void insertSectorAccess ( int sectorId, int userId, String authorized )
    throws TCException {
  ////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.insertSectorAccess() called...");
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    try {
      conn                   = DBMS.getConnection();
      StringBuffer query     = new StringBuffer ( 200 );
      /*************************************************************************************/
      /********************************** Postgres *****************************************/
      /*************************************************************************************/
      if (DBMS.DB == DBMS.POSTGRES) {
        query.append ( " INSERT"                  );
        query.append (   " INTO"                  );
        query.append (     " sector_access ("     );
        query.append (       " sector_id"         );
        query.append (       " ,user_id"          );
        query.append (       " ,access"           );
        query.append (       " ,authorized"       );
        query.append (     " )"                   );
        query.append ( " VALUES (?,?,CURRENT_TIMESTAMP,?)" );
      } 
      /*************************************************************************************/
      /********************************** Informix *****************************************/
      /*************************************************************************************/
      else if (DBMS.DB == DBMS.INFORMIX) {
        query.append ( " INSERT"                  );
        query.append (   " INTO"                  );
        query.append (     " sector_access ("     );
        query.append (       " sector_id"         );
        query.append (       " ,user_id"          );
        query.append (       " ,access"           );
        query.append (       " ,authorized"       );
        query.append (     " )"                   );
        query.append ( " VALUES (?,?,CURRENT,?)"           );
      }
      /*************************************************************************************/

      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1, sectorId                    );
      ps.setInt    ( 2, userId                      );
      ps.setString ( 3, authorized                  );
      ps.executeUpdate();
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:insertSectorAccess: " +  sectorId + " " + userId  + " " + authorized + " ERROR \n "+sqe.getMessage() );
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:insertSectorAccess:ERROR:" );
      msg.append ( "sectorId="                               );
      msg.append ( sectorId                                  );
      msg.append ( ":"                                       );
      msg.append ( "userId="                                 );
      msg.append ( userId                                    );
      msg.append ( ":"                                       );
      msg.append ( "authorized="                             );
      msg.append ( authorized                                );
      msg.append ( ":"                                       );
      msg.append ( e.getMessage()                            );
      throw new TCException ( msg.toString()    );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
  }


  ////////////////////////////////////////////////////////////
  public void insertSectorAgreement ( int sectorId, int userId )
    throws TCException {
  ////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.AuthenticationServices.insertSectorAgreement() called...");
    java.sql.Connection conn = null;
    PreparedStatement ps     = null;
    ResultSet rs             = null;
    try {
      conn                   = DBMS.getConnection();
      StringBuffer query     = new StringBuffer ( 200 );
      /*************************************************************************************/
      /********************************** Postgres *****************************************/
      /*************************************************************************************/
      if (DBMS.DB == DBMS.POSTGRES) {
        query.append ( " INSERT"                  );
        query.append (   " INTO"                  );
        query.append (     " sector_agreement ("  );
        query.append (       " sector_id"         );
        query.append (       " ,user_id"          );
        query.append (       " ,agree_date"       );
        query.append (     " )"                   );
        query.append ( " VALUES (?,?,CURRENT_TIMESTAMP)" );
      } 
      /*************************************************************************************/
      /********************************** Informix *****************************************/
      /*************************************************************************************/
      else if (DBMS.DB == DBMS.INFORMIX) {
        query.append ( " INSERT"                  );
        query.append (   " INTO"                  );
        query.append (     " sector_agreement ("  );
        query.append (       " sector_id"         );
        query.append (       " ,user_id"          );
        query.append (       " ,agree_date"       );
        query.append (     " )"                   );
        query.append ( " VALUES (?,?,CURRENT)"           );
      }
      /*************************************************************************************/

      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1, sectorId                    );
      ps.setInt    ( 2, userId                      );
      ps.executeUpdate();
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException( "AuthenticationServicesBean:insertSectorAgreement: " + sectorId + " " + userId + " ERROR \n "+sqe.getMessage() );
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append ( "common.Common:insertSectorAgreement:ERROR:" );
      msg.append ( "sectorId="                                  );
      msg.append ( sectorId                                     );
      msg.append ( ":"                                          );
      msg.append ( "userId="                                    );
      msg.append ( userId                                       );
      msg.append ( ":"                                          );
      msg.append ( e.getMessage()                               );
      throw new TCException ( msg.toString()       );
    } finally {
      if (ps != null)   { try { ps.close();   } catch (Exception ignore) {} }
      if (rs != null)   { try { rs.close();   } catch (Exception ignore) {} }
      if (conn != null) { try { conn.close(); } catch (Exception ignore) {} }
    }
  }

}
