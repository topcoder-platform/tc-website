package com.topcoder.web.ejb.country;

import javax.ejb.EJBObject;

import java.rmi.RemoteException;

import javax.ejb.EJBException;

/**
 * 
 * Country manager remote interface
 * 
 * @author djFD molc@mail.ru<br>
 */
public interface CountryMgr extends EJBObject {
	/**
	 * Creates new country and adds new record into underlying DB
	 * 
	 * 
	 * @param countryCode 3 chars at most
	 * @param countryName 40 chars at most
	 * 
	 * @return Country country object for given code and name
	 * 
	 * @throws RemoteException
	 * @throws EJBException
	 */
	public Country create(String countryCode, String countryName) throws RemoteException, EJBException;
	
	/**
	 * Returns array of countries matching given country code pattern.
	 * 
	 * @param countryCode pattern for country code. Might include % and
	 * underscore metasymbols. Their semantics are as in DB engines, ie. %
	 * stands for 'any sequence of chars' and underscore stands for 'exactly one
	 * arbitrary symbol'
	 * 
	 * @return Country[] array of countries matching the code given. Even if
	 * empty will not be null.
	 * 
	 * @throws RemoteException
	 * @throws EJBException
	 */
	public Country [] listByCode(String countryCode) throws RemoteException, EJBException;
	
	/**
	 * Returns array of countries matching given country name pattern.
	 *  
	 * @param countryName pattern for country name. Might include % and
	 * underscore metasymbols.
	 * @return Country[] array of countries matching the code given. Even if
	 * empty will not be null.
	 * 
	 * @throws RemoteException
	 * @throws EJBException
	 */
	public Country [] listByName(String countryName) throws RemoteException, EJBException;
}