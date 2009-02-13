package com.topcoder.shared.security;

/**
 * My comments/description/notes go here
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class SimpleUser implements User {
//    private String grp = null;
    private String uname = null;
    private String pw = null;
    private long id = USER_ANONYMOUS_ID;
    
    /**
     * Creates SimpleUser instance. 
     * 
     * @param username
     * @param password
     */
    public SimpleUser(String username, String password) {
        uname = username;
        pw = password;
    }

    /**
     * Creates SimpleUser object
     * 
     * @param username
     * @param password
     * @param group
     * @param userID
     */
    public SimpleUser(String username, String password, /*String group,*/ long userID) {
        uname = username;
        pw = password;
//        grp = group;
        id = userID;
    }
    
    /**
     * Returns anonymous user object.
     * @return User
     */
    public static User createAnonymous() {
        return new SimpleUser(USER_ANONYMOUS_HANDLE, null, USER_ANONYMOUS_ID);
    }
    
//    /**
//     * @see com.topcoder.shared.security.User#getGroup()
//     */
//    public String getGroup() {
//        return grp;
//    }

    /**
     * @see com.topcoder.shared.security.User#getId()
     */
    public long getId() {
        return id;
    }

    /**
     * @see com.topcoder.shared.security.User#getPassword()
     */
    public String getPassword() {
        return pw;
    }

    /**
     * @see com.topcoder.shared.security.User#getUserName()
     */
    public String getUserName() {
        return uname;
    }

    /**
     * @see com.topcoder.shared.security.User#isAnonymous()
     */
    public boolean isAnonymous() {
        return id == USER_ANONYMOUS_ID;
    }
    
    /**
     * Sets up password for user object.
     * @param password
     */
    public void setPassword(String password) {
        pw = password;
    } 
}