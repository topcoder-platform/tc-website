package com.topcoder.web.common.security;

import javax.servlet.http.Cookie;

import com.topcoder.shared.security.AuthenticationException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.User;

/**
 * This implementation will use the TCS security component to attempt a login.
 * It will check the cookies before checking the persistor to determine logged
 * in status.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class BasicAuthentication implements WebAuthentication {

    /**
     * 
     */
    private BasicAuthentication() {
    }
    
    /**
     * 
     * @param persistor
     * @param cookies
     */
    public BasicAuthentication(Persistor persistor, Cookie [] cookies) {
    }
    
    /**
     * will need to remove the logged in cookie, and the key/value pair in the pesistor
     */
    public void logout(User u) {
    }
    
    /**
     * @see com.topcoder.web.common.security.WebAuthentication#isLoggedIn(boolean)
     */
    public boolean isLoggedIn(boolean checkCookie) {
        return false;
    }

    /**
     * @see com.topcoder.shared.security.Authentication#getLoggedInUser()
     */
    public User getLoggedInUser() {
        return null;
    }

    /**
     * @see com.topcoder.shared.security.Authentication#isLoggedIn()
     */
    public boolean isLoggedIn() {
        return false;
    }

    /**
     * @see com.topcoder.shared.security.Authentication#login(com.topcoder.shared.security.User)
     */
    public void login(User u) throws AuthenticationException {
    }
}