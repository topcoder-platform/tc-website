package com.topcoder.web.common.security;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import com.topcoder.security.admin.*;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.*;

/**
 * Performs authentication using the TCS security component. Uses cookies and
 * a Persistor object for persistent identity storage.
 * @author  Porgery
 */
public class BasicAuthentication implements WebAuthentication {
    
    Persistor persistor;
    HttpServletRequest request;
    HttpServletResponse response;
    
    /** Creates a new instance of BasicAuthentication */
    private BasicAuthentication() {
    }
    
    public BasicAuthentication(Persistor userPersistor, ServletRequest request,
    ServletResponse response) {
        this.persistor = userPersistor;
        this.request = (HttpServletRequest)request;
        this.response = (HttpServletResponse)response;
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
            if(userCookie == null || loggedInCookie == null)
                return -1;
            if(!loggedInCookie.getValue().equals("true"))
                return -1;
            return Long.parseLong(userCookie.getValue());
        } catch (Exception e) {
            return -1;
        }
    }
    
    private long getIdFromPersistor(){
        try{
            String key = request.getSession().getId()+"user_id";
            Long persistId = (Long)persistor.getObject(key);
            if(persistId != null){
                key = request.getSession().getId()+"loggedInStatus";
                String loggedIn = (String)persistor.getObject(key);
                if(loggedIn != null && loggedIn.equals("true")){
                    return persistId.longValue();
                }
            }
        } catch (Exception e) {
        }
        return -1;
    }
    
    /** Gets the current user's information.
     * @return A User object representing the current user.
     */
    public User getUser() {
        long id = getIdFromPersistor();
        if(id == -1)
            id = getIdFromCookie();
        
        return new SimpleUser(id,null,null);
    }
    
    /**
     * Determines whether the user is currently logged in.
     * @return True if the user is logged in, false otherwise.
     */
    public boolean isLoggedIn() {
        return isLoggedIn(true);
    }
    
    /**
     * For sensitive areas where a cookie is not sufficient authentication,
     * this method provides the option to ignore the cookie.
     * @param checkCookie True if the cookie should be consulted, false if not.
     * @return  True if the user is logged in, false otherwise.
     */
    public boolean isLoggedIn(boolean checkCookie) {
        if(getIdFromPersistor() != -1)
            return true;
        if(checkCookie){
            if(getIdFromCookie() != -1)
                return true;
        }
        return false;
    }
    
    /**
     * Attempts to log in the given user.
     * @param u User object to be authenticated.
     * @throws AuthenticationException Thrown if the login does not succeed.
     */
    public void login(User u) throws AuthenticationException {
        if(request == null)
            throw new AuthenticationException("HttpServletRequest unavailable");
        if(response == null)
            throw new AuthenticationException("HttpServletResponse unavailable");
   
        try {
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY,
                "org.jnp.interfaces.NamingContextFactory");
            env.put(Context.PROVIDER_URL, "172.16.20.40:1099");
            InitialContext context = new InitialContext(env);
            
            LoginRemoteHome loginHome = (LoginRemoteHome)
                context.lookup(LoginRemoteHome.EJB_REF_NAME);
            LoginRemote loginRemote = loginHome.create();
            
            TCSubject sub = loginRemote.login(u.getUserName(),u.getPassword());
            
            response.addCookie(new Cookie("user_id",
                                          String.valueOf(sub.getUserId())));
            response.addCookie(new Cookie("loggedInStatus","true"));
            
            persistor.setObject(request.getSession().getId()+"user_id",
                                new Long(sub.getUserId()));
            persistor.setObject(request.getSession().getId()+"loggedInStatus",
                                new Boolean(true));
        } catch (Exception e) {
            throw new AuthenticationException(e.getMessage());
        }
    }
    
    /**
     * Logs out the current user.
     */
    public void logout() {
        response.addCookie(new Cookie("user_id",""));
        response.addCookie(new Cookie("loggedInStatus",""));
            
        persistor.removeObject(request.getSession().getId()+"user_id");
        persistor.removeObject(request.getSession().getId()+"loggedInStatus");
    }
    
}
