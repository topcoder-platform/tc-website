package com.topcoder.web.ejb.email;

import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.InformixDB;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class EmailBean implements SessionBean {

  private final static String HS_APPLICATION_DS="DBMS.OLTP_DATASOURCE_NAME";

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

  public long createEmail(long _user_id) throws RemoteException {

    long email_id=0;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      if (!IdGenerator.isInitialized()) {
        IdGenerator.init(new InformixDB(),ds,"sequence_object","name",
                         "current_value",9999999999L,10,true);
      }

      email_id=IdGenerator.nextId("EMAIL_SEQ");

      StringBuffer query=new StringBuffer(1024);
      query.append("INSERT ");
      query.append("INTO email (email_id,user_id) ");
      query.append("VALUES (?,?)");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,email_id);
      ps.setLong(2,_user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows inserted into "+
                                  "'email'. Inserted "+rc+", should have "+
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
    return(email_id);
  }

  public long getEmailTypeId(long _email_id,long _user_id)
                                                        throws RemoteException {

    long email_type_id=0;

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT email_type_id ");
      query.append("FROM email ");
      query.append("WHERE email_id=? AND user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_email_id);
      ps.setLong(2,_user_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        email_type_id=rs.getLong(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'email' "+
                                  "with email_id="+_email_id+" and "+
                                  "user_id="+_user_id+"."));
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
    return(email_type_id);
  }

  public String getAddress(long _email_id,long _user_id)
                                                        throws RemoteException {

    String address="";

    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);

      StringBuffer query=new StringBuffer(1024);
      query.append("SELECT address ");
      query.append("FROM email ");
      query.append("WHERE email_id=? AND user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_email_id);
      ps.setLong(2,_user_id);

      ResultSet rs=ps.executeQuery();
      if (rs.next()) {
        address=rs.getString(1);
      }
      else {
        throw(new RemoteException("No rows found when selecting from 'email' "+
                                  "with email_id="+_email_id+" and "+
                                  "user_id="+_user_id+"."));
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
    return(address);
  }

  public void setEmailTypeId(long _email_id,long _user_id,long _email_type_id)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
		   
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE email ");
      query.append("SET email_type_id=? ");
      query.append("WHERE email_id=? AND user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setLong(1,_email_type_id);
      ps.setLong(2,_email_id);
      ps.setLong(3,_user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'email'. "+
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

  public void setAddress(long _email_id,long _user_id,String _address)
                                                        throws RemoteException {
    try {

      /* Pull the DataSource object defined as a <resource-ref> in ejb-jar.xml
       */
      DataSource ds=(DataSource)init_ctx.lookup(HS_APPLICATION_DS);
		   
      StringBuffer query=new StringBuffer(1024);
      query.append("UPDATE email ");
      query.append("SET address=? ");
      query.append("WHERE email_id=? AND user_id=?");

      Connection con=ds.getConnection();
      PreparedStatement ps=con.prepareStatement(query.toString());
      ps.setString(1,_address);
      ps.setLong(2,_email_id);
      ps.setLong(3,_user_id);

      int rc=ps.executeUpdate();
      if (rc!=1) {
        throw(new RemoteException("Wrong number of rows updated in 'email'. "+
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

};
