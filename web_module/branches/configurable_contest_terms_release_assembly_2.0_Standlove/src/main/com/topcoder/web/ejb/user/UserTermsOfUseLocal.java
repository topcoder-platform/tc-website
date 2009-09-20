/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
* <p>
*   Version 1.1 (Other Configurable Contest Terms Release Assembly 2.0 ) Change notes:
*   Added method to get the list of users who agree the terms. 
* </p>
*
* @author ASSEMBLER
* @version 1.1
* @since 1.0
*/
public interface UserTermsOfUseLocal extends EJBLocalObject {

    public void createUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource);

    public void removeUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource);

	public boolean hasTermsOfUse(long userId, long termsOfUseId, String dataSource);
	
	/**
     * Get the list of users who agree the given terms. 
     * 
     * @param termsOfUseId the id of the terms.
     * @param dataSource the data source.
     * @return the list of users who agree the given terms. 
     * @since 1.1
     */
	public List<UserOfTerms> getUsersOfTerms(long termsOfUseId, String dataSource);
}
