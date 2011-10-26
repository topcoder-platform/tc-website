package com.topcoder.web.ejb.userservices;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * User services web service interface
 * 
 * @author Pablo
 */
public interface UserServicesWS extends Remote {

    public boolean isRated(long userId) throws RemoteException;

    public boolean hasCompetitionRegistration(long userId, int maxDaysFromRegistration, int[] categoryIds) throws RemoteException;

}
