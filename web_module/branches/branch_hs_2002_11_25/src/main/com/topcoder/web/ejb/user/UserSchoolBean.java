package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class UserSchoolBean implements SessionBean {

  private final static String DATA_SOURCE="java:comp/env/datasource_name";

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
                                          throws EJBException, RemoteException {

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO user_school_xref (user_id,school_id) ");
      query.append("VALUES (?,?)");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows inserted into "+
                               "'user_school_xref'. Inserted "+rc+", "+
                               "should have inserted 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new EJBException(_ne.getMessage()));
    }
    finally {
      if (con!=null) {
        try {
          con.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
      if (ps!=null) {
        try {
          ps.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
    }
  }

  public void removeUserSchool(long _user_id,long _school_id)
                                          throws EJBException, RemoteException {

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("DELETE ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows deleted from "+
                               "'user_school_xref'. Deleted "+rc+", should "+
                               "have deleted 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new EJBException(_ne.getMessage()));
    }
    finally {
      if (con!=null) {
        try {
          con.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
      if (ps!=null) {
        try {
          ps.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
    }
  }

  public void setCurrentUserSchoolId(long _user_id,long _school_id)
                                          throws EJBException, RemoteException {

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE user_school_xref ");
      query.append("SET current_ind=0 ");
      query.append("WHERE user_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);

      int rc=ps.executeUpdate();
      if (rc<1) {
        throw(new EJBException("Wrong number of rows updated in "+
                               "'user_school_xref'. Updated "+rc+", should "+
                               "have updated at least 1."));
      }

      query=new StringBuffer(1024);
      query.append("UPDATE user_school_xref ");
      query.append("SET current_ind=1 ");
      query.append("WHERE user_id=? AND school_id=?");

      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows updated in "+
                               "'user_school_xref'. Updated "+rc+", should "+
                               "have updated 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new EJBException(_ne.getMessage()));
    }
    finally {
      if (con!=null) {
        try {
          con.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
      if (ps!=null) {
        try {
          ps.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
    }
  }

  public long getCurrentUserSchoolId(long _user_id)
                                          throws EJBException, RemoteException {

    long school_id=0;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT school_id ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND current_ind=1");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        school_id=rs.getLong(1);
      }
      else {
        throw(new EJBException("No rows found when selecting from "+
                               "'user_school_xref' with user_id="+_user_id+
                               " AND current_ind=1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new EJBException(_ne.getMessage()));
    }
    finally {
      if (con!=null) {
        try {
          con.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
      if (ps!=null) {
        try {
          ps.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
    }
    return(school_id);
  }

  public boolean isCurrentUserSchoolId(long _user_id,long _school_id)
                                          throws EJBException, RemoteException {

    boolean current=false;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT current_ind ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        current=rs.getBoolean(1);
      }
      else {
        throw(new EJBException("No rows found when selecting from "+
                               "'user_school_xref' with user_id="+_user_id+
                               " AND school_id="+_school_id+"."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new EJBException(_ne.getMessage()));
    }
    finally {
      if (con!=null) {
        try {
          con.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
      if (ps!=null) {
        try {
          ps.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
    }
    return(current);
  }

  public boolean existsCurrentUserSchoolId(long _user_id,long _school_id)
                                          throws EJBException, RemoteException {

    boolean exists=true;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT current_ind ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_user_id);
      ps.setLong(2,_school_id);

      ResultSet rs=ps.executeQuery();
      if (!rs.next()) {
        exists=false;
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
    }
    catch (NamingException _ne) {
      _ne.printStackTrace();
      throw(new EJBException(_ne.getMessage()));
    }
    finally {
      if (con!=null) {
        try {
          con.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
      if (ps!=null) {
        try {
          ps.close();
        }
        catch (Exception _e) {
          /* do nothing */
        }
      }
    }
    return(exists);
  }

};
