package com.topcoder.web.ejb.email;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface EmailHome extends EJBHome {

    public final static String EJB_REF_NAME =
            "com.topcoder.web.ejb.email.EmailHome";

    Email create() throws CreateException, RemoteException;

}

;
