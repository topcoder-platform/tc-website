package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserSchoolHome extends EJBHome {

  UserSchool create() throws CreateException, RemoteException;

};
