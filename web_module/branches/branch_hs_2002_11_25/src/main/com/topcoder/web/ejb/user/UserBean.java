package com.topcoder.web.ejb.user;

import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.InformixDB;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class UserBean implements SessionBean {

  private final static String HS_APPLICATION_DS="java:comp/env/jdbc/hsAppDS";

  private transient InitialContext init_ctx=null;

  private SessionContext ctx;

  public void ejbActivate() {
    /* do nothing */
  }

  public void ejbPassivate() {
    /* do nothing */
  }

  public void ejbCreate() throws CreateException {
    try {
      init_ctx=new InitialContext();
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
    }
  }

  public void ejbRemove() {
    /* do nothing */
  }

  public void setSessionContext(SessionContext _ctx) {
    ctx=_ctx;
  }

  public long createUser() throws RemoteException {

    long user_id=0;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      if (!IdGenerator.isInitialized()) {
        IdGenerator.init(new InformixDB(),ds,"sequence_object","name",
                         "current_value",9999999999L,10,true);
      }

      user_id=IdGenerator.nextId("USER_SEQ");
    
      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO user (user_id) ");
      query.append("VALUES (?)");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows inserted into 'user'. "+
                                  "Inserted "+rc+", should have inserted 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
    
    return(user_id);
  }

  public void setFirstName(long _user_id,String _first_name)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE user ");
      query.append("SET first_name=? ");
      query.append("WHERE user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setString(1,_first_name);
      ps.setLong(2,_user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'user'. "+
                                  "Updated "+rc+", should have updated 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
  }

  public void setLastName(long _user_id,String _last_name)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE user ");
      query.append("SET last_name=? ");
      query.append("WHERE user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setString(1,_last_name);
      ps.setLong(2,_user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'user'. "+
                                  "Updated "+rc+", should have updated 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
  }

  public void setUserStatusId(long _user_id,long _user_status_id)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE user ");
      query.append("SET user_status_id=? ");
      query.append("WHERE user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_status_id);
      ps.setLong(2,_user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'user'. "+
                                  "Updated "+rc+", should have updated 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
  }

  public String getFirstName(long _user_id) throws RemoteException {

    String first_name=null;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT first_name ");
      query.append("FROM user ");
      query.append("WHERE user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        first_name=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'user' "+
                                  "with user_id="+_user_id+"."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
    return(first_name);  
  }

  public String getLastName(long _user_id) throws RemoteException {

    String last_name=null;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT last_name ");
      query.append("FROM user ");
      query.append("WHERE user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        last_name=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'user' "+
                                  "with user_id="+_user_id+"."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
    return(last_name);  
  }

  public long getUserStatusId(long _user_id) throws RemoteException {

    long user_status_id=0;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT user_status_id ");
      query.append("FROM user ");
      query.append("WHERE user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        user_status_id=rs.getLong(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'user' "+
                                  "with user_id="+_user_id+"."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new RemoteException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new RemoteException(_ne.getMessage()));
    }
    return(user_status_id);  
  }
  
};
