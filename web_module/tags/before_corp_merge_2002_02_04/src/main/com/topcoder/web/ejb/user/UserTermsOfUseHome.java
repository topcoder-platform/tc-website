package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserTermsOfUseHome extends EJBHome {

  public final static String EJB_REF_NAME=
                                 "com.topcoder.web.ejb.user.UserTermsOfUseHome";

  UserTermsOfUse create() throws CreateException, RemoteException;

};
