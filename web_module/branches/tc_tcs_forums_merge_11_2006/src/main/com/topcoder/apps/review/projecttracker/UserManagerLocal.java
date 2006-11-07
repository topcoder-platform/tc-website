/*
 * UserManagerLocal.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.security.TCSubject;

import javax.ejb.EJBLocalObject;


/**
 * The UserManager provides access to users.
 *
 * @author TCSDeveloper
 */
public interface UserManagerLocal extends EJBLocalObject {
    /**
     * DOCUMENT ME!
     *
     * @param tcSubject DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public SecurityEnabledUser getUser(TCSubject tcSubject);

    /**
     * DOCUMENT ME!
     *
     * @param userId DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public User getUser(long userId);

    /**
     * DOCUMENT ME!
     *
     * @param handle DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public User getUser(String handle);
}
