package com.topcoder.web.common.security;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.AppContext;

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
    protected static final Logger log = Logger.getLogger(BasicAuthentication.class); 
    private static final String KEY_LOGGEDIN_USER   = "logged-in-user";
    private static final String KEY_LOGON_COOKIE_ID = "a1";

    private Persistor store = null;
    private HttpServletRequest request = null; 
    private HttpServletResponse response = null;
    
    /**
     * disallowed
     */
    private BasicAuthentication() {
    }

    /**
     * Creates authentification token based on persitent storage and
     * request/response pair
     * 
     * @param persistor
     * @param req
     * @param resp
     */
    public BasicAuthentication(Persistor persistor, HttpServletRequest req, HttpServletResponse resp) {
        store = persistor;
        request = req;
        response = resp;
    }

    /**
     * Returns user who is <i>logged in</i>.
     *  
     * @see com.topcoder.shared.security.Authentication#getUser()
     */
    public User getUser() {
        User user = (User)store.getObject(KEY_LOGGEDIN_USER);
        return user == null ? SimpleUser.createAnonymous() : user;
    }

    /**
     * Embeds array of cookies into response for given user ID. If clear
     * parameter is true, then cookies embedded are marked as expired, so user
     * side client software will not send them to us anymore.
     * 
     * @param userID ID of user to be auto connected. Ignored if clear parameter
     * is true
     * @param clear if true, then auto connect cookies are dropped out.
     */
    private void embedPreIDCookies(long userID, boolean clear) {
        log.debug("embedding cookies ["+(clear?"clean up]" : "set up]"));
        Cookie [] ret = new Cookie [1];
        ret[0] = new Cookie(KEY_LOGON_COOKIE_ID, clear ? "" : ""+userID);
        int expiresIn = clear ? -10*24*60*60 : 10*24*60*60;
        ret[0].setMaxAge(expiresIn);

        for( int i=0; i<ret.length; ++i ) {
            response.addCookie(ret[i]);
        }
    }
    
    /**
     * Returns user Id from cookies or USER_ANONYMOUS_ID, if there was not auto
     * connect cookies in request.
     * 
     * @return long
     */
    private long getIDFromCookies() {
        long ret = User.USER_ANONYMOUS_ID;
        
        Cookie [] ca = request.getCookies();
        for( int i=0; i<ca.length; ++i ) {
            if( ca[i].getName().equals(KEY_LOGON_COOKIE_ID)) {
                try {
                    ret = Long.parseLong(ca[i].getValue());
                }
                catch(Exception e) {
                    /* id is invalid in some way - just ignore it*/
                }
                break;
            }
        }
        return ret;
    }

    /**
     * Pulls out user matching given ID from database.
     * 
     * @param id of user to be pulled out
     * @return User user matching an ID given
     * @throws Exception if there is not user with given id in DB or some errors
     * in underlying software has occured
     */
    private User pullUserFromDB(long id) throws Exception {
        log.debug("pulling out user from db [id="+id+"]");
        PrincipalMgrRemote mgr =
            AppContext.getInstance().getRemotePrincipalManager();
        String uname = mgr.getUser(id).getName();
        // log.debug("[username="+uname+"]");
        // password set to null because user is not logged in yet
        return new SimpleUser(uname, null, id);
    }

    /**
     * @see com.topcoder.web.common.security.WebAuthentication#getActiveUser()
     */
    public User getActiveUser() {
        User user = getUser();
        if( user.isAnonymous() ) {
            // well, there is not user currently logged in
            // will try to pre-identify user with cookies
            long id = getIDFromCookies();
            if( id != User.USER_ANONYMOUS_ID ) {
                try {
                    user = pullUserFromDB(id);
                }
                catch(Exception e) {
                    // we may ignore this because pre-identification
                    // process is second order task
                }
            }
        }
        return user;
    }
    
    /**
     * Get current user logged out. This method does not drop pre-identification
     * cookies.
	 * @see com.topcoder.shared.security.Authentication#logout()
     */
    public void logout() {
        store.removeObject(KEY_LOGGEDIN_USER);
    }
    
    /**
     * @see com.topcoder.web.common.security.WebAuthentication#logout(boolean)
     */
    public void logout(boolean clearCookies) {
        logout();
        if( clearCookies ) {
            embedPreIDCookies(-1, true);
        }
    }
    
    /**
     * Tries to log supplied user in. Also automatically sets pre-
     * identification cookies to allow user to be weakly identified while he is
     * not logged in yet.
     * 
     * @param user an user to be logged in. Two fields of user must be set to
     * get successfully logged in: username (handle) and password.
     * 
     * @see com.topcoder.shared.security.Authentication#login(com.topcoder.shared.security.User)
     */
    public void login(User user) throws AuthenticationException {
        try {
            AppContext ac = AppContext.getInstance();
            LoginRemote lrBean = ac.getRemoteLogin();
            TCSubject subjUser = lrBean.login(user.getUserName(), user.getPassword());
            long id = subjUser.getUserId();
            User loggedUser = new SimpleUser(user.getUserName(), user.getPassword(), id);
            store.setObject(KEY_LOGGEDIN_USER, loggedUser);
            embedPreIDCookies(loggedUser.getId(), false);
        }
        catch(Exception e) { //
            e.printStackTrace();
            throw new AuthenticationException("Login attempt has failed ["+e.getMessage()+"]");
        }
    }
}