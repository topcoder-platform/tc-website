/*
 * UserManagerLocalHome.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a UserManager implementation.
 *
 * @author TCSDeveloper
 */
public interface UserManagerLocalHome extends EJBLocalHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.review.projecttracker.UserManagerLocalHome";

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws CreateException DOCUMENT ME!
     */
    public UserManagerLocal create() throws CreateException;
}
