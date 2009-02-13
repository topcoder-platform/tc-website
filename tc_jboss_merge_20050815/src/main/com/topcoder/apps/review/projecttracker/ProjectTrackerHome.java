/*
 * ProjectTrackerHome.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a ProjectTracker implementation.
 *
 * @author TCSDeveloper
 */
public interface ProjectTrackerHome extends EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.apps.review.projecttracker.ProjectTrackerHome";

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     *
     * @throws CreateException DOCUMENT ME!
     * @throws RemoteException DOCUMENT ME!
     */
    public ProjectTracker create() throws CreateException, RemoteException;
}
