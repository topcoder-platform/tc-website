package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class UserSchoolBean implements SessionBean {

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

  public void createUserSchool(long _user_id,long _school_id)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO user_school_xref (user_id,school_id) ");
      query.append("VALUES (?,?)");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows inserted into "+
                                  "'user_school_xref'. Inserted "+rc+", "+
                                  "should have inserted 1."));
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

  public boolean isCurrent(long _user_id,long _school_id)
                                                        throws RemoteException {

    boolean current=false;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT current ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        current=rs.getBoolean(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from "+
                                  "'user_school_xref' with user_id="+_user_id+
                                  " AND school_id="+_school_id+"."));
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
    return(current);
  }

  public void setCurrent(long _user_id,long _school_id,boolean _current)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE user_school_xref ");
      query.append("SET current=? ");
      query.append("WHERE user_id=? AND school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setBoolean(1,_current);
      ps.setLong(2,_user_id);
      ps.setLong(3,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in "+
                                  "'user_school_xref'. Updated "+rc+", should "+                                  "have updated 1."));
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

  public void removeUserSchool(long _user_id,long _school_id)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("DELETE ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows deleted from "+
                                  "'user_school_xref'. Deleted "+rc+", should "+
                                  "have deleted 1."));
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

};
