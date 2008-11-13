package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.sql.Timestamp;

/**
 * The local home interface representing the CMP bean for the user_master table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserMasterHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEUserMasterEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEUserMaster findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param loginId               login id.
     * @param lastLoginTime         last login time.
     * @param numLogins             number of logins.
     * @param statusId              status id.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEUserMaster create(long loginId, Timestamp lastLoginTime, int numLogins) throws CreateException;

}
