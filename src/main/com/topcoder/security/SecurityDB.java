package com.topcoder.security;

/**
 * This class is used to store any values that are determined by or limited
 * by database values.  An example would be the max length of a field, i.e.
 * username, being determined by the length of the corresponding column in
 * the db.
 */
public class SecurityDB {

    public static final int maxPasswordLength = 31;
    public static final int maxUsernameLength = 50;
    public static final int maxGroupnameLength = 254;
    public static final int maxRolenameLength = 254;

    private SecurityDB() {
    }

}
