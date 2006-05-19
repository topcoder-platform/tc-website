package com.topcoder.web.ejb.school;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface CurrentSchoolHome extends EJBHome {
    CurrentSchool create() throws CreateException, RemoteException;
}
