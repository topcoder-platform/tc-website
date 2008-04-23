package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the doc_types table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEDocTypes extends EJBLocalObject {

    /**
     * Gets the description.
     *
     * @return  description.
     */
    String getDescription();

    /**
     * Gets the status id.
     *
     * @return  status id.
     */
    long getStatusId();

}
