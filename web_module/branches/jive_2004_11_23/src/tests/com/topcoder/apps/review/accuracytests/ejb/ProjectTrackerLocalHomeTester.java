package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the ProjectTrackerHome.<p>
 * This is the class that is returned by a lookup for the ProjectTrackerHome
 * in a {@link TestingContext}
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class ProjectTrackerLocalHomeTester implements ProjectTrackerLocalHome {

    /**
     * Stores the ProjectTrackerHome for this Thread
     * (necessary because of the set/get paradigm...multiple threads
     * would yield unexpected results)
     */
    private static ThreadLocal instance = new ThreadLocal();

    /**
     * Gets the Instance of the ProjectTrackerHomeTester
     *
     * @return the instance
     */
    public static ProjectTrackerLocalHomeTester getInstance() {
        if (instance.get() == null) instance.set(new ProjectTrackerLocalHomeTester());
        return (ProjectTrackerLocalHomeTester) instance.get();
    }

    ProjectTrackerLocal remote = new ProjectTrackerTester();

    public void remove(Handle handle) throws RemoveException {
    }

    public void remove(Object o) throws RemoveException {
    }

    public EJBMetaData getEJBMetaData() throws RemoteException {
        return null;
    }

    public HomeHandle getHomeHandle() throws RemoteException {
        return null;
    }

    public ProjectTrackerLocal create() throws CreateException, EJBException {
        return remote;
    }
}
