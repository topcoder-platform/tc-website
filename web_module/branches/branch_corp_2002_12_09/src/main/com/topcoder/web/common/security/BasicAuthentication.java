package com.topcoder.web.common.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Cookie;

import com.topcoder.shared.security.AuthenticationException;
import com.topcoder.shared.security.InvalidLogonException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.stub.PersistStore;

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
    public static final int LM_STRICT         = 0;
    public static final int LM_COOKIE         = 1;
    public static final int LM_UNKNOWN        = 2;

    
    private static final String KEY_USER            = "current-user";
    private static final String KEY_LOGON_COOKIE_ID = "a1";
    private static final String KEY_LOGON_COOKIE_PW = "a2";
    private static final String KEY_PERMISSIONS     = "permissions-set";
    private static final String KEY_LOGON_METHOD    = "logon-method";
    
    private static final String LM_STRICT_S         = "form-based";
    private static final String LM_COOKIE_S         = "cookie-based";
    private static final String LM_UNKNOWN_S        = "unknown";

//    private boolean loggedIn = false;
    private Persistor store = null;

    /**
     * disallowed
     */
    private BasicAuthentication() {
    }
    
    /**
     * 
     * @return int
     */
    public int getLogonMethod() {
        String m = (String)store.getObject(KEY_LOGON_METHOD);
        if( LM_STRICT_S.equals(m) ) return LM_STRICT;
        if( LM_COOKIE_S.equals(m) ) return LM_COOKIE;
        return LM_UNKNOWN;
    }
    
    /**
     * 
     * @param method
     */
    private void setLogonMethod(int method) {
        String m;
        switch(method) {
            case LM_STRICT: m = LM_STRICT_S; break;
            case LM_COOKIE: m = LM_COOKIE_S; break;
            default: m = LM_UNKNOWN_S; break;
        }
        store.setObject(KEY_LOGON_METHOD, m);
    }
        
    
    /**
     * Creates authentification token based on persitent storage and set of
     * received cookies. Persistent storage may already contain logged in user,
     * in which case cookies analysis is not performed.
     * Otherwise cookies are analized and if they specify valid user
     * credentials, then that user is loggen in automatically. Logon type in
     * that case marked as weak (LM_COOKIE)
     * 
     * @param persistor
     * @param cookies
     * @throws NoSuchAlgorithmException
     * @throws Exception
     */
    public BasicAuthentication(Persistor persistor, Cookie [] cookies)
    throws NoSuchAlgorithmException, Exception
    {
        store = persistor;
        User possibleUser = null;
        possibleUser = getLoggedInUser();
        if( possibleUser != null ) {
            // there is user already logged in
            return;
        }
        
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
        
        if( userID != -1 && scrambledPassword != null ) {
            // both username and password were specified via cookies
            possibleUser = fetchUserFromDB(userID);
            if( possibleUser != null ) { // user with given ID was found
                if( ! passwordsMatched(possibleUser, scrambledPassword) ) { // invalid password
                    possibleUser = null;
                }
                else {
                    setLogonMethod(LM_COOKIE);
                }
            }
        }
        // here if possibleUser is null then either id/password combination
        // in cookies is invalid or even cookies were not set yet
        if( possibleUser == null ) {
            // set up user as anonymous 
            userID = User.USER_ANONYMOUS_ID;
            possibleUser = fetchUserFromDB(userID);
        }
        else { // successfully looged in via cookies
            store.setObject(KEY_USER, possibleUser);
            setLogonMethod(LM_COOKIE);
        }
        // get permissions set for given user
        store.setObject(KEY_PERMISSIONS, fetchPermissionsFromDB(userID));
    }
    
    /**
     * 
     * @param user
     * @param scrambledPassword
     * @return boolean
     */
    private boolean passwordsMatched(User user, String scrambledPassword) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte [] originalPasswordScrambled =  md5.digest(user.getPassword().getBytes());
        String originalPassword = StringUtils.getHexRepresentation(originalPasswordScrambled);
        return originalPassword.equalsIgnoreCase(scrambledPassword);
    }
    
    /**
     * will need to remove the logged in cookie, and the key/value pair in the pesistor
     */
    public void logout(User u) {
        User who = getLoggedInUser();
        if( who == null || ! who.equals(u) ) return; //different users
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
        return isLoggedIn() ? (User)store.getObject(KEY_USER) : null;
    }

    /**
     * Performs logon process for given user. To be successfully logged in user
     * must have username and password fields set. After successful login
     * user currently looged in must be requested via getLogedInUser() method.
     * It is supposed that this method is callen only from strict login
     * procedures. Sets logon method as LM_STRICT. 
     * 
     * @see com.topcoder.shared.security.Authentication#login(com.topcoder.shared.security.User)
     */
    public void login(User u) throws AuthenticationException , Exception {
        User desiredUser = fetchUserFromDB(u.getUserName());
        if( desiredUser == null ) { // there is not user wit such handle in db 
            throw new InvalidLogonException();
        }
        
//        System.err.println(desiredUser+" fetched form db");
        
        if( ! u.getPassword().equals(desiredUser.getPassword()) ) {
            throw new InvalidLogonException();
        }
        
        // successfull
        store.setObject(KEY_USER, desiredUser);
        setLogonMethod(LM_STRICT);
    }

    /**
     * @see com.topcoder.shared.security.Authentication#isLoggedIn()
     */
    public boolean isLoggedIn() {
        User u = (User)store.getObject(KEY_USER);
        return null != u && !u.isAnonymous();
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
     * Returns newly created 'right' cookies which allow to the user get
     * automatically logged in (in case when clear set to false) or 'drop'
     * cookies which will reset client's autologon cookies. Cookies returned is
     * 'standalone' cookies (ie. they are not embedded into response yet,
     * just because Authentification does know nothing about response), so to
     * apply them caller must embed them into response.
     * 
     * @param clear if true then method returns expired cookies, otherwise valid
     * ones. Sending of expired cookies to client will drop out uatologon
     * cookies on client side.
     * @return Cookie[] either valid or expired autologon cookies, depending on
     * clear parameter.
     * 
     */
    public Cookie [] buildAutoLogonCookies(boolean clear) throws NoSuchAlgorithmException {
        User u = getLoggedInUser();
        String id = u == null ? "" : ""+u.getId();
        String passw = u == null ? "" : ""+u.getPassword();
        
        Cookie [] ret = new Cookie [2];
        ret[0] = new Cookie(KEY_LOGON_COOKIE_ID, clear? "" : id);
        int expiresIn = clear? -10*24*60*60 : 10*24*60*60;  
        ret[0].setMaxAge(expiresIn); 
        if( clear ) {
            ret[1] = new Cookie(KEY_LOGON_COOKIE_PW, "");
        }
        else {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte [] scrambledPassword =  md5.digest(passw.getBytes());
            ret[1] = new Cookie(KEY_LOGON_COOKIE_PW,
                                StringUtils.getHexRepresentation(scrambledPassword)
                         );
        }
        ret[1].setMaxAge(expiresIn); // one month ago
        return ret;
    }
    
    /**
     * Implemented as the stub for the moment
     * @param userID
     * @return User
     */
    private User fetchUserFromDB(long userID) throws Exception {
        return PersistStore.getInstance(null).getUser(userID);
    }

    /**
     * Implemented as the stub for the moment
     * @param userID
     * @return User
     */
    private User fetchUserFromDB(String userName) throws Exception {
        return PersistStore.getInstance(null).getUser(userName);
    }
}