package com.topcoder.web.ejb.user;

import java.ejb.CreateException;
import java.rmi.RemoteException;

/**
*
* @author	George Nassar
* @version	$Revision$
*
*/

public interface UserHome extends javax.ejb.EJBHome {
	/**
	*
	* @return
	* @throws CreateException
	* @throws RemoteException
	*
	*/
	public User create() throws CreateException, RemoteException;
}