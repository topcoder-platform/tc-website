package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.EJBObject;

public interface UserTermsOfUse extends EJBObject {

  public void createUserTermsOfUse(long _user_id,long _terms_of_use_id) throws RemoteException;

  public void removeUserTermsOfUse(long _user_id,long _terms_of_use_id) throws RemoteException;

};
