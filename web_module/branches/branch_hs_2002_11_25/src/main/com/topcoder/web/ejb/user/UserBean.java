package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.*;

public class UserBean implements SessionBean {

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

  public long createUser() throws RemoteException {
    
    return(0); 
  }

  public void setFirstName(long _user_id,String _first_name) throws RemoteException {
  }

  public void setLastName(long _user_id,String _last_name) throws RemoteException {
  }

  public void setUserStatusId(long _user_id,long _user_status_id) throws RemoteException {
  }

  public String getFirstName(long _user_id) throws RemoteException {
    return("");
  }

  public String getLastName(long _user_id) throws RemoteException {
    return("");
  }

  public long getUserStatusId(long _user_id) throws RemoteException {
    return(0);
  }
  
};
