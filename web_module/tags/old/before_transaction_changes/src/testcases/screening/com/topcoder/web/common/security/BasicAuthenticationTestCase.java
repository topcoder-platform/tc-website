package com.topcoder.web.common.security;

import junit.framework.TestCase;
import com.topcoder.web.test.*;
import com.topcoder.shared.security.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;


public class BasicAuthenticationTestCase extends TestCase {

    Persistor persistor;
    HttpServletRequestHelper request;
    ServletResponseHelper response;
    BasicAuthentication auth;
    HttpSessionHelper session;
    User u;
	
	public BasicAuthenticationTestCase(String name) {
		super(name);
		
	    persistor = new PersistorHelper();
	    request = new HttpServletRequestHelper();
	    response = new ServletResponseHelper();
	    auth = new BasicAuthentication(persistor, request, response);
	    session = new HttpSessionHelper();	
	}
	
	public void testGetUser() {
		// we should get user using getid from persistor
		request.mySession = session;
		session.myId = "123";
		persistor.setObject("123user_id", new Long(12345l));
		persistor.setObject("123loggedInStatus", "false");
		u = auth.getUser();
		assertEquals(u.getId(), -1);
		persistor.setObject("123loggedInStatus", "true");
		u = auth.getUser();
		assertEquals(u.getId(), 12345);
		u = auth.getActiveUser();
		assertEquals(u.getId(), 12345);
	}
	
	public void testGetUserFromCookie() {
		persistor = new PersistorHelper(); // so you cannot get 
		Cookie[] cook = new Cookie[2];
		cook[0] = new Cookie("user_id", "12345");
		cook[1] = new Cookie("loggedInStatus", "true");
		request.myCookies = cook;
		u = auth.getUser();
		assertEquals(u.getId(), 12345);
		u = auth.getActiveUser();
		assertEquals(u.getId(), -1);		
	}
	
	public void testLogin() {
	}
	
	public void testLogout() {
		request.mySession = session;
		session.myId = "123";
		auth.logout();
		List cook = response.myCookies;
		Cookie c0 = (Cookie)cook.get(0);
		Cookie c1 = (Cookie)cook.get(1);
		assertEquals(c0.getName(), "user_id");
		assertEquals(c0.getValue(), "");
		assertEquals(c1.getName(), "loggedInStatus");
		assertEquals(c1.getValue(), "");
	}
}