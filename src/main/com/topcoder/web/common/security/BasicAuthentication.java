package com.topcoder.web.common.security;

import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.cache.MaxAge;

import javax.servlet.http.Cookie;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * Uses the TCS security component to process login requests, and HTTP cookies or a Persistor to store a User.
 *
 * @author Greg Paul, Ambrose Feinstein
 * @version $Id: BasicAuthentication.java 76893 2010-01-09 00:21:46Z ivern $
 */
public class BasicAuthentication implements WebAuthentication {

    private static Logger log = Logger.getLogger(BasicAuthentication.class);

    private static final String USER_PERSISTOR_KEY = "user_obj";
    private static final String USER_COOKIE_NAME = "user_id";

    private Persistor persistor;
    private TCRequest request;
    private TCResponse response;
    private User guest = SimpleUser.createGuest();
    protected Resource defaultCookiePath;
    protected String dataSource;
    private boolean knownUser;

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
    private static final String BIG_SESSION_KEY = "tcsso";
    private static final int SSO_TIMEOUT_SECONDS = 60 * 30;
    private static final String LOGGED_OUT = "logout";

    //cache this because it's expensive to generate
    private String userHash = null;
    private boolean readOnly = false;

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
     * @throws LoginException
     */
    public void login(User u) throws LoginException {
        login(u, true);
    }

