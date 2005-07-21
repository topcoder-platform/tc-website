/*
 * MyProjectTrackerHome.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;
import javax.ejb.CreateException;

import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;

/**
 * <p>A mockup implementation of ProjectTrackerHome used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyProjectTrackerHome extends EJBHomeBase
        implements ProjectTrackerLocalHome {
    /**
     * <p>Returns a new instance of MyProjectTracker.</p>
     */
    public ProjectTrackerLocal create() throws CreateException {
        return (new MyProjectTracker());
    }
}
