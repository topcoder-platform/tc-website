/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security;

import javax.servlet.http.HttpServletResponse;
/**
 * <p>
 * This interface expose JWT (Json Web Token) cookie service to TC web apps.
 * </p>
 * <p>
 * <b> Thread Safety:</b> Implementations of this interface must be thread safe.
 *</p>
 *
 * @author MonicaMuranyi
 * @version 1.0
 */
public interface JWTCookieService{

	/**
     * <p>
     * When the user try to log in, this method is called to set a JWT cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     * @param jsonWebToken the json web token.
     * @param rememberMe a flag to indicate if the user select rememberMe checkbox while logging in.
     * @throws Exception if any error occurs.
     */
    public void setJWTCookie(HttpServletResponse response, String jsonWebToken, boolean rememberMe)throws Exception;
    
    /**
     * <p>
     * Remove the JWT cookie in the user's browser.
     * </p>
     * @param response The HTTP response sent back to the user's browser.
     */
    public void removeJWTCookie(HttpServletResponse response);
}