/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * <p>
 * This interface expose SSO cookie service to TC web apps.
 * </p>
 * <p>
 * <b> Thread Safety:</b> Implementations of this interface must be thread safe.
 *</p>
 *
 * @author ecnu_haozi
 * @version 1.0
 * @since 1.0 (TCCC-5802    https://apps.topcoder.com/bugs/browse/TCCC-5802)
 */
public interface SSOCookieService{
    /**
     * <p>
     * When the user try to log in, this method is called to set a SSO cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     * @param userId the user id.
     * @param rememberMe a flag to indicate if the user select rememberMe checkbox while logging in.
     * @throws Exception if any error occurs.
     */
    public void setSSOCookie(HttpServletResponse response, long userId, boolean rememberMe)throws Exception;
    /**
     * <p>
     * Remove the SSO cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     */
    public void removeSSOCookie(HttpServletResponse response);

    /**
     * <p>
     * Check if the SSO cookie exist in the user's browser. No matter what the SSO cookie's value is.
     * </p>
     * @param request the HTTP request sent from the user's browser.
     * @return true if the SSO cookie exist, false otherwise.
     */
    public boolean existSSOCookie(HttpServletRequest request);

    /**
     * <p>
     * Retrieve user identity from the SSO cookie in the user's browser. 
     * </p>
     * @param request the HTTP request sent from the user's browser.
     * @return the user id. If the sso cookie doesn't exist or the sso cookie's value is invalid, return NULL.
     * @throws Exception if any error occurs.
     */
    public Long getUserIdFromSSOCookie(HttpServletRequest request) throws Exception;
}