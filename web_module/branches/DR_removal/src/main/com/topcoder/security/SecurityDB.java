package com.topcoder.security;

/**
 * This class is used to store any values that are determined by or limited
 * by database values.  An example would be the max length of a field, i.e.
 * username, being determined by the length of the corresponding column in
 * the db.
 * <p>
 * v1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0):
 * update the password maximun length from 31 to 126
 * </p>
 * @author TCSASSEMBLER
 * @version v1.1
 */
public class SecurityDB {

    public static final int maxPasswordLength = 126;
    public static final int maxUsernameLength = 50;
    public static final int maxGroupnameLength = 254;
    public static final int maxRolenameLength = 254;
    public static final int STATUS_ACTIVE = 1;
    public static final int STATUS_INACTIVE = 2;

    private SecurityDB() {
    }

}
