package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class UserSchoolBean implements SessionBean {

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

      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO user_school_xref (user_id,school_id) ");
      query.append("VALUES (?,?)");

      con=DBMS.getHighSchoolConnection();
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

  public boolean isCurrent(long _user_id,long _school_id)
                                          throws EJBException, RemoteException {

    boolean current=false;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT current_ind ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      con=DBMS.getHighSchoolConnection();
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

  public void setCurrent(long _user_id,long _school_id,boolean _current)
                                          throws EJBException, RemoteException {

    Connection con=null;
    PreparedStatement ps=null;

    try {

      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE user_school_xref ");
      query.append("SET current_ind=? ");
      query.append("WHERE user_id=? AND school_id=?");

      con=DBMS.getHighSchoolConnection();
      ps=con.prepareStatement(query.toString());
      ps.setBoolean(1,_current);
      ps.setLong(2,_user_id);
      ps.setLong(3,_school_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows updated in "+
                               "'user_school_xref'. Updated "+rc+", should "+                                  "have updated 1."));
      }
    }
    catch (SQLException _sqle) {
      _sqle.printStackTrace();
      throw(new EJBException(_sqle.getMessage()));
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

      StringBuffer query=new StringBuffer(1024);
      query.append("DELETE ");
      query.append("FROM user_school_xref ");
      query.append("WHERE user_id=? AND school_id=?");

      con=DBMS.getHighSchoolConnection();
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

};
