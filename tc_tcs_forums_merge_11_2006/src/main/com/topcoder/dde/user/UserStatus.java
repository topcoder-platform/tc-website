package com.topcoder.dde.user;

/**
 * An object representing the types of status a user can have.  Contains
 * public static ACTIVE and INACTIVE attributes.  The values of those
 * attributes are the respective primary keys of those statuses in the
 * database.
 *
 * @author Heather Van Aelst
 * @version 1.0 July 2002
 */
public class UserStatus {

    public static final long ACTIVE = 1;  //these values are placeholders for now
    public static final long INACTIVE = 0;
    public static final long PENDINGACTIVATION = 201;

    private UserStatus() {
    }
}
