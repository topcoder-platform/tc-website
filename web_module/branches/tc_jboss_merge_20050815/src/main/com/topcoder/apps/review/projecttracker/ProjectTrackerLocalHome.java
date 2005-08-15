/*
 * ProjectTrackerHome.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a ProjectTracker implementation.
 *
 * @author TCSDeveloper
 */
public interface ProjectTrackerLocalHome extends EJBLocalHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome";

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws CreateException DOCUMENT ME!
     */
    public ProjectTrackerLocal create() throws CreateException;
}
