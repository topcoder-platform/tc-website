package com.topcoder.web.test;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.security.*;

/**
 * Helper class implementing HttpServletRequest interface
 * 
 * @author - mishagam
 * */
public class HttpServletRequestHelper
	extends ServletRequestHelper
	implements HttpServletRequest {
		
	public HttpSession mySession = null;
	public Cookie[] myCookies = null;
	/**
	* Returns the name of the authentication scheme used to protect the servlet.
	* */
	public String getAuthType() {
		return "BASIC"; //HttpServletRequest.BASIC_AUTH;
	}
	/**
	 * Returns the portion of the request URI that indicates the context of the request.
	 * */
	public String getContextPath() {
		return "";
	}

	/**
	 * Returns an array containing all of the Cookie objects the client sent with this request.
	 * */
	public Cookie[] getCookies() {
		return myCookies;
	}
	/**
	 * Returns the value of the specified request header as a long value 
	 * that represents a Date object.
	 * */
	public long getDateHeader(String name) {
		return 0;
	}
	/**
	 * Returns the value of the specified request header as a String.
	 * */
	public String getHeader(String name) {
		return "";
	}

	/**
	 * Returns an enumeration of all the header names this request contains.
	 * */
	public Enumeration getHeaderNames() {
		return null;

	}
	/**
	 * Returns all the values of the specified request header as an Enumeration of String objects
	 * */
	public Enumeration getHeaders(String name) {
		return null;
	}
	/**
	 *  Returns the value of the specified request header as an int
	 * */	
	public int getIntHeader(String name) {
		return -1;
	}
	/**
	 * Returns the name of the HTTP method with which this request was made, 
	 * for example, GET, POST, or PUT.
	 * */
	public String getMethod(){
		return null;
	}
	/**
	 * Returns any extra path information associated with the URL the client sent when it made this request
	 * */
	public String getPathInfo() {
		return null;
	}
	
	/**
	 * Returns any extra path information after the servlet name 
	 * but before the query string,	and translates it to a real path
	 * */		
	public String getPathTranslated() {
		return null;
	} 
	
	/**
	 * Returns the query string that is contained in the request URL after the path
	 * */	
	public String getQueryString() {
		return null;
	}
	/**
	 * Returns the login of the user making this request,
	 * 			if the user has been authenticated,
	 * 			or null if the user has not been authenticated
	 * */	
	public String getRemoteUser() {
		return null;
	}
	/**
	 * Returns the session ID specified by the client
	 * */	
	public String getRequestedSessionId() {
		return null;
	}
	/**
	 * Returns the part of this request 'sURL from the protocol name 
	 * up to the query string in the first line of the HTTP request
	 * */
	public String getRequestURI() {
		return null;
	}
	
	/**
	 * Reconstructs the URL the client used to make the request
	 * */	
	public StringBuffer getRequestURL() {
		return null;
	}
	/**
	 * Returns the part of this request 'sURL that calls the servlet
	 * */	
	public String getServletPath() {
		return null;
	}
	
	/**
	 * Returns the current session associated with this request,
	 * 					or if the request does not have a session,
	 * 					creates one
	 **/	
	public HttpSession getSession() {
		return mySession;
	}
	/**
	 * Returns the current HttpSession associated with this request or,
	 * 						if if there is no current session and create is true,
	 * 						returns a new session.
	 * */
	public HttpSession getSession(boolean create) {
		return null;
	}
	/**
	 * Returns a java.security.Principal object containing 
	 * the name of the current authenticated user
	 * */	
	public Principal getUserPrincipal() {
		return null;
	}
	/**
	 * Checks whether the requested session ID came in as a cookie
	 * */
	public boolean isRequestedSessionIdFromCookie() {
		return false;
	}
	/**
	 * Deprecated		.As of Version 2.1 of the Java Servlet API,
	 * 								use isRequestedSessionIdFromURL() instead
	 * */
	public boolean isRequestedSessionIdFromUrl() {
		return false;
	}
	/**
	 * Checks whether the requested session ID came in as part of the request URL
	 * */	
	public boolean isRequestedSessionIdFromURL() {
		return false;
	}
	/**
	 *  Checks whether the requested session ID is still valid
	 * */	
	public boolean isRequestedSessionIdValid() {
		return true;
	}
	/**
	 * Returns a boolean indicating whether the authenticated user 
	 * is included in the specified logical "role"
	 * */	
	public boolean isUserInRole(String role) {
		return true;
	}
	
	public static void main(String[] args) {
	}
}
