package com.topcoder.web.ejb.termsofuse;

import java.rmi.RemoteException;
import javax.ejb.*;

public class TermsOfUseBean implements SessionBean {

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

  public long createTermsOfUse() throws RemoteException {
    return(0); 
  }

  public long getTermsOfUseTypeId() throws RemoteException {
    return(0);
  }
  
  public void setTermsOfUseTypeId(long _type_id) throws RemoteException {
  }

  public String getText() throws RemoteException {
    return("");
  }

  public void setText(String _text) throws RemoteException {
  }

};
