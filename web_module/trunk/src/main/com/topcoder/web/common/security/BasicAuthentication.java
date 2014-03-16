/*
 * Copyright (C) 2006 - 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security;

import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.dto.SessionSocialAccount;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;

import javax.servlet.http.Cookie;

import org.apache.commons.lang.StringUtils;

/**
 * Uses the TCS security component to process login requests, and HTTP cookies or a Persistor to store a User.
 * <p>
 * Change log v1.1 (TCCC-5802) [ https://apps.topcoder.com/bugs/browse/TCCC-5802 ] 
 *<ol>
 * <li>Refactor the SSO cookie logic into <code>SSOCookieService</code>.</li>
 * <li>Remove redundant authentication cookies.</li>
 *</ol>
 *</p>
 *
 *<p>
 * Change log v1.2 (BUGR-10718) [ https://apps.topcoder.com/bugs/browse/BUGR-10718 ] 
 *<ol>
 * <li>Add logic to store the JWT cookie similar to SSO cookie.</li>
 *</ol>
 *</p>
 * <p>
 * <b> Thread Safety:</b> This class is mutable (field knownUser)so not thread safty.
 *</p>
 *
 * @author Greg Paul, Ambrose Feinstein, ecnu_haozi, MonicaMuranyi
 * @version 1.2
 */
public class BasicAuthentication implements WebAuthentication {

    private static Logger log = Logger.getLogger(BasicAuthentication.class);

    private static final String USER_PERSISTOR_KEY = "user_obj";

    private Persistor persistor;
    private TCRequest request;
    private TCResponse response;
    private User guest = SimpleUser.createGuest();
    protected Resource defaultCookiePath;
    protected String dataSource;
    private boolean knownUser;

    /**
     * You can choose to join in SSO ring by setting defaultCookiePath to MAIN_SITE,
     * and you can quit the SSO ring by setting it to other values. If you quit the SSO ring, 
     * no auth cookie will be generated.
     */
    public static final Resource MAIN_SITE = new SimpleResource("main");
    public static final Resource REG_SITE = new SimpleResource("reg");
    /*
    just use main site now, with SSO
        public static final Resource CORP_SITE = new SimpleResource("corp");
        public static final Resource EP_SITE = new SimpleResource("ep");
        public static final Resource HS_SITE = new SimpleResource("hs");
    */
    public static final Resource PRIVATE_LABEL_SITE = new SimpleResource("pl");
    /*  juse use main site now, with SSO
        public static final Resource LONG_CONTEST_SITE = new SimpleResource("lc");
        public static final Resource STUDIO_SITE = new SimpleResource("studio");
    */
    //public static final Resource PACTS_INTERNAL_SITE = new SimpleResource("pacts");
    public static final Resource CSF_SITE = new SimpleResource("csf");
    //we'll use this key to provide a way to keep someone logged in accross sessions.
    //sessions only live within a web app, but we really want to be able to keep
    //them logged in across web apps.

    private boolean readOnly = false;

    /**
     * The SSO cookie service provider.
     * @since 1.1
     */
    private SSOCookieService ssoCookieService;
    
