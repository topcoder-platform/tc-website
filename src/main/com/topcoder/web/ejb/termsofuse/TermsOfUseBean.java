package com.topcoder.web.ejb.termsofuse;

import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.*;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class TermsOfUseBean implements SessionBean {

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

  public long createTermsOfUse() throws EJBException, RemoteException {

    long terms_of_use_id=0;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      if (!IdGenerator.isInitialized()) {
        IdGenerator.init(new SimpleDB(),ds,"sequence_object","name",
                         "current_value",9999999999L,1,true);
      }

      terms_of_use_id=IdGenerator.nextId("TERMS_OF_USE_SEQ");

      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO terms_of_use (terms_of_use_id) ");
      query.append("VALUES (?)");
    
      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,terms_of_use_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows inserted into "+
                               "'terms_of_use'. Inserted "+rc+", should "+
                               "have inserted 1."));
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
    return(terms_of_use_id);
  }

  public long getTermsOfUseTypeId(long _terms_of_use_id)
                                          throws EJBException, RemoteException {

    long terms_of_use_type_id=0;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT terms_of_use_type_id ");
      query.append("FROM terms_of_use ");
      query.append("WHERE terms_of_use_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_terms_of_use_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        terms_of_use_type_id=rs.getLong(1);
      }
      else {
        throw(new EJBException("No rows found when selecting from "+
                               "'terms_of_use' with terms_of_use_id="+
                               _terms_of_use_id+"."));
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
    return(terms_of_use_type_id);
  }
  
  public void setTermsOfUseTypeId(long _terms_of_use_id,
                                  long _terms_of_use_type_id)
                                          throws EJBException, RemoteException {

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE terms_of_use ");
      query.append("SET terms_of_use_type_id=? ");
      query.append("WHERE terms_of_use_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_terms_of_use_type_id);
      ps.setLong(2,_terms_of_use_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows updated in "+
                               "'terms_of_use'. Updated "+rc+", should "+
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

  public String getText(long _terms_of_use_id)
                                          throws EJBException, RemoteException {

    String text=null;

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT terms_text ");
      query.append("FROM terms_of_use ");
      query.append("WHERE terms_of_use_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setLong(1,_terms_of_use_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        text=DBMS.getTextString(rs,1);
      }
      else {
        throw(new EJBException("No rows found when selecting from "+
                               "'terms_of_use' with terms_of_use_id="+
                               _terms_of_use_id+"."));
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
    catch (Exception _e) {
      _e.printStackTrace();
      throw(new EJBException(_e.getMessage()));
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
    return(text);
  }

  public void setText(long _terms_of_use_id,String _text)
                                          throws EJBException, RemoteException {

    Connection con=null;
    PreparedStatement ps=null;

    try {

      String ds_name=(String)init_ctx.lookup(DATA_SOURCE);
      DataSource ds=(DataSource)init_ctx.lookup(ds_name);

      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE terms_of_use ");
      query.append("SET terms_text=? ");
      query.append("WHERE terms_of_use_id=?");

      con=ds.getConnection();
      ps=con.prepareStatement(query.toString());
      ps.setBytes(1,DBMS.serializeTextString(_text));
      ps.setLong(2,_terms_of_use_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new EJBException("Wrong number of rows updated in "+
                               "'terms_of_use'. Updated "+rc+", should "+
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
    catch (Exception _e) {
      _e.printStackTrace();
      throw(new EJBException(_e.getMessage()));
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
