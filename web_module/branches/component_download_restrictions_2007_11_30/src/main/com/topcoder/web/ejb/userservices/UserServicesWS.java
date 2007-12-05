package com.topcoder.web.ejb.userservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * User services web service interface
 * 
 * @author Pablo
 */
public interface UserServicesWS extends Remote {

    public Boolean isRated(long userId)
            throws RemoteException;

}
