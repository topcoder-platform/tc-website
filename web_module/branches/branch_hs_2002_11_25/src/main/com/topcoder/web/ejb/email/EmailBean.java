package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.*;

public class EmailBean implements SessionBean {

  private SessionContext ctx;

  public void ejbActivate() {
    /* do nothing */
  }

  public void ejbPassivate() {
    /* do nothing */
  }

  public void ejbRemove() {
    /* do nothing */
  }

  public void setSessionContext(SessionContext _ctx) {
    ctx=_ctx;
  }

  public long createEmail(long _user_id) throws RemoteException {
    return(0); 
  }

  public long getEmailTypeId(long _user_id,long _email_id) throws RemoteException {
    return(0);
  }

  public String getAddress(long _user_id,long _email_id) throws RemoteException {
    return("");
  }

  public void setEmailTypeId(long _user_id,long _email_id,long _email_type_id) throws RemoteException {
  }

  public void setAddress(long _user_id,long _email_id,String _address) throws RemoteException {
  }

};
