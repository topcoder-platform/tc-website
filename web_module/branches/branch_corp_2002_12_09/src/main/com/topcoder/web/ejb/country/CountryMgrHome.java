package com.topcoder.web.ejb.country;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;

import java.rmi.RemoteException;

/**
 * 
 * Home interface for country manager 
 * 
 * @author djFD molc@mail.ru<br>
 */
public interface CountryMgrHome extends EJBHome {
	public static final String EJB_REF_NAME = CountryMgrHome.class.getName();
	
	/**
	 * Creates instance of home for Country manager
	 * 
	 * @return CountryMgr
	 * 
	 * @throws CreateException
	 * @throws RemoteException
	 */
    public CountryMgr create() throws CreateException, RemoteException;
}