package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
/**
 * Interface for web-based authentication objects.
 * @author  Porgery
 */
public interface WebAuthentication extends Authentication {
    
    /** 
     * For sensitive areas where a cookie is not sufficient authentication,
     * this method provides the option to ignore the cookie.
     * @param checkCookie True if the cookie should be consulted, false if not.
     * @return  True if the user is logged in, false otherwise.
     */    
    public boolean isLoggedIn(boolean checkCookie);
    
}
