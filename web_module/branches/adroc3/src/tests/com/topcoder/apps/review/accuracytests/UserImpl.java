/**
 * TCS Online Review
 *
 * UserImpl.java
 *
 * Copyright (c) 2003  TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;

/**
 * An subclass of User for testing and compatibility purposes
 *
 * @author ThinMan
 * @version 1.0
 */
public class UserImpl extends User {

    public UserImpl(String id, String handle, String firstName, String lastName,
                    String email) {
        super(UserImpl.stringToLong(id), handle, firstName, lastName, email);
    }

    public UserImpl(long id) {
        super(id, "", "", "", "");
    }

    /**
     * A private helper function whose only real purpose is to wrap
     * Long.parseLong(String) so that any NumberFormatException is caught and
     * rethrown as an IllegalArgumentException.
     */
    private static long stringToLong(String s) {
        try {
            return Long.parseLong(s);
        } catch (NumberFormatException nfe) {
            throw new IllegalArgumentException(
                    "The id argument '" + s + "' could not be parsed as a long");
        }

    }
}

