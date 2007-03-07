package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the comp_jive_category_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDECompForumXref extends EJBLocalObject {

    /**
     * Gets the forum type.
     *
     * @return forum type.
     */
    int getForumType();

    /**
     * Gets compVersions (CMR).
     *
     * @return compVersions.
     */
    LocalDDECompVersions getCompVersions();
    
    /**
     * Gets the category id.
     *
     * @return category id.
     */
    long getCategoryId();
}