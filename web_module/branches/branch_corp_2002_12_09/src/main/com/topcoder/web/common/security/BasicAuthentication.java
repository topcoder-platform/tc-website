package com.topcoder.web.common.security;

import java.security.MessageDigest;
import javax.servlet.http.Cookie;

import com.topcoder.shared.security.AuthenticationException;
import com.topcoder.shared.security.InvalidLogonException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.User;
import com.topcoder.web.corp.stub.UserStub;

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
    private static final int LM_FORM    = 0;
    private static final int LM_COOKIE  = 1;
    private static final int LM_UNKNOWN = 2;
    
    private static final String KEY_USER            = "current-user";
    private static final String KEY_LOGON_COOKIE_ID = "a1";
    private static final String KEY_LOGON_COOKIE_PW = "a2";
    private static final String KEY_PERMISSIONS     = "permissions-set";

    private int logonMethod = LM_UNKNOWN;
    private boolean loggedIn = false;
    private Persistor store = null;

    /**
     * disallowed
     */
    private BasicAuthentication() {
    }
    
    /**
     * 
     * @param persistor
     * @param cookies
     */
    public BasicAuthentication(Persistor persistor, Cookie [] cookies) throws Exception {
        // at time of creation user is not looged in yet
        // we will try got he logged via cookies at first
        // lets find user ID at first
        long userID = -1;
        for( int i=0; i<cookies.length; ++i ) {
            if( KEY_LOGON_COOKIE_ID.equals(cookies[i].getName()) ) {
                try {
                    userID = Long.parseLong(cookies[i].getValue());
                    break;
                }
                catch(Exception e) {
                }
            }
        }
        String scrambledPassword = null;
        for( int i=0; i<cookies.length; ++i ) {
            if( KEY_LOGON_COOKIE_PW.equals(cookies[i].getName()) ) {
                scrambledPassword = cookies[i].getValue().trim();
                break;
            }
        }
        
        User possibleUser = null;
        if( userID != -1 && scrambledPassword != null ) {
            // both username and password were specified via cookies
            possibleUser = fetchUserFromDB(userID);
            if( possibleUser != null ) { // user with given ID was found
                if( passwordsMatched(possibleUser, scrambledPassword) ) { // invalid password
                    possibleUser = null;
                }
                else {
                    loggedIn = true;
                    logonMethod = LM_COOKIE;
                }
            }
        }
        //here if possibleUser is null then either id/password combination is invalid
        //or cookies were not set yet
        if( possibleUser == null ) {
            // at first will try to 
            // fetch user from persistor
            possibleUser = (User)persistor.getObject(KEY_USER);
            if( possibleUser == null ) {
                // there are not any users in persistor - so user anonymous
                userID = User.USER_ANONYMOUS_ID;
                possibleUser = fetchUserFromDB(userID);
                // \m/ reset auth cookies here
            }
            else {
                loggedIn = true;
                logonMethod = LM_UNKNOWN;
            }
        }
        // there is the user at this point (maybe anonymous)
        persistor.setObject(KEY_USER, possibleUser);
        
        // get permissions set for given user
        persistor.setObject(KEY_PERMISSIONS, fetchPermissionsFromDB(userID));
    }
    
    /**
     * 
     * @param user
     * @param scrambledPassword
     * @return boolean
     */
    private boolean passwordsMatched(User user, String scrambledPassword) throws Exception {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte [] originalPasswordScrambled =  md5.digest(user.getPassword().getBytes());
        byte [] receivedPasswordScrambled = scrambledPassword.getBytes();
        boolean matched = false;
        if( originalPasswordScrambled.length == receivedPasswordScrambled.length ) {
            for( int i=0; i<originalPasswordScrambled.length; ++i ) {
                if( originalPasswordScrambled[i] != receivedPasswordScrambled[i] ) {
                    break;
                }
            }
        }
        return matched;
    }
    
    /**
     * will need to remove the logged in cookie, and the key/value pair in the pesistor
     */
    public void logout(User u) {
        if( ! loggedIn ) return;
        
        User who = (User)store.getObject(KEY_USER);
        if( ! u.equals(who) ) return; //different users
        
        store.removeObject(KEY_USER);
    }
    
//    /**
//     * is it really required ??
//     * @see com.topcoder.web.common.security.WebAuthentication#isLoggedIn(boolean)
//     */
//    public boolean isLoggedIn(boolean checkCookie) {
//        return false;
//    }

    /**
     * @see com.topcoder.shared.security.Authentication#getLoggedInUser()
     */
    public User getLoggedInUser() {
        return loggedIn ? (User)store.getObject(KEY_USER) : null;
    }

    /**
     * @see com.topcoder.shared.security.Authentication#login(com.topcoder.shared.security.User)
     */
    public void login(User u) throws AuthenticationException, Exception {
        User desiredUser = fetchUserFromDB(u.getUserName());
        if( ! desiredUser.getPassword().equals(u.getPassword()) ) {
            throw new InvalidLogonException();
        }
        
        // successfull
        store.setObject(KEY_USER, desiredUser);
        loggedIn = true; 
    }

    /**
     * @see com.topcoder.shared.security.Authentication#isLoggedIn()
     */
    public boolean isLoggedIn() {
        return loggedIn;
    }

    /**
     * 
     * @param userID
     * @return PermissionsSet
     * @throws Exception
     */    
    private PermissionsSet fetchPermissionsFromDB(long userID) throws Exception {
        PermissionsSet permSet = new PermissionsSet();
        permSet.populateFromDB(userID);
        return permSet;
    }

    /**
     * 
     * @return Cookie[]
     */    
    public Cookie [] getAutoLogonCookies() {
        User u = getLoggedInUser();
        if( u == null ) return null;
        Cookie [] ret = new Cookie [2];
        ret[0] = new Cookie(KEY_LOGON_COOKIE_ID, ""+u.getId());
        
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte [] scrambledPassword =  md5.digest(u.getPassword().getBytes());
            ret[1] = new Cookie(KEY_LOGON_COOKIE_ID, new String(scrambledPassword));
        }
        catch(Exception e) {
            return null;
        }
        return ret;
    }
    
    /**
     * Implemented as the stub for the moment
     * @param userID
     * @return User
     */
    private User fetchUserFromDB(long userID) throws Exception {
        return UserStub.getInstance(userID);
    }

    /**
     * Implemented as the stub for the moment
     * @param userID
     * @return User
     */
    private User fetchUserFromDB(String userName) throws Exception {
        return UserStub.getInstance(userName);
    }
}