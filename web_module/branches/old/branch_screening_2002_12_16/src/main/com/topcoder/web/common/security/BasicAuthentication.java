package com.topcoder.web.common.security;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.ApplicationServer;

/**
 * Performs authentication using the TCS security component. Uses cookies and
 * a Persistor object for persistent identity storage.
 * @author  Porgery
 */
public class BasicAuthentication implements WebAuthentication {
    
    private static Logger log = Logger.getLogger(BasicAuthentication.class);

    Persistor persistor;
    HttpServletRequest request;
    HttpServletResponse response;
    
    private BasicAuthentication() {}
    
    /** Creates a new instance of BasicAuthentication */
    public BasicAuthentication(Persistor userPersistor,
    HttpServletRequest request, HttpServletResponse response) {
        this.persistor = userPersistor;
        this.request = request;
        this.response = response;
    }
    
    private long getIdFromCookie(){
        try{
            Cookie[] cookies = request.getCookies();
            Cookie userCookie = null;
            Cookie loggedInCookie = null;
            for(int i=0; i<cookies.length; i++){
                if(cookies[i].getName().equals("user_id"))
                    userCookie = cookies[i];
                if(cookies[i].getName().equals("loggedInStatus"))
                    loggedInCookie = cookies[i];
            }
            if(userCookie != null && loggedInCookie != null)
                if(loggedInCookie.getValue().equals("true"))
                    return Long.parseLong(userCookie.getValue());
        } catch (Exception e) {
        }
        return User.USER_ANONYMOUS_ID;
    }
    
    private long getIdFromPersistor(){
        try{
            String key = request.getSession().getId()+"user_id";
            Long persistId = (Long)persistor.getObject(key);
            if(persistId != null){
                key = request.getSession().getId()+"loggedInStatus";
                Boolean loggedIn = (Boolean)persistor.getObject(key);
                if(loggedIn != null && loggedIn.booleanValue()){
                    return persistId.longValue();
                }
            }
        } catch (Exception e) {
        }
        return User.USER_ANONYMOUS_ID;
    }
    
    /** Gets the current user's information.
     * @return A User object representing the current user.
     */
    public User getUser() {
        return new SimpleUser(getIdFromPersistor(),null,null);
    }
    
    /**
     * For sensitive areas where a cookie is not sufficient authentication,
     * this method provides the option to ignore the cookie.
     * @return  User object containing user info stored in the persistor.
     */
    public User getActiveUser() {
        long id = getIdFromCookie();
        if(id == User.USER_ANONYMOUS_ID)
            id = getIdFromPersistor();
        
        return new SimpleUser(id,null,null);
    }
    
    /**
     * Attempts to log in the given user.
     * @param u User object to be authenticated.
     * @throws AuthenticationException Thrown if the login does not succeed.
     */
    public void login(User u) throws AuthenticationException {
        try {
            log.debug("Getting Login EJB");
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_FACTORY);
            env.put(Context.PROVIDER_URL,
                ApplicationServer.SECURITY_PROVIDER_URL);
            InitialContext context = new InitialContext(env);
            
            LoginRemoteHome loginHome = (LoginRemoteHome)
                context.lookup(LoginRemoteHome.EJB_REF_NAME);
            LoginRemote loginRemote = loginHome.create();
            
            log.debug("Logging in");
            TCSubject sub = loginRemote.login(u.getUserName(),u.getPassword());
            
            Cookie c = new Cookie("user_id", String.valueOf(sub.getUserId()));
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
            c = new Cookie("loggedInStatus","true");
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
           
            persistor.setObject(request.getSession().getId()+"user_id",
                                new Long(sub.getUserId()));
            persistor.setObject(request.getSession().getId()+"loggedInStatus",
                                new Boolean(true));
        } catch (Exception e) {
            log.error("Authentication failed",e);
            throw new AuthenticationException(e.getMessage());
        }
    }
    
    /**
     * Logs out the current user.
     */
    public void logout() {
        Cookie c = new Cookie("user_id","");
        c.setMaxAge(0);
        response.addCookie(c);
        c = new Cookie("loggedInStatus","");
        c.setMaxAge(0);
        response.addCookie(c);
            
        persistor.removeObject(request.getSession().getId()+"user_id");
        persistor.removeObject(request.getSession().getId()+"loggedInStatus");
    }
    
}
