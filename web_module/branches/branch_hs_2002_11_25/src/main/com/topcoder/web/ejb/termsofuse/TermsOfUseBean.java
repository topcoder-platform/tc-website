package com.topcoder.web.ejb.termsofuse;

import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.InformixDB;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class TermsOfUseBean implements SessionBean {

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

  public long createTermsOfUse() throws RemoteException {

    long terms_of_use_id=0;

    try {
      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      if (!IdGenerator.isInitialized()) {
        IdGenerator.init(new InformixDB(),ds,"sequence_object","name",
                         "current_value",9999999999L,10,true);
      }

      terms_of_use_id=IdGenerator.nextId("TERMSOFUSE_SEQ");

      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO terms_of_use (terms_of_use_id) ");
      query.append("VALUES (?)");
    
      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,terms_of_use_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows inserted into "+
                                  "'terms_of_use'. Inserted "+rc+", should "+
                                  "have inserted 1."));
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
    return(terms_of_use_id);
  }

  public long getTermsOfUseTypeId(long _terms_of_use_id)
                                                        throws RemoteException {

    long terms_of_use_type_id=0;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT terms_of_use_type_id ");
      query.append("FROM terms_of_use ");
      query.append("WHERE terms_of_use_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_terms_of_use_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        terms_of_use_type_id=rs.getLong(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from "+
                                  "'terms_of_use' with terms_of_use_id="+
                                  _terms_of_use_id+"."));
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
    return(terms_of_use_type_id);
  }
  
  public void setTermsOfUseTypeId(long _terms_of_use_id,
                                  long _terms_of_use_type_id)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE terms_of_use ");
      query.append("SET terms_of_use_type_id=? ");
      query.append("WHERE terms_of_use_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_terms_of_use_type_id);
      ps.setLong(2,_terms_of_use_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in "+
                                  "'terms_of_use'. Updated "+rc+", should "+
                                  "have updated 1."));
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

  public String getText(long _terms_of_use_id) throws RemoteException {

    String text=null;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT text ");
      query.append("FROM terms_of_use ");
      query.append("WHERE terms_of_use_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_terms_of_use_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        text=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from "+
                                  "'terms_of_use' with terms_of_use_id="+
                                  _terms_of_use_id+"."));
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
    return(text);
  }

  public void setText(long _terms_of_use_id,String _text)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE terms_of_use ");
      query.append("SET text=? ");
      query.append("WHERE terms_of_use_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setString(1,_text);
      ps.setLong(2,_terms_of_use_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in "+
                                  "'terms_of_use'. Updated "+rc+", should "+
                                  "have updated 1."));
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