    /**
     * The JWT cookie service provider.
     * @since 1.1
     */
    private JWTCookieService jwtCookieService;


    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request and response.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @throws Exception
     */
    public BasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        this(userPersistor, request, response, MAIN_SITE);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request, response and cookie path resource.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @param r
     * @throws Exception
     */
    public BasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, Resource r) throws Exception {
        this(userPersistor, request, response, MAIN_SITE, null);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request and response.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @param dataSource
     * @throws Exception
     */
    public BasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, String dataSource) throws Exception {
        this(userPersistor, request, response, MAIN_SITE, dataSource);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request, response and cookie path resource.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @param r
     * @param dataSource
     * @throws Exception
     */
    public BasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, Resource r, String dataSource) throws Exception {
        this.persistor = userPersistor;
        this.request = request;
        this.response = response;
        this.defaultCookiePath = r;
        this.dataSource = dataSource;
        this.readOnly = this.response == null;

        this.ssoCookieService = new SSOCookieServiceImpl();
        this.jwtCookieService = new JWTCookieServiceImpl();
/*
        if (log.isDebugEnabled()) {
            log.debug("readonly " + readOnly);
        }
*/
    }

    /**
     * Use the security component to log the supplied user in.
     * If login succeeds, set a cookie and record status in the persistor.
     * If login fails, throw a LoginException.
     *
     * @param u
     * @returns User instance
     * @throws LoginException
     */
    public User login(User u) throws LoginException {
        return login(u, true);
    }

    /**
     * Use the security component to log the supplied user in.
     * If login succeeds, set a cookie if rememberUser is true, and record status in the persistor.
     * If login fails, throw a LoginException.
     *
     * @param u
     * @param rememberUser whether or not the user
     *                     should be recognized the next time attempt to use the site
     *                     basically we're setting a cookie to remember them (getActiveUser())
     * @returns User instance
     * @throws LoginException
     */
    public User login(User u, boolean rememberUser) throws LoginException {
        if (readOnly) {
            throw new RuntimeException("Sorry, this intance can not be used to login because it is read only, it was instantiated with no response object.");
        }
        log.info("attempting login as " + u.getUserName() + " path: " + defaultCookiePath.getName() + " remember " + rememberUser);
        try {
            LoginRemote login = (LoginRemote) Constants.createEJB(LoginRemote.class);
            TCSubject sub;
            if (dataSource == null) {
                log.debug("data source was null");
                sub = login.login(u.getUserName(), u.getPassword());
            } else {
                log.debug("datasource was not null");
                sub = login.login(u.getUserName(), u.getPassword(), dataSource);
            }
            String jsonWebToken = null;
            SessionSocialAccount socialAccount = (SessionSocialAccount) request.getSession().getAttribute(RegistrationHelper.SOCIAL_ACCOUNT_SESSION_KEY);
			if(socialAccount != null){
				jsonWebToken = socialAccount.getSocialAccount().getJsonWebToken();
			}

            boolean isImpersonationUsed = (u.getUserName().indexOf("/") >= 0);
            if (isImpersonationUsed) {
               setLoginCookies(sub.getUserId(), jsonWebToken, false);
            } else {
               setLoginCookies(sub.getUserId(), jsonWebToken, rememberUser);
            }

            log.info("login succeeded");

            return makeUser(sub.getUserId());
        } catch (Exception e) {
            log.info("login failed", e);
            //not necessarily accurate, but gotta say something...
            throw new LoginException("Handle or password incorrect.");
        }
    }

    /**
     * Sets the tcsso and jwt cookies
     * @param uid the user id.
     * @param jsonWebToken the json web token.
     * @param rememberUser a flag to indicate if the user select rememberMe checkbox while logging in.
     * @throws Exception if any error occurs.
     */
    protected void setLoginCookies(long uid, String jsonWebToken, boolean rememberUser) throws Exception {
        
        // mark the user known and not guest.
        if (uid != guest.getId()) {
            markKnownUser();
        }
        
        //join in SSO ring only when MAIN_SITE.

        if(inSSORing()) {
            ssoCookieService.setSSOCookie(response, uid, rememberUser);
            if(StringUtils.isNotEmpty(jsonWebToken)){
            	jwtCookieService.setJWTCookie(response, jsonWebToken, rememberUser);
            }
        } else {
            //Store the user in Pesistor (Session here).
            setUserInPersistor(makeUser(uid));
        }
    }

    /**
     * Figure out who the current user is using either a cookie if it's available, or the persistor.
     * 1.  remove their information from the persistor.
     * 2.  clear their identifying cookies
     */
    public void logout() {
        if (readOnly) {
            throw new RuntimeException("Sorry, this intance can not be used to logout because it is read only, it was instantiated with no response object.");
        }

        log.info("logging out");
        
        if (inSSORing()) {
            ssoCookieService.removeSSOCookie(response);
            jwtCookieService.removeJWTCookie(response);
        } else {
            //Store the user in Pesistor (Session here).
            setUserInPersistor(guest);
        }
    }

    /**
     * To check if sso cookie exist in the client's request.
     * @return true if the sso cookie exist whatever the cookie value is, otherwise false.
     */
    public boolean existSSOCookie() {
        return inSSORing() && ssoCookieService.existSSOCookie(request);
    }

    /**
     * Get the user for SSO cookie if in SSO ring, otherwise get the user for session.
     * If neither is found return an anonymous user.
     */
    public User getActiveUser() {
        return getUser();
    }

    /**
     * Get the user for SSO cookie if in SSO ring, otherwise get the user for session.
     * If neither is found return an anonymous user.
     */
    public User getUser() {
        User u = guest;

        if (inSSORing()) {
            Long uid = null;
            try {
                uid = ssoCookieService.getUserIdFromSSOCookie(request);
            } catch (Exception e) {
                // ingore, and keep the uid as null.
                log.warn("Can not get a valid user id from the request by chceking its SSO cookie", e);
            }
            if (uid == null) {
                log.debug("didn't find user via sso");
                u = guest;
            } else {
                log.debug("user was in the sso cookie");
                u = makeUser(uid);
            }
        } else {
            u = getUserFromPersistor();
            if (u == null) {
                u = guest;
            }
        }

        if (!u.isAnonymous() && !readOnly) {
            markKnownUser();
        }
        return u;
    }

    /**
     * Check if the current tc web app in sso ring or not.
     * @return true if in sso ring, false otherwise.
     * @since 1.1
     */
    private boolean inSSORing() {
        return MAIN_SITE.equals(defaultCookiePath);
    }

    protected User makeUser(long id) {
        try {
            if (id == guest.getId()) {
                return guest;
            } else {
                PrincipalMgrLocal pmgr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
                if (dataSource == null) {
                    UserPrincipal up = pmgr.getUser(id);
                    return new SimpleUser(id, up.getName(), "");
                } else {
                    UserPrincipal up = pmgr.getUser(id, dataSource);
                    return new SimpleUser(id, up.getName(), "");
                }
            }
        } catch (Exception e) {
            log.warn("caught exception in makeUser with id = " + id, e);
            e.printStackTrace();
            return guest;
        }
    }

    private void markKnownUser() {
        if (!isKnownUser()) {
            Cookie c = new Cookie(KNOWN_USER, String.valueOf(true));
            c.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(c);
            log.debug("add known user cookie");
        }
        knownUser = true;
    }


    private User getUserFromPersistor() {
/*
        if (log.isDebugEnabled()) {
            log.debug("session id: " + request.getSession().getId());
        }
*/
        //given the way tomcat/apache handles sessions in a cluster, we can't do this
        //because the session id is different on the two nodes.  potentially we could
        //trim it and stuff to make it the same, but, i'm just gonna cheat and not use it.
        //it breaks the idea of a pluggable persistor, but we never use that anyway.

//        return (User) persistor.getObject(request.getSession().getId() + USER_PERSISTOR_KEY);
        return (User) persistor.getObject(USER_PERSISTOR_KEY);
    }

    /**
     * Record information about who is logged in and at what level in the
     * persistor.  Done to avoid expensive rechecking of the cookie, and to
     * handle logins which expire with the session.
     *
     * @param user
     */
    protected void setUserInPersistor(User user) {
        //log.debug("set " + user.getUserName() + " as logged in");
        //given the way tomcat/apache handles sessions in a cluster, we can't do this
        //because the session id is different on the two nodes.  potentially we could
        //trim it and stuff to make it the same, but, i'm just gonna cheat and not use it.
        //it breaks the idea of a pluggable persistor, but we never use that anyway.

        //persistor.setObject(request.getSession().getId() + USER_PERSISTOR_KEY, user);
        persistor.setObject(USER_PERSISTOR_KEY, user);
    }

    public boolean isKnownUser() {
        if (knownUser) {
            return true;
        } else {
            Cookie[] ca = request.getCookies();
            boolean found = false;
            for (int i = 0; ca != null && i < ca.length && !found; i++) {
                found = KNOWN_USER.equals(ca[i].getName());
            }
            return found;
        }
    }
}
