package com.topcoder.web.ejb.rating;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface Rating extends EJBObject {

  public long createRating() throws EJBException, RemoteException;


};
