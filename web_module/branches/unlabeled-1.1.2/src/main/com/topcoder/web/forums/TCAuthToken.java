package com.topcoder.web.forums;

import com.jivesoftware.base.AuthToken;

import java.io.Serializable;

/**
 * User: dok
 * Date: Nov 23, 2004
 * Time: 12:04:12 PM
 */
public class TCAuthToken implements AuthToken, Serializable {

    private long userID;

    /**
     * Constucts a new auth token with the specified userID.
     *
     * @param userID the userID to create an authToken token with.
     */
    protected TCAuthToken(long userID) {
        this.userID = userID;
    }

    // AuthToken Interface

    public long getUserID() {
        return userID;
    }

    public boolean isAnonymous() {
        return userID == -1;
    }

}
