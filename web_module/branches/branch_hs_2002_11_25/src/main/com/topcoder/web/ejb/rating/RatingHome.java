package com.topcoder.web.ejb.rating;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface RatingHome extends EJBHome {

  Rating create() throws CreateException, RemoteException;

};
