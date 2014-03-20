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
 * This class implements the interface JWTCookieService.
 * </p>
 * <p>
 * <b> Thread Safety:</b> This class is immutable thus thread-safe.
 * </p>
 * @author MonicaMuranyi
 * @version 1.0
 */
public class JWTCookieServiceImpl implements JWTCookieService {
	
    /**
     * Constructor.
     */
    public JWTCookieServiceImpl(){
    }

    /**
     * <p>
     * When the user try to log in, this method is called to set a JWT cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     * @param jsonWebToken the json web token.
     * @param rememberMe a flag to indicate if the user select rememberMe checkbox while logging in.
     * @throws Exception if any error occurs.
     */
    public void setJWTCookie(HttpServletResponse response, String jsonWebToken, boolean rememberMe) throws Exception {
        if (rememberMe) {
            //This is a persistent cookie which will persist unless the user log out or change password.
            response.addCookie( CookieHelper.createCookie(ApplicationServer.JWT_COOKIE_KEY, jsonWebToken, ApplicationServer.SSO_DOMAIN, Integer.MAX_VALUE));
        } else {
            //This is a session cookie which will invalidate when the user exit the browser.
            response.addCookie( CookieHelper.createCookie(ApplicationServer.JWT_COOKIE_KEY, jsonWebToken, ApplicationServer.SSO_DOMAIN, null));
        }
    }
    /**
     * <p>
     * Remove the JWT cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     */
    public void removeJWTCookie(HttpServletResponse response) {
         response.addCookie( CookieHelper.createCookie(ApplicationServer.JWT_COOKIE_KEY, "", ApplicationServer.SSO_DOMAIN, 0));
    }
}