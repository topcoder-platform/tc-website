package com.topcoder.web.common.security;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.security.AuthenticationException;
import com.topcoder.shared.security.InvalidLogonException;
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
     * Get current user logged out. This method does not change connection
     * cookies.
     * 
     * @see com.topcoder.shared.security.Authentication#logout()
     */
    public void logout() {
        store.removeObject(KEY_LOGGEDIN_USER);
    }

    /**
     * Get user logged out and, optionally disconnected if parameter is true.
     * 
     * @see com.topcoder.web.common.security.WebAuthentication#logout(boolean)
     */
    public void logout(boolean clearCookies) {
        logout();
        embedAutoConnectCookies(-1, true);
    }

    /**
     * @see com.topcoder.web.common.security.WebAuthentication#getUser(boolean)
     */
    public User getUser(boolean checkCookie) {
        User u = getUser();
        if( ! u.isAnonymous() ) {
            return u;
        }
        // user is not logged in yet
        if( ! checkCookie ) {
            return u;
        }
            
        long id = getIDFromCookies();
        if( id == User.USER_ANONYMOUS_ID ) {
            return u;
        }
        try {
            return pullUserFromDB(id);
        }
        catch(Exception e) { // it is impossible to pull that user from db
            return u; 
        }
    }

    /**
     * @see com.topcoder.shared.security.Authentication#getUser()
     */
    public User getUser() {
        User u = (User)store.getObject(KEY_LOGGEDIN_USER);
        return u == null ? SimpleUser.createAnonymous() : u;
    }

    /**
     * Checks, if user is currenltly logged in
     * 
     * @see com.topcoder.shared.security.Authentication#isLoggedIn()
     */
    public boolean isLoggedIn() {
        return store.getObject(KEY_LOGGEDIN_USER) != null;
    }

    /**
     * Get user logged in. Two fields required to be filled in are
     * password and either userID or username.
     * 
     * @see com.topcoder.shared.security.Authentication#login(com.topcoder.shared.security.User)
     */
    public void login(User user) throws AuthenticationException {
        User desiredUser;
        try {
            if( user.getUserName() != null ) {
                desiredUser = pullUserFromDB(user.getUserName());
            }
            else {
                desiredUser = pullUserFromDB(user.getId());
            }
        }
        catch(Exception e) {
            throw new InvalidLogonException(e);
        }
        if( ! desiredUser.getPassword().equals(user.getPassword()) ) {
            throw new InvalidLogonException();
        }
        store.setObject(KEY_LOGGEDIN_USER, desiredUser);
        embedAutoConnectCookies(desiredUser.getId(), false);
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
    private void embedAutoConnectCookies(long userID, boolean clear) {
        Cookie [] ret = new Cookie [2];
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
                }
                break;
            }
        }
        return ret;
    }

    /**
     * Pulls out user matching given id from db
     * 
     * @param id
     * @return User
     * @throws Exception
     */    
    private static User pullUserFromDB(long id) throws Exception {
        log.debug("pulling out user from db [id="+id+"]");
        PrincipalMgrRemote mgr = 
            AppContext.getInstance().getRemotePrincipalManager();
        String uname = mgr.getUser(id).getName();
        log.debug("[username="+uname+"]");
        String pw = mgr.getPassword(id);
        log.debug("[password="+pw+"]");
        String grp = mgr.getGroup(id).getName();
        log.debug("[group="+grp+"]");
        return new SimpleUser(uname, pw, grp, id);
    }
    
    /**
     * Pulls out user matching given username from db
     * 
     * @param uname
     * @return User
     * @throws Exception
     */
    private static User pullUserFromDB(String uname) throws Exception {
        log.debug("pulling out user from db [uname="+uname+"]");
        PrincipalMgrRemote mgr =
            AppContext.getInstance().getRemotePrincipalManager();
        long id = mgr.getUser(uname).getId();
        log.debug("[id="+id+"]");
        String pw = mgr.getPassword(id);
        log.debug("[password="+pw+"]");
        String grp = mgr.getGroup(id).getName();
        log.debug("[group="+grp+"]");
        return new SimpleUser(uname, pw, grp, id);
    }
    
}