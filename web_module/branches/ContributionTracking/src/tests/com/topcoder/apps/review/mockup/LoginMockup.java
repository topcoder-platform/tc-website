/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;

/**
 * Mockup implementation of the Login EJB.
 *
 * @author adic
 * @version 1.0
 */
public class LoginMockup extends EJBBase implements LoginRemote {

    public TCSubject login(String name, String pass) throws GeneralSecurityException {
        User user = MockupData.login(name, pass);
        if (user != null) {
            return new TCSubject(user.getId());
        } else {
            throw new GeneralSecurityException("user/password invalid");
        }
    }

}

