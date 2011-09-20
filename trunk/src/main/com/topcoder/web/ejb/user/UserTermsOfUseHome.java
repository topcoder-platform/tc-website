package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface UserTermsOfUseHome extends EJBHome {

    public final static String EJB_REF_NAME =
            "com.topcoder.web.ejb.user.UserTermsOfUseHome";

    UserTermsOfUse create() throws CreateException, RemoteException;

}

;
