package com.topcoder.web.ejb.userservices;

import java.rmi.RemoteException;

import javax.ejb.EJBObject;

public interface UserServices extends EJBObject {

    public boolean isRated(long userId) throws RemoteException;

    public boolean hasCompetitionRegistration(long userId, int maxDaysFromRegistration, int[] categoryIds) throws RemoteException;

}
