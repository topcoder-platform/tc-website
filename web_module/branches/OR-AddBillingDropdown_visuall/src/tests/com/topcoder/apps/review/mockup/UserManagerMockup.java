/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.security.TCSubject;

/**
 * Mockup implementation of the UserManager EJB.
 *
 * @author adic
 * @version 1.0
 */
public class UserManagerMockup extends EJBBase implements UserManagerLocal {

    public SecurityEnabledUser getUser(TCSubject tcSubject) {
        return MockupData.getUser(tcSubject.getUserId());
    }

    public User getUser(long userId) {
        return MockupData.getUser(userId);
    }

    public User getUser(String handle) {
        return MockupData.getUser(handle);
    }

}

