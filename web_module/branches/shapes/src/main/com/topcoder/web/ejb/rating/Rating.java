package com.topcoder.web.ejb.rating;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;

public interface Rating extends EJBObject {

    public void createRating(long coderId, String dataSource) throws EJBException, RemoteException;

}
