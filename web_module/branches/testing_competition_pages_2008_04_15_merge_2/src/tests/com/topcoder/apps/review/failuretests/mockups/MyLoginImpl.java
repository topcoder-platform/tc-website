/*
 * MyLoginImpl.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;

import com.topcoder.security.TCSubject;
import com.topcoder.security.GeneralSecurityException;

/**
 * <p>A mockup implementation used by MyLoginLocal and MyLoginRemote.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyLoginImpl {
    /**
     * <p>Maps user names to passwords</p>
     */
    private static HashMap passwords = new HashMap();

    /**
     * <p>Maps user names to TCSubjects</p>
     */
    private static HashMap tcSubjects = new HashMap();

    /**
     * <p>Checks that the username / password combination is valid and
     * returns the TCSubject corresponding to the username.</p>
     *
     * @param username the username to check
     * @param password the password to check
     * @return the TCSubject corresponding to username
     * @throws GeneralSecurityException if the username / password
     * combination is invalid
     */
    public static TCSubject login(String username, String password)
            throws GeneralSecurityException {
        String expectedPassword = (String) passwords.get(username);

        if (password.equals(expectedPassword)) {
            return ((TCSubject) tcSubjects.get(username));
        } else {
            throw new GeneralSecurityException("Invalid username/password");
        }
    }

    /**
     * <p>Associates the given username / password combination
     * to tcSubject.<p>
     *
     * @param username the username
     * @param password the password
     * @param tcSubject the TCSubject to be associated with the
     * username / password combination
     * @return none
     */
    public static void addLogin(String username, String password,
                                TCSubject tcSubject) {
        passwords.put(username, password);
        tcSubjects.put(username, tcSubject);
    }

    /**
     * <p>Clears all logins.</p>
     *
     * @param none
     * @return none
     */
    public static void clearLogins() {
        passwords.clear();
        tcSubjects.clear();
    }
}
