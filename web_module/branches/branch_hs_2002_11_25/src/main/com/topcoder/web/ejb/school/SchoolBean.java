package com.topcoder.web.ejb.school;

import com.topcoder.util.idgenerator.*;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class SchoolBean implements SessionBean {

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

  public long createSchool() throws RemoteException {

    long school_id=0;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      if (!IdGenerator.isInitialized()) {

        /* Fix this so that it uses a specific column of a persisted sequences
         * table with maxLow=1 (this will ensure a unique id for each item of
         * each table)
         */
        IdGenerator.init(ds);
      }

      /* Fix this so that it asks specifically for the next sequence number for
       * the 'user' table
       */
      school_id=IdGenerator.nextId();
    
      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO school (school_id) ");
      query.append("VALUES (?)");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows inserted into "+
                                  "'school'. Inserted "+rc+", should have "+
                                  "inserted 1."));
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
    
    return(school_id);
  }

  public void setSchoolDivisionCode(long _school_id,
                                    String _school_division_code)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE school ");
      query.append("SET school_division_code=? ");
      query.append("WHERE school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_school_division_code);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'school'. "+
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

  public void setFullName(long _school_id,String _full_name)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE school ");
      query.append("SET full_name=? ");
      query.append("WHERE school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setString(1,_full_name);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'school'. "+
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

  public void setShortName(long _school_id,String _short_name)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
      
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE school ");
      query.append("SET short_name=? ");
      query.append("WHERE school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setString(1,_short_name);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'school'. "+
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

  public String getSchoolDivisionCode(long _school_id) throws RemoteException {

    String school_division_code=null;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT school_division_code ");
      query.append("FROM school ");
      query.append("WHERE school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_school_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        school_division_code=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'school' "+
                                  "with school_id="+_school_id+"."));
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
    return(school_division_code);
  }

  public String getFullName(long _school_id) throws RemoteException {

    String full_name=null;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT full_name ");
      query.append("FROM school ");
      query.append("WHERE school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_school_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        full_name=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'school' "+
                                  "with school_id="+_school_id+"."));
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
    return(full_name);  
  }

  public String getShortName(long _school_id) throws RemoteException {

    String last_name=null;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT short_name ");
      query.append("FROM school ");
      query.append("WHERE school_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_school_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        short_name=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'school' "+
                                  "with school_id="+_school_id+"."));
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
    return(short_name);  
  }

};
