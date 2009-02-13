package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserSchoolHome extends EJBHome {

  public final static String EJB_REF_NAME=
                                     "com.topcoder.web.ejb.user.UserSchoolHome";

  UserSchool create() throws CreateException, RemoteException;

};