    /**
     * Use the security component to log the supplied user in.
     * If login succeeds, set a cookie if rememberUser is true, and record status in the persistor.
     * If login fails, throw a LoginException.
     *
     * @param u
     * @throws LoginException
     */
    public void login(User u, boolean rememberUser) throws LoginException {
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
            setLoginCookies(sub.getUserId(), rememberUser);
            log.info("login succeeded");

        } catch (Exception e) {
            log.info("login failed", e);
            //not necessarily accurate, but gotta say something...
            throw new LoginException("Handle or password incorrect.");
        }
    }

    protected void setLoginCookies(long uid, boolean rememberUser) throws Exception {
        setCookie(uid, rememberUser);
        setUserInPersistor(makeUser(uid));
        setBigSessionCookie(uid);
        addGeneralCookie(defaultCookiePath.getName() + "_" + LOGGED_OUT, String.valueOf(false), Integer.MAX_VALUE);
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
        clearCookie();
        clearBigCookie();
        setUserInPersistor(guest);
        addGeneralCookie(defaultCookiePath.getName() + "_" + LOGGED_OUT, String.valueOf(true), Integer.MAX_VALUE);
    }

    private void addGeneralCookie(String name, String value, int time) {
        Cookie c = new Cookie(name + "_" + ApplicationServer.ENVIRONMENT, value);
        c.setMaxAge(time);
        c.setDomain(ApplicationServer.SSO_DOMAIN);
        c.setPath("/");
        response.addCookie(c);

    }


    private Boolean loggedOut = null;

    private boolean isLoggedOut() {
        final String LOGOUT_KEY = defaultCookiePath.getName() + "_" + LOGGED_OUT + "_" + ApplicationServer.ENVIRONMENT;
        if (loggedOut == null) {
            Cookie[] ca = request.getCookies();
            for (int i = 0; ca != null && i < ca.length; i++) {
                if (ca[i].getName().equals(LOGOUT_KEY)) {
                    if (String.valueOf(true).equals(ca[i].getValue())) {
                        loggedOut = true;
                    }
                }
            }
            if (loggedOut == null) {
                loggedOut = false;
            }
        }
/*
        if (log.isDebugEnabled()) {
            log.debug("logged out is " + loggedOut);
        }
*/
        return loggedOut;

    }


    /**
     * Get the user for this session.  May return information based on a
     * cookie from a prior session.  If no login has occurred and no cookie
     * is present, returns an anonymous user.
     */
    public User getActiveUser() {
        /*
         * check if they're logged in.  accessing the current persistor implementation
         * is quicker than accessing the cookie because of the hash.  if they are
         * not logged in, hope is not lost, we may have cached them in the persistor
         * before as being "identified", in this case, use that.  if that too is not
         * there, we're forced to go to the cookie, but cache that for subsequent
         * requests in the persistor.  if they're not in the cookie either, then
         * they're anonymous
         */
        if (isLoggedOut()) {
            log.debug("user logged out previously");
            return guest;
        } else {
            User u = getUser();
            if (u == null || u.getId() == guest.getId()) {
                //given the way tomcat/apache handles sessions in a cluster, we can't do this
                //because the session id is different on the two nodes.  potentially we could
                //trim it and stuff to make it the same, but, i'm just gonna cheat and not use it.
                //it breaks the idea of a pluggable persistor, but we never use that anyway.
//            u = (User) persistor.getObject(request.getSession().getId() + USER_COOKIE_NAME);
                u = (User) persistor.getObject(USER_COOKIE_NAME);
                if (u == null) {
                    u = checkCookie();
                    if (u == null) {
                        u = guest;
                        //log.debug("*** made up a guest ***");
                    } else {
                        //log.debug("*** " + u.getUserName() + " was in cookie ***");
                    }
                    //given the way tomcat/apache handles sessions in a cluster, we can't do this
                    //because the session id is different on the two nodes.  potentially we could
                    //trim it and stuff to make it the same, but, i'm just gonna cheat and not use it.
                    //it breaks the idea of a pluggable persistor, but we never use that anyway.
//                persistor.setObject(request.getSession().getId() + USER_COOKIE_NAME, u);
                    persistor.setObject(USER_COOKIE_NAME, u);
                } else {
                    //log.debug("*** " + u.getUserName() + " was stale ***");
                }
            } else {
                //log.debug("*** " + u.getUserName() + " was live***");
            }
            if (!u.isAnonymous() && !readOnly) {
                markKnownUser();
            }
            return u;
        }
    }

    /**
     * Get the user for this session, only if they have logged in during
     * this session.  Otherwise returns an anonymous user.
     */
    public User getUser() {
        if (isLoggedOut()) {
            log.debug("user logged out previously");
            return guest;
        } else {
            User u = getUserFromPersistor();
            if (u == null || u.getId() == guest.getId()) {
                u = checkBigSession();
                if (u == null) {
                    //log.debug("didn't find user via sso");
                    u = guest;
                } else {
                    log.debug("user was in the sso cookie");
                }
                //essentially, cache it in the session so that we don't have to go to the cookie again
                setUserInPersistor(u);
            } else {
                log.debug("user was in session");
            }
            if (!u.isAnonymous() && !readOnly) {
                markKnownUser();
            }
            return u;

        }
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

    /**
     * Compute a one-way hash of a userid and the corresponding crypted
     * password, plus a magic string thrown in for good measure.  Salting
     * this might be nice, but it doesn't seem to buy us anything as long
     * as the magic string remains a secret.
     * <p/>
     * The intent here is that
     * 1) login cookies cannot be guessed
     * 2) changing your password should invalidate any login cookies which may exist
     * 3) login cookies cannot be used to gain any information about the password
     * 4) if user status changes, it invalidates login cookies
     * <p/>
     * I would just tack on the crypted password itself, but they are
     * reversibly encrypted with a secret key using Blowfish, and I don't
     * know how well Blowfish holds up to a chosen-plaintext attack.
     * <p/>
     * Calling this function is quite expensive; it runs a query on OLTP,
     * which cannot be cached and still get immediate behavior 2 above.
     * note: gpaul - i've changed it to cache the password for 30 minutes to avoid the db hit.
     * but it is still pretty intensive...currently takes around 300 ms
     *
     * @param uid the user id
     * @return the hash
     * @throws Exception if there is a problem getting data from the data base or if the MD5 algorithm doesn't exist
     */
    private String hashForUser(long uid) throws Exception {
        //log.debug("hash for user: " + uid);
        if (userHash == null) {
            CachedDataAccess dai = new CachedDataAccess(MaxAge.HALF_HOUR, DBMS.OLTP_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setProperty(DataAccessConstants.COMMAND, "userid_to_password");
            dataRequest.setProperty("uid", Long.toString(uid));
            Map dataMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) dataMap.get("userid_to_password");
            String password = rsc.getStringItem(0, "password");
            String status = rsc.getStringItem(0, "status");

            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] plain = (Constants.hash_secret + uid + password + status).getBytes();
            byte[] raw = md.digest(plain);
            StringBuffer hex = new StringBuffer();
            for (byte aRaw : raw) hex.append(Integer.toHexString(aRaw & 0xff));
            userHash = hex.toString();
        }
        return userHash;

    }

    /**
     * Compute a one-way hash of a password, similar to how a userid/password combination is hashed.
     *
     * @param password the password to hash
     * @return the hashed password
     * @throws NoSuchAlgorithmException if MD5 doesn't exist
     */
    public String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] plain = (Constants.hash_secret + password).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for (byte aRaw : raw) hex.append(Integer.toHexString(aRaw & 0xff));
        return hex.toString();
    }

    /**
     * Put a cookie in the response which will allow the user to be recognized
     * on their next visit.  The cookie includes the password hash generated by
     * {@link #hashForUser(long)}.
     * <p/>
     * public so com.topcoder.web.hs.controller.requests.Base can reach it, a bit of a kludge
     *
     * @param uid          the user id
     * @param rememberUser whether to set the cookie or not
     * @throws Exception if there is a problem creating the has
     */
    public void setCookie(long uid, boolean rememberUser) throws Exception {
        if (readOnly) {
            throw new RuntimeException("Sorry, this intance can not be used to set a cookie because it is read only, it was instantiated with no response object.");
        }

        if (rememberUser) {
            addGeneralCookie(defaultCookiePath.getName() + "_" + USER_COOKIE_NAME,
                    uid + "|" + hashForUser(uid), Integer.MAX_VALUE);
        }
        if (uid != guest.getId()) {
            markKnownUser();
        }
    }

    /**
     * Remove cookie previously set on the client by the method above.
     */
    private void clearCookie() {
        addGeneralCookie(defaultCookiePath.getName() + "_" + USER_COOKIE_NAME, "", 0);
    }


    /**
     * Check each cookie in the request header for a cookie set above.
     *
     * @return
     */
    public User checkCookie() {
        //log.debug("checkCookie called...");
        Cookie[] ca = request.getCookies();
        for (int i = 0; ca != null && i < ca.length; i++) {
            //log.debug(ca[i].getName() + " " + ca[i].getValue());
            if (ca[i].getName().equals(defaultCookiePath.getName() + "_" + USER_COOKIE_NAME + "_" + ApplicationServer.ENVIRONMENT)) {

                try {
                    StringTokenizer st = new StringTokenizer(ca[i].getValue(), "|");
                    long uid = Long.parseLong(st.nextToken());
                    if (uid < 1) continue;
                    String hash = hashForUser(uid);
                    if (!hash.equals(st.nextToken())) continue;
                    return makeUser(uid);

                } catch (Exception e) {
                    log.warn("exception parsing cookie", e);
                    /* junk in the cookie, ignore it */
                }
            }
        }
        return null;
    }

    private String cookieList() {
        StringBuilder buf = new StringBuilder(100);
        if (request.getCookies() != null) {
            for (Cookie c : request.getCookies()) {
                buf.append(c.getName()).append(", ");
            }
        }
        return buf.toString();
    }

    /**
     * Add a cookie that will work across domains to help us preserve
     * a user http session between web applications and domains.
     * <p/>
     * Only do this for the "MAIN_SITE".  for example, ignore
     * other sites like privatelablel.  sites with a different user base
     * should not participate in the SSO session
     *
     * @param uid
     * @throws Exception
     */
    private void setBigSessionCookie(long uid) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("set sso cookie for " + uid);
        }
        if (MAIN_SITE.equals(defaultCookiePath)) {
            addGeneralCookie(defaultCookiePath.getName() + "_" + BIG_SESSION_KEY, uid + "|" + hashForUser(uid), SSO_TIMEOUT_SECONDS);
        }
    }

    /**
     * Remove any cookie previously set on the client by the method above.
     * <p/>
     * Only do this for the "MAIN_SITE".  for example, ignore
     * other sites like privatelablel.  sites with a different user base
     * should not participate in the SSO session
     */
    private void clearBigCookie() {
        if (MAIN_SITE.equals(defaultCookiePath)) {
            addGeneralCookie(defaultCookiePath.getName() + "_" + BIG_SESSION_KEY, "", 0);
        }
    }

    /**
     * Only do this for the "MAIN_SITE".  for example, ignore
     * other sites like privatelablel.  sites with a different user base
     * should not participate in the SSO session
     *
     * @return the user if found
     */
    private User checkBigSession() {
        if (MAIN_SITE.equals(defaultCookiePath)) {
            Cookie[] ca = request.getCookies();

            for (int i = 0; ca != null && i < ca.length; i++) {
                //log.debug(ca[i].getName() + " " + ca[i].getValue());
                if (ca[i].getName().equals(defaultCookiePath.getName() + "_" + BIG_SESSION_KEY + "_" + ApplicationServer.ENVIRONMENT)) {

                    try {
                        StringTokenizer st = new StringTokenizer(ca[i].getValue(), "|");
                        long uid = Long.parseLong(st.nextToken());
                        if (uid < 1) continue;
                        String hash = hashForUser(uid);
                        if (!hash.equals(st.nextToken())) continue;
                        return makeUser(uid);

                    } catch (Exception e) {
                        log.warn("exception parsing cookie", e);
                        /* junk in the cookie, ignore it */
                    }
                }
            }
        }
        return null;

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