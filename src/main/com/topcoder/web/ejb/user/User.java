package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;
import javax.ejb.EJBException;

/**
*
* @author	George Nassar
* @version	$Revision$
*
*/

public interface User EJBObject {
	long createUser() throws RemoteException;
	void setFirstName(long userId, String firstName) throws RemoteException, EJBException;
	void setLastName(long userId, string lastName) throws RemoteException, EJBException;
	void setUserStatusId(long userId, long userStatusId) throws RemoteException, EJBException;
	String getFirstName(long userId) throws RemoteException, EJBException;
	String getLastName(long userId) throws RemoteException, EJBException;
	long getUserStatusId(long userId) throws RemoteException, EJBException;
}