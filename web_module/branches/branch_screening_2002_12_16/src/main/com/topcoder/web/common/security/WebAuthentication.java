package com.topcoder.web.common.security;

import com.topcoder.shared.security.Authentication;
import com.topcoder.shared.security.User;
/**
 * Interface for web-based authentication objects.
 * @author  Porgery
 */
public interface WebAuthentication extends Authentication {
    
    /** 
     * For sensitive areas where a cookie is not sufficient authentication,
     * this method provides the option to ignore the cookie.
     * @return  User object representing the active user.
     */    
    public User getActiveUser();
    
}
