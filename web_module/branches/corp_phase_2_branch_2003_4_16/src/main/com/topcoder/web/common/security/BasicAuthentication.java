package com.topcoder.web.common.security;

import java.util.*;
import java.security.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.security.login.*;
import com.topcoder.shared.security.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Uses the TCS security component to process login requests, and HTTP cookies or a Persistor to store a User.
 *
 * @author Greg Paul, Ambrose Feinstein
 */
public class BasicAuthentication implements WebAuthentication {

    private static Logger log = Logger.getLogger(BasicAuthentication.class);

    private static final String USER_PERSISTOR_KEY = "user_obj";
    private static final String USER_COOKIE_NAME = "user_id";

    private Persistor persistor;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private User guest = SimpleUser.createGuest();

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request and response.
     */
    public BasicAuthentication(Persistor userPersistor, ServletRequest request, ServletResponse response) throws Exception {
        this.persistor = userPersistor;
        this.request = (HttpServletRequest) request;
        this.response = (HttpServletResponse) response;
    }

    /**
     * Use the security component to log the supplied user in.
     * If login succeeds, set a cookie and record status in the persistor.
     * If login fails, throw a LoginException.
     */
    public void login(User u) throws LoginException {
        log.info("attempting login as " + u.getUserName());
        try {
            LoginRemote login = (LoginRemote) Constants.createEJB(LoginRemote.class);
            TCSubject sub = login.login(u.getUserName(), u.getPassword());
            long uid = sub.getUserId();
            setCookie(uid);
            setUserInPersistor(makeUser(uid));
            log.info("login succeeded");

        } catch (Exception e) {
            log.info("login failed", e);
            throw new LoginException(e);
        }
    }

    /**
     * Figure out who the current user is using either a cookie if it's available, or the persistor.
     * 1.  remove their information from the persistor.
     * 2.  clear their identifying cookies
     */
    public void logout() {
        log.info("logging out");
        clearCookie();
        setUserInPersistor(guest);
    }

    /**
     * Get the user for this session.  May return information based on a
     * cookie from a prior session.  If no login has occurred and no cookie
     * is present, returns an anonymous user.
     */
    public User getActiveUser() {
        User u = getUserFromPersistor();
        if (u == null) {
            u = checkCookie();
            if (u==null) {
                u = guest;
            }
        }
        return u;
    }

    /**
     * Get the user for this session, only if they have logged in during
     * this session.  Otherwise returns an anonymous user.
     */
    public User getUser() {
        User u = getUserFromPersistor();
        if(u == null) u = guest;
        return u;
    }

    /** Fill in the name field from the user id. */
    private User makeUser(long id) {
        try {
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            UserPrincipal up = pmgr.getUser(id);
            return new SimpleUser(id, up.getName(), "");
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
     *
     * The intent here is that
     *   1) login cookies cannot be guessed
     *   2) changing your password should invalidate any login cookies which may exist
     *   3) login cookies cannot be used to gain any information about the password
     *
     * I would just tack on the crypted password itself, but they are
     * reversibly encrypted with a secret key using Blowfish, and I don't
     * know how well Blowfish holds up to a chosen-plaintext attack.
     *
     * Calling this function is quite expensive; it runs a query on OLTP,
     * which cannot be cached and still get immediate behavior 2 above.
     * note: greg paul - i've changed it to cache the password for 30 minutes to avoid the db hit.
     */
    private String hashForUser(long uid) throws Exception {
        CachedDataAccess dai = new CachedDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.OLTP_DATASOURCE_NAME));
        dai.setExpireTime(30*60*1000);   //cache their password for 30 minutes, this should help db load
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, "userid_to_password");
        dataRequest.setProperty("uid", Long.toString(uid));
        Map dataMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer)dataMap.get("userid_to_password");
        String password = rsc.getItem(0,0).toString();

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] plain = (Constants.hash_secret+uid+password).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for(int i=0; i<raw.length; i++)
            hex.append(Integer.toHexString(raw[i]&0xff));
        return hex.toString();
    }

    /**
     * Put a cookie in the response which will allow the user to be recognized
     * on their next visit.  The cookie includes the password hash generated by
     * {@link #hashForUser(long)}.
     *
     * public so com.topcoder.web.hs.controller.requests.Base can reach it, a bit of a kludge
     */
    public void setCookie(long uid) throws Exception {
        String hash = hashForUser(uid);
        Cookie c = new Cookie(USER_COOKIE_NAME, ""+uid+"|"+hash);
        // could set path here, but we have been assuming only one path is ever used
        c.setMaxAge(Integer.MAX_VALUE);  // this should fit comfortably, since the expiration date is a string on the wire
        response.addCookie(c);
    }

    /** Remove any cookie previously set on the client by the method above. */
    private void clearCookie() {
        Cookie c = new Cookie(USER_COOKIE_NAME, "");
        c.setMaxAge(0);
        response.addCookie(c);
    }

    /** Check each cookie in the request header for a cookie set above. */
    private User checkCookie() {
        Cookie[] ca = request.getCookies();
        for(int i=0; i<ca.length; i++)
            if(ca[i].getName().equals(USER_COOKIE_NAME)) {

                try {
                    StringTokenizer st = new StringTokenizer(ca[i].getValue(), "|");
                    long uid = Long.parseLong(st.nextToken());
                    String hash = hashForUser(uid);
                    if(!st.hasMoreTokens()) {  //@@@ special case to convert old cookies
                        log.info("replacing cookie in old format");
                        Cookie c = new Cookie(USER_COOKIE_NAME, ""+uid+"|"+hash);
                        c.setMaxAge(Integer.MAX_VALUE);
                        response.addCookie(c);
                    } else {
                        if(!hash.equals(st.nextToken())) continue;
                    }
                    return makeUser(uid);

                } catch(Exception e) {
                    log.info("exception parsing cookie", e);
                    /* junk in the cookie, ignore it */
                }
            }

        return null;
    }

    private User getUserFromPersistor() {
        return (User)persistor.getObject(request.getSession().getId()+USER_PERSISTOR_KEY);
    }

    /**
     * Record information about who is logged in and at what level in the
     * persistor.  Done to avoid expensive rechecking of the cookie, and to
     * handle logins which expire with the session.
     *
     * @param user
     */
    private void setUserInPersistor(User user) {
        persistor.setObject(request.getSession().getId()+USER_PERSISTOR_KEY, user);
    }
}
