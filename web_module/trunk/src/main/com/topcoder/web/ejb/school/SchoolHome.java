package com.topcoder.web.ejb.school;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface SchoolHome extends EJBHome {

  public static final String EJB_REF_NAME=
                                       "com.topcoder.web.ejb.school.SchoolHome";

  School create() throws CreateException, RemoteException;

};
