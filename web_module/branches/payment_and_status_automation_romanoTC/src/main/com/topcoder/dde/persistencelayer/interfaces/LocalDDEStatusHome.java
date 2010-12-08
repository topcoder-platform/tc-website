package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the status table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEStatusHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEStatusEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEStatus findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param key                   the primary key.
     * @param description           description.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEStatus create(long key, String description) throws CreateException;

    /**
     * Returns a Collection of all instances of LocalDDEStatus.
     *
     * @return a Collection of local interfaces (LocalDDEStatus).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findAll() throws FinderException;

    /**
     * Returns a Collection of LocalDDEStatus with the given description.
     *
     * @param description           description.
     * @return a Collection of local interfaces (LocalDDEStatus).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByDescription(String description) throws FinderException;

}
