package com.topcoder.web.ejb.school;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface SchoolHome extends EJBHome {

    public static final String EJB_REF_NAME =
            "com.topcoder.web.ejb.school.SchoolHome";

    School create() throws CreateException, RemoteException;

}

;
