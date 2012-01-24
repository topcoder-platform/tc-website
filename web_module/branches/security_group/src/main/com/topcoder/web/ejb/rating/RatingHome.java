package com.topcoder.web.ejb.rating;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface RatingHome extends EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.web.ejb.rating.RatingHome";

    Rating create() throws CreateException, RemoteException;

}

;
