package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the contact_type table.
 *
 * @version     1.0
 * @author      David Messinger
 */
public interface LocalDDEComponentInquiry extends EJBLocalObject {

    /**
     * Gets the rating.
     *
     * @return  rating.
     */
    long getRating();

    /**
     * Gets the component id.
     *
     * @return  the id of the component being inquired about.
     */
    long getComponentId();


    /**
     * Gets the user id for the user inquiring about the component.
     *
     * @return  the id of the user inquiring about the component
     */
    long getUserId();

    /**
     * Gets the user's comments about the inquiry
     *
     * @return  the user's comments about the inquiry
     */
    String getComments();

    /**
     * Gets if the user agreed to terms
     *
     * @return  the user's agreement to terms
     */
    boolean getAgreedToTerms();

    /**
     * Gets the component's phase at time of inquiry
     *
     * @return  the component's phase at time of inquiry
     */
    long getPhase();

    /**
     * Gets the component's version at time of inquiry
     *
     * @return  the component's version at time of inquiry
     */
    long getVersion();


    /**
     * Gets the top coder user id
     *
     * @return  the top coder user id
     */
    long getTcUserId();

    long getProjectId();
}
