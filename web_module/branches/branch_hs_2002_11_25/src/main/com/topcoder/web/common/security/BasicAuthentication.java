package com.topcoder.web.common.security;

import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.security.login.*;
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
    private LoginRemote login;
    private PrincipalMgrRemote pmgr;

    /**
     * Construct an authentication instance backed by the given persistor and HTTP request and response.
     */
    public BasicAuthentication(Persistor userPersistor, ServletRequest request, ServletResponse response) throws Exception {
        this.persistor = userPersistor;
        this.request = (HttpServletRequest)request;
        this.response = (HttpServletResponse)response;
        this.login = (LoginRemote)Constants.createEJB(LoginRemote.class);
        this.pmgr = (PrincipalMgrRemote)Constants.createEJB(PrincipalMgrRemote.class);
    }
  
    /**
     * use the security component to log the supplied user in.
     * if (successfulLogin) 
     *   1.  add user_id cookie to response
     *   2.  add user_id to Persistor as a value with key=request.getSession().getId()+"user_id"
     * if (!successfulLogin) throw AuthenticationException (or equivalent)
     */
    public void login(User u) throws LoginException {

        try {
            TCSubject sub = login.login(u.getUserName(), u.getPassword());
            Long uid = new Long(sub.getUserId());

            response.addCookie(new Cookie("user_id", uid.toString()));
            persistor.setObject(request.getSession().getId()+"user_id", new Long(sub.getUserId()));

        } catch (Exception e) {
            throw new LoginException(e);
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
        response.addCookie(new Cookie("user_id", ""));
    }

    /**
     * Figure out who the current user is using either a cookie if it's available, or the persistor.
     * if there is no user, create a SimpleUser object with anonymous user information.  if there 
     * is a user create a SimpleUser object to be returned.  for now, just populate the id 
     * attribute and leave handle and password empty.   
     */ 
    public User getUser() {

        /* check each cookie in the request header */
        Cookie[] ca = request.getCookies();
        for(int i=0; i<ca.length; i++)
            if(ca[i].getName().equals("user_id"))
                return makeUser(Long.parseLong(ca[i].getValue()));

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
            return makeUser(uid.longValue());

        /* found nothing */
        return new SimpleUser();
    }

    /** Fill in the name field from the user id. */
    private User makeUser(long id) {
        try {
            UserPrincipal up = pmgr.getUser(id);
            return new SimpleUser(id, up.getName(), "");
        } catch(Exception e) {
            System.out.println("@@@ caught in makeUser with id = "+id);
            return new SimpleUser(id, "", "");
        }
    }
}
