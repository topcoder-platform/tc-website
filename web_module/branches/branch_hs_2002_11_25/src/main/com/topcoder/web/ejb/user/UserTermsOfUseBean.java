package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.*;

public class UserTermsOfUseBean implements SessionBean {

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

  public void createUserTermsOfUse(long _user_id,long _terms_of_use_id)
                                                        throws RemoteException {
  }

  public void removeUserTermsOfUse(long _user_id,long _terms_of_use_id)
                                                        throws RemoteException {
  }

};
