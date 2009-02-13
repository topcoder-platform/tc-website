package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface UserSchoolHome extends EJBHome {

    public final static String EJB_REF_NAME =
            "com.topcoder.web.ejb.user.UserSchoolHome";

    UserSchool create() throws CreateException, RemoteException;

}

;
