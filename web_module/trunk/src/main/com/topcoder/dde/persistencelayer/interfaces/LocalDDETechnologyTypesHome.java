package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the technology_types table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDETechnologyTypesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDETechnologyTypesEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDETechnologyTypes findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param name                  name.
     * @param description           description.
     * @param statusId              status id.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDETechnologyTypes create(String name, String description, long statusId) throws CreateException;

    /**
     * Returns a Collection of all active instances of LocalDDETechnologyTypes.
     *
     * @return a Collection of local interfaces (LocalDDETechnologyTypes).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findAllActive() throws FinderException;

}
