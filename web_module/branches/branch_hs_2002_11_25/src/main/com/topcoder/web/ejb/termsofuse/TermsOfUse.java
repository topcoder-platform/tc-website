package com.topcoder.web.ejb.termsofuse;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface TermsOfUse extends EJBObject {

  public long createTermsOfUse() throws RemoteException;

  public long getTermsOfUseTypeId() throws RemoteException;
  
  public void setTermsOfUseTypeId(long _type_id) throws RemoteException;

  public String getText() throws RemoteException;

  public void setText(String _text) throws RemoteException;

};
