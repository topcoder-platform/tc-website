package com.topcoder.web.forums.model;

import com.jivesoftware.base.AuthToken;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;

import java.io.Serializable;

/**
 * User: dok
 * Date: Nov 23, 2004
 * Time: 12:04:12 PM
 */
public class TCAuthToken implements AuthToken, Serializable {

    private User u = null;

    /**
     * Constucts a new auth token with the specified userID.
     *
     * @param userID the userID to create an authToken token with.
     */
    public TCAuthToken(long userID) {
        this.u = new SimpleUser(userID, "", "");
    }

    // AuthToken Interface

    public long getUserID() {
        return u.getId();
    }

    public boolean isAnonymous() {
        return u.isAnonymous();
    }

}
