/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security;

import javax.servlet.http.Cookie;

/**
 * <p>
 * Helper class for working with cookies.
 * </p>
 * <p>
 * <b> Thread Safety:</b> This class is immutable thus thread-safe.
 * </p>
 * @author MonicaMuranyi
 * @version 1.0
 */
public class CookieHelper {
	
	/**
     * Generate an cookie globally.
     * @param name
     *          the cookie name.
     * @param value
     *          the cookie value.
     * @param value
     *          the cookie domain.
     * @param maxAge
     *          the Max_Age attribute of the cookie
     * @return the cookie.
     */
    public static Cookie createCookie(String name, String value, String domain, Integer maxAge) {
        Cookie cookie = new Cookie(name, value);
        if (maxAge != null) {
            cookie.setMaxAge(maxAge);
        }
        cookie.setDomain(domain);
        cookie.setPath("/");
        return cookie;
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
    public static Cookie getCookie(Cookie[] cookies, String name) {
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