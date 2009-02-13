package com.topcoder.web.common.security;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

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
    protected static final Logger log = Logger.getLogger(
        BasicAuthentication.class
    ); 
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
    public BasicAuthentication(
        Persistor persistor,
        HttpServletRequest req,
        HttpServletResponse resp
    )
    {
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
        int expiresIn = clear ? 0 : 10*24*60*60;
        ret[0].setMaxAge(expiresIn);
        ret[0].setPath("/");
        for( int i=0; i<ret.length; ++i ) {
            response.addCookie(ret[i]);
        }
        response.setHeader("Cache-Control", "no-cache"); 
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
                catch(Exception ignore) {
                    /* id is invalid in some way - just ignore it*/
                }
                break;
            }
        }
        return ret;
    }

    /**
     * @see com.topcoder.web.common.security.WebAuthentication#getActiveUser()
     */
    public User getActiveUser() {
        // looking in cookies at first (weak identification at first)
        long id = getIDFromCookies();
        if( id != User.USER_ANONYMOUS_ID ) {
            return new SimpleUser(null, null, id); // no DB lookup is reqd
        }
        // weak identification has failed
        return getUser();
    }

    /**
     * Get current user logged out and also clears pre-identification cookies in
     * addition to basic interface functionality.
     * @see com. topcoder.shared.security. Authentication#logout()
     */
    public void logout() {
        store.removeObject(KEY_LOGGEDIN_USER);
        embedPreIDCookies(-1, true);
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
        InitialContext ic = null;
        try {
            ic = (InitialContext) TCContext.getContext(
                ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL
            );
            LoginRemoteHome lrHome;
            lrHome = (LoginRemoteHome)ic.lookup(LoginRemoteHome.EJB_REF_NAME);
            
            LoginRemote loginBean = lrHome.create();
            
            TCSubject subjUser = loginBean.login(
                user.getUserName(),
                user.getPassword()
            );
            
            long id = subjUser.getUserId();
            User loggedUser = new SimpleUser(
                user.getUserName(),
                user.getPassword(),
                id
            );
            store.setObject(KEY_LOGGEDIN_USER, loggedUser);
            embedPreIDCookies(loggedUser.getId(), false);
        }
        catch( NamingException ne ) {
            ne.printStackTrace();
            throw new AuthenticationException(
                "Login attempt has failed (NaminException occured)["
                +ne.getMessage()+"]"
            );
        }
        catch(CreateException ce) {
            ce.printStackTrace();
            throw new AuthenticationException(
                "Login attempt has failed (CreateException occured)["
                +ce.getMessage()+"]"
            );
        }
        catch(RemoteException re) {
            re.printStackTrace();
            throw new AuthenticationException(
                "Login attempt has failed (RemoteException occured)["
                +re.getMessage()+"]"
            );
        }
        catch(GeneralSecurityException gse) { //
            gse.printStackTrace();
            throw new AuthenticationException(
                "Login attempt has failed (GeneralSecurityException occured)["
                +gse.getMessage()+"]"
            );
        }
        finally {
            closeIC(ic);
        }
    }
    
    /**
     * Just closes initial context with care
     * @param ic
     */
    private static void closeIC(InitialContext ic) {
        if( ic == null ) return;
        try {
            ic.close();
        }
        catch(Exception e) {
            log.error("Can't close initial context "+ic);
        }
    }
}