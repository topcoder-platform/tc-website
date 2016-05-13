package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_technology table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompTechnologyHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompTechnologyEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompTechnology findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param compVersions          compVersions.
     * @param technologyTypes       technologyTypes.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompTechnology create(LocalDDECompVersions compVersions, LocalDDETechnologyTypes technologyTypes)
            throws CreateException;

    /**
     * Returns a Collection of LocalDDECompTechnology with the given compVersions id.
     *
     * @param compVersId            compVersions id.
     * @return a Collection of local interfaces (LocalDDECompTechnology).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompTechnology with the given technology type id.
     *
     * @param technologyTypeId      technology type id.
     * @return a Collection of local interfaces (LocalDDECompTechnology).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByTechnologyTypeId(long technologyTypeId) throws FinderException;

    /**
     * Returns a instance of LocalDDECompTechnology with the given compVersions id and technology type id.
     *
     * @param compVersId            compVersions id.
     * @param technologyTypeId      technology type id.
     * @return a local interface (LocalDDECompTechnology).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompTechnology findByCompVersIdAndTechnologyId(long compVersId, long technologyTypeId) throws FinderException;

}
