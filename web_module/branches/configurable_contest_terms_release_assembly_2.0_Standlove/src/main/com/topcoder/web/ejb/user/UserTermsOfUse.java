/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.user;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.List;

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
public interface UserTermsOfUse extends EJBObject {

    public void createUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource)
            throws EJBException, RemoteException;

    public void removeUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource)
            throws EJBException, RemoteException;

    public boolean hasTermsOfUse(long userId, long termsOfUseId, String dataSource)
            throws EJBException, RemoteException;
    
    /**
     * Get the list of users who agree the given terms. 
     * 
     * @param termsOfUseId the id of the terms.
     * @param dataSource the data source.
     * @return the list of users who agree the given terms. 
     * @throws EJBException if fail to get the list. 
     * @throws RemoteException if communication error occurs.
     * @since 1.1
     */
    public List<UserOfTerms> getUsersOfTerms(long termsOfUseId, String dataSource)
    	throws EJBException, RemoteException;
}

;
