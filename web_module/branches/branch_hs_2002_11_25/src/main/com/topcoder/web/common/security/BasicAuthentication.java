package com.topcoder.web.common.security;

import java.util.Hashtable;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.security.admin.*;
import com.topcoder.security.login.*;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.*;

/**
 * Uses the TCS security component to process login requests, and HTTP cookies or a Persistor to store a User.
 *
 * @author Greg Paul, Ambrose Feinstein
 */
public class BasicAuthentication implements WebAuthentication {

    private Persistor persistor;
    private HttpServletRequest request;
    private HttpServletResponse response;

    /**
     * Construct an authentication instance backed by the given persistor and HTTP request and response.
     */
    public BasicAuthentication(Persistor userPersistor, ServletRequest request, ServletResponse response) {
        this.persistor = userPersistor;
        this.request = (HttpServletRequest)request;
        this.response = (HttpServletResponse)response;
    }
  
    /**
     * use the security component to log the supplied user in.
     * if (successfulLogin) 
     *   1.  add user_id, loggedInStatus cookies to response
     *   2.  add user_id to Persistor as a value with key=request.getSession().getId()+"user_id"
     *   3.  add a flag to the session saying that the user has logged in the current session.  a user
             will have to have this flag set in order to get isLoggedIn(false) to return true.  meaning
             that ignoring the cookie, the user is logged in.
     * if (!successfulLogin) throw AuthenticationException (or equivalent)
     */
    public void login(User u) {

        try {
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            env.put(Context.PROVIDER_URL, "172.16.20.40:1099");
            InitialContext context = new InitialContext(env);
            LoginRemoteHome loginHome = (LoginRemoteHome)context.lookup(LoginRemoteHome.EJB_REF_NAME);
            LoginRemote loginRemote = loginHome.create();

            TCSubject sub = loginRemote.login(u.getUserName(),u.getPassword());
            Long uid = new Long(sub.getUserId());

            response.addCookie(new Cookie("user_id", uid.toString());
            response.addCookie(new Cookie("session_verified", "yes"));

            persistor.setObject(request.getSession().getId()+"user_id", new Long(sub.getUserId()));
            persistor.setObject(request.getSession().getId()+"session_verified", "yes");

        } catch (Exception e) {
            throw new AuthenticationException(e);
        }
    }

    /**
     * Figure out who the current user is using either a cookie if it's available, or the persistor.
     * 1.  remove their information from the persistor. 
     * 2.  clear their identifying cookies
     * 3.  clear any information in the session associated with them
     */
    public void logout() {

        persistor.removeObject(request.getSession().getId()+"user_id");
        persistor.removeObject("session_verified");
        response.addCookie(new Cookie("user_id", ""));
        response.addCookie(new Cookie("session_verified", ""));
    }

    /**
     * Figure out who the current user is using either a cookie if it's available, or the persistor.
     * if there is no user, create a SimpleUser object with anonymous user information.  if there 
     * is a user create a SimpleUser object to be returned.  for now, just populate the id 
     * attribute and leave handle and password empty.   
     */ 
    public User getUser() {

        /* check each cookie in the request header */
        Cookies[] ca = request.getCookies();
        for(int i=0; i<ca.length; i++)
            if(ca[i].getName().equals("user_id"))
                return new SimpleUser(Long.parseLong(ca[i].getValue()));

        /* forward to the method below */
        return getActiveUser();
    }

    /**
     * This version should only check the persistor.  if the user is not in the persistor, then 
     * return an anonymous user object.
     */ 
    public User getActiveUser() {

        /* check the persistor */
        Long uid = (Long)persistor.getObject(request.getSession().getId()+"user_id");
        if(uid != null)
            return new SimpleUser(o.longValue());

        /* found nothing */
        return new SimpleUser();
    }
}
