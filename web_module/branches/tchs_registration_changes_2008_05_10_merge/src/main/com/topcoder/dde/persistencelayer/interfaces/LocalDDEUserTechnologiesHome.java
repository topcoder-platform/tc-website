package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the user_technologies table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEUserTechnologiesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEUserTechnologiesEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEUserTechnologies findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param rating                rating.
     * @param months                months.
     * @param userMaster            userMaster.
     * @param technologyTypes       technologyTypes.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEUserTechnologies create(int rating, int months, LocalDDEUserMaster userMaster, LocalDDETechnologyTypes technologyTypes)
            throws CreateException;

    /**
     * Returns a Collection of LocalDDEUserTechnologies with the given login id.
     *
     * @param loginId               login id.
     * @return a Collection of local interfaces (LocalDDEUserTechnologies).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByLoginId(long loginId) throws FinderException;

}
