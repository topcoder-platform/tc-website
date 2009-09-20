/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.user;


import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
* <p>
*   Version 1.1 (Other Configurable Contest Terms Release Assembly 2.0 )
*   Added method to get user id by handle. 
* </p>
*
* @author dok, ASSEMBLER
* @version 1.1
* @since 1.0
*/
public interface UserLocal extends EJBLocalObject {
    long createNewUser(String handle, char status, String dataSource, String idDataSource)
            throws EJBException;

    void createUser(long userId, String _handle, char status, String dataSource)
            throws EJBException;


    void setFirstName(long userId, String firstName, String dataSource)
            throws EJBException;

    void setMiddleName(long userId, String middleName, String dataSource)
            throws EJBException;

    void setLastName(long userId, String lastName, String dataSource)
            throws EJBException;

    void setStatus(long userId, char status, String dataSource)
            throws EJBException;

    void setActivationCode(long userId, String code, String dataSource)
            throws EJBException;

    void setPassword(long userId, String passwrd, String dataSource)
            throws EJBException;

    public String getHandle(long userId, String dataSource)
            throws EJBException;

    public void setHandle(long userId, String handle, String dataSource)
            throws EJBException;

    String getFirstName(long userId, String dataSource)
            throws EJBException;

    String getLastName(long userId, String dataSource) throws EJBException;

    String getMiddleName(long userId, String dataSource) throws EJBException;

    String getActivationCode(long userId, String dataSource) throws EJBException;

    String getPassword(long userId, String dataSource) throws RowNotFoundException;

    char getStatus(long userId, String dataSource)
            throws EJBException;

    boolean userExists(long userId, String dataSource) throws EJBException;

    public boolean userExists(String handle, String dataSource) throws EJBException;
    
    /**
     * Get the user id by handle. 
     * 
     * @param handle the user's handle.
     * @param dataSource the data source.
     * @return the user id.
     * @throws EJBException if fail to get the user id.
     * 
     * @since 1.1
     */
    long getUserId(String handle, String dataSource) throws EJBException;


}
