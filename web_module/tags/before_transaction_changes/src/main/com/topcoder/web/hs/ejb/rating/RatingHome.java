package com.topcoder.web.hs.ejb.rating;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface RatingHome extends EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.web.hs.ejb.rating.RatingHome";

    Rating create() throws CreateException, RemoteException;

}

;
