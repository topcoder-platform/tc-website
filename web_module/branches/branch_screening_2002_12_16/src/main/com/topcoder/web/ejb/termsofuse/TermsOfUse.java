package com.topcoder.web.ejb.termsofuse;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface TermsOfUse extends EJBObject {

  public long createTermsOfUse() throws RemoteException;

  public long getTermsOfUseTypeId(long _terms_of_use_id) throws RemoteException;
  
  public void setTermsOfUseTypeId(long _terms_of_use_id,long _type_id) throws RemoteException;

  public String getText(long _terms_of_use_id) throws RemoteException;

  public void setText(long _terms_of_use_id,String _text) throws RemoteException;

};
