/*
    AuthenticationIfc
    An interface providing information about the authentication environment
    and status of the current session.

    By John C. Bollinger
    Copyright 2002, TopCoder, Inc.
 */

package com.topcoder.web.render.bean;

public interface AuthenticationIfc {

    /*
       isAuthenticated returns true if the current session is associated with
       an authenticated user, and false otherwise.
     */
    public boolean isAuthenticated();

    /*
       getAuthenticationPage returns the URL of a page to which the current
       request may be forwarded for Authentication.  (I.e., this returns the
       link to an appropriate login page.)
     */
    public String getAuthenticationPage();

}
