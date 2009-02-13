package com.topcoder.web.ejb.school;

import com.topcoder.web.ejb.school.CurrentSchool;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface CurrentSchoolHome extends EJBHome {
    CurrentSchool create() throws CreateException, RemoteException;
}
