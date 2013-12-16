/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.cache.MaxAge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.HashMap;
import java.util.StringTokenizer;

/**
 * <p>
 * This class implements the interface SSOCookieService.
 * </p>
 * <p>
 * <b> Thread Safety:</b> This class is immutable thus thread-safe.
 * </p>
 * @author ecnu_haozi
 * @version 1.0
 * @since 1.0 (TCCC-5802    https://apps.topcoder.com/bugs/browse/TCCC-5802)
 */
public class SSOCookieServiceImpl implements SSOCookieService {
    /**
     * Constructor.
     */
    public SSOCookieServiceImpl(){
    }

    /**
     * <p>
     * When the user try to log in, this method is called to set a SSO cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     * @param userId the user id.
     * @param rememberMe a flag to indicate if the user select rememberMe checkbox while logging in.
     * @throws Exception if any error occurs.
     */
    public void setSSOCookie(HttpServletResponse response, long userId, boolean rememberMe) throws Exception {
        String userIdentity = userId + "|" + hashForUser(userId);
        if (rememberMe) {
            //This is a persistent cookie which will persist unless the user log out or change password.
            response.addCookie( createCookie(ApplicationServer.SSO_COOKIE_KEY, userIdentity, Integer.MAX_VALUE));
        } else {
            //This is a session cookie which will invalidate when the user exit the browser.
            response.addCookie( createCookie(ApplicationServer.SSO_COOKIE_KEY, userIdentity, null));
        }
    }
    /**
     * <p>
     * Remove the SSO cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     */
    public void removeSSOCookie(HttpServletResponse response) {
         response.addCookie( createCookie(ApplicationServer.SSO_COOKIE_KEY, "", 0));
    }

    /**
     * <p>
     * Check if the SSO cookie exist in the user's browser. No matter what the SSO cookie's value is.
     * </p>
     * @param request the HTTP request sent from the user's browser.
     * @return true if the SSO cookie exist, false otherwise.
     */
    public boolean existSSOCookie(HttpServletRequest request) {
        // Get cookies from the request
        Cookie[] cookies = request.getCookies();

        // no cookies, return null
        if (cookies == null) {
            return false;
        }

        Cookie ssoCookie = getCookie(cookies, ApplicationServer.SSO_COOKIE_KEY);

        if (ssoCookie == null) {
            return false;
        }
        return true;
    }

    /**
     * <p>
     * Retrieve user identity from the SSO cookie in the user's browser. 
     * </p>
     * @param request the HTTP request sent from the user's browser.
     * @return the user id. If the sso cookie doesn't exist or the sso cookie's value is invalid, return NULL.
     * @throws Exception if any error occurs.
     */
    public Long getUserIdFromSSOCookie(HttpServletRequest request) throws Exception{
        // Get cookies from the request
        Cookie[] cookies = request.getCookies();

        // no cookies, return null
        if (cookies == null) {
            return null;
        }

        Cookie ssoCookie = getCookie(cookies, ApplicationServer.SSO_COOKIE_KEY);

        if (ssoCookie == null) {
            return null;
        }

        // Get auth cookie value
        String value = ssoCookie.getValue();

        if (value == null) {
            return null;
        }

        // Parse the cookie value
        String[] parts = value.split("\\|");

        if (parts.length != 2) {
            return null;
        }

        // Parse user ID from the cookie value
        long userId;

        try {
            userId = Long.parseLong(parts[0]);
        } catch (NumberFormatException e) {

            // return null if parsing error occurred
            return null;
        }

        String hashedValue = parts[1];

        // Get password from the result set and hash it.
        String realHashedValue = hashForUser(userId);

        if (realHashedValue.equals(hashedValue)) {
            return userId;
        }

        return null;
    }

    /**
     * Generate an cookie globally.
     * @param name
     *          the cookie name.
     * @param value
     *          the cookie value.
     * @param maxAge
     *          the Max_Age attribute of the cookie
     * @return the cookie.
     */
    private Cookie createCookie(String name, String value, Integer maxAge) {
        Cookie cookie = new Cookie(name, value);
        if (maxAge != null) {
            cookie.setMaxAge(maxAge);
        }
        cookie.setDomain(ApplicationServer.SSO_DOMAIN);
        cookie.setPath("/");
        return cookie;
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
     *
     * @param uid the user id
     * @return the hash
     * @throws Exception if there is a problem getting data from the data base or if the SHA-256 algorithm doesn't exist
     */
    private String hashForUser(long uid) throws Exception {
        //log.debug("hash for user: " + uid);
        CachedDataAccess dai = new CachedDataAccess(MaxAge.HALF_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, "userid_to_password");
        dataRequest.setProperty("uid", Long.toString(uid));
        Map dataMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) dataMap.get("userid_to_password");
        String password = rsc.getStringItem(0, "password");
        String status = rsc.getStringItem(0, "status");


        String plainString = ApplicationServer.SSO_HASH_SECRET + uid + password + status;

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] plain = (plainString).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for (byte aRaw : raw) hex.append(Integer.toHexString(aRaw & 0xff));
        String hashString = hex.toString();

        return hashString;
    }

    /**
     * Gets the cookie.
     *
     * @param cookies
     *            the cookie array
     *
     * @param name
     *            the cookie name.
     * @return the cookie matches the given name in the given array.
     */
    private Cookie getCookie(Cookie[] cookies, String name) {
        Cookie resultCookie = null;

        for (Cookie cookie : cookies) {

            // Get name of the cookie
            String curCookieName = cookie.getName();

            if (name.equals(curCookieName)) {
                resultCookie = cookie;

                break;
            }
        }

        return resultCookie;
    }
}