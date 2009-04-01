package com.topcoder.web.ejb.rating;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface Rating extends EJBObject {

    public void createRating(long coderId, String dataSource) throws EJBException, RemoteException;

}
