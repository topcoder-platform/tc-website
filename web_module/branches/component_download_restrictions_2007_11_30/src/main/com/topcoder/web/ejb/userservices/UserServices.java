package com.topcoder.web.ejb.userservices;

import java.rmi.RemoteException;

import javax.ejb.EJBObject;

public interface UserServices extends EJBObject {

    public Boolean isRated(long userId)
            throws RemoteException;

}
