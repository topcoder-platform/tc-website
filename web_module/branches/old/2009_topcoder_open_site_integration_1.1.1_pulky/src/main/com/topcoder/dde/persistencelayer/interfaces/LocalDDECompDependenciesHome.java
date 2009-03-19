package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the comp_dependencies table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompDependenciesHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDECompDependenciesEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompDependencies findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param version               version.
     * @param childVersion          childVersion.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDECompDependencies create(LocalDDECompVersions version, LocalDDECompVersions childVersion) throws CreateException;

    /**
     * Returns a Collection of LocalDDECompDependencies with the given compVersions id.
     *
     * @param compVersId            compVersions id.
     * @return a Collection of local interfaces (LocalDDECompDependencies).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByCompVersId(long compVersId) throws FinderException;

    /**
     * Returns a Collection of LocalDDECompDependencies with the given child compVersions id.
     *
     * @param childCompVersId       child compVersions id.
     * @return a Collection of local interfaces (LocalDDECompDependencies).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByChildCompVersId(long childCompVersId) throws FinderException;

    /**
     * Returns an instance of LocalDDECompDependencies with the given compVersions id and the child compVersions id.
     *
     * @param compVersId            compVersions id.
     * @param childCompVersId       child compVersions id.
     * @return a local interface (LocalDDECompDependencies).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDECompDependencies findByCompVersIdAndChildId(long compVersId, long childCompVersId) throws FinderException;

}
