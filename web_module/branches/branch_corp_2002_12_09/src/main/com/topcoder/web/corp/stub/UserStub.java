package com.topcoder.web.corp.stub;

import com.topcoder.shared.security.User;

/**
 * My comments/description/notes go here
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class UserStub implements User {
    public static final String  USER_ANONYMOUS_LOGIN  = "anonymous";
    
    String handle, pass, grp;
    long id;
    public UserStub(String n, String p, long i, String g) {
        handle = n;
        pass = p;
        id = i;
        grp = g;
    }
    
    /**
     * 
     * @return boolean
     */
    public boolean isAnonymous() {
        return id == USER_ANONYMOUS_ID;
    }
    
    /**
     * @see com.topcoder.shared.security.User#getGroup()
     */
    public String getGroup() {
        return grp;
    }

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
        return pass;
    }

    /**
     * @see com.topcoder.shared.security.User#getUserName()
     */
    public String getUserName() {
        return handle;
    }
    
    /**
     * 
     * @param userID
     * @return User
     */
    public static User getInstance(long userID) {
        if( userID == 0 ) {
            return new UserStub(USER_ANONYMOUS_LOGIN, "", USER_ANONYMOUS_ID, "none");
        }

        if( userID == 1 ) {
            return new UserStub("dok", "1", 1, "tc-corp");
        }

        if( userID == 2 ) {
            return new UserStub("swif0ne", "2", 2, "tc-corp");
        }

        if( userID == 3 ) {
            return new UserStub("veredox", "3", 3, "tc-corp");
        }

        if( userID == 4 ) {
            return new UserStub("Neoturi", "4", 4, "tc-corp");
        }

        if( userID == 5 ) {
            return new UserStub("slinky ", "5", 5, "tc-corp");
        }

        if( userID == 6 ) {
            return new UserStub("djFD", "6", 6, "tc-corp");
        }
        return null;
    }
    
    /**
     * 
     * @param userHandle
     * @return User
     */
    public static User getInstance(String userHandle) {
        if( userHandle.equals("dok") ) {
            return new UserStub("dok", "1", 1, "tc-corp");
        }

        if( userHandle.equals("swif0ne") ) {
            return new UserStub("swif0ne", "2", 2, "tc-corp");
        }

        if( userHandle.equals("veredox") ) {
            return new UserStub("veredox", "3", 3, "tc-corp");
        }

        if( userHandle.equals("Neoturi") ) {
            return new UserStub("Neoturi", "4", 4, "tc-corp");
        }

        if( userHandle.equals("slinky") ) {
            return new UserStub("slinky ", "5", 5, "tc-corp");
        }

        if( userHandle.equals("djFD") ) {
            return new UserStub("djFD", "6", 6, "tc-corp");
        }
        return null;
    }
}
