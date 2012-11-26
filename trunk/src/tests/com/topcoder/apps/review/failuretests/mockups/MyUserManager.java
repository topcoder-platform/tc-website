/*
 * MyUserManager.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;
import java.util.Iterator;

import com.topcoder.security.TCSubject;
import com.topcoder.apps.review.mockup.EJBBase;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * <p>A mockup implementation of UserManager used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyUserManager extends EJBBase implements UserManagerLocal {
    /**
     * <p>HashMap maping TCSubjects to Users</p>
     */
    private static HashMap map = new HashMap();

    /**
     * <p>Returns the User specified by tcSubject.</p>
     *
     * @param tcSubject the TCSubject of the user to be found
     * @return the User specified by tcSubject.
     */
    public SecurityEnabledUser getUser(TCSubject tcSubject) {
        Long id = new Long(tcSubject.getUserId());
        return ((SecurityEnabledUser) map.get(id));
    }

    /**
     * <p>Returns the User specified by userId.</p>
     *
     * @param userId the userId the user to be found
     * @return the User specified by tcSubject.
     */
    public User getUser(long userId) {
        Long id = new Long(userId);
        return ((User) map.get(id));
    }

    public User getUser(String handle) {
        Iterator it = map.values().iterator();

        while (it.hasNext()) {
            User user = (User) it.next();
            if (handle.equals((String) user.getHandle())) {
                return (user);
            }
        }
        return (null);
    }

    /**
     * <p>Associates user with tcSubject.</p>
     *
     * @param tcSubject the TCSubject to map to user
     * @param user the User that tcSubject maps to
     * @return none
     */
    public static void addUser(TCSubject tcSubject, User user) {
        Long id = new Long(tcSubject.getUserId());
        map.put(id, user);
    }

    /**
     * <p>Clears all Users</p>
     *
     * @param none
     * @return none
     */
    public static void clearUsers() {
        map.clear();
    }
}
