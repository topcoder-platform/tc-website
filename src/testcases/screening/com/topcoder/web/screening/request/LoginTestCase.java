package com.topcoder.web.screening.request;

import junit.framework.TestCase;
import javax.servlet.*;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.test.*;
import com.topcoder.web.test.wsf.*;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.common.security.*;

import org.apache.log4j.*;
// imports for HTTP testing
import java.net.*;
import java.io.*;
import java.util.regex.*;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * Testing login page using combination of direct testing of Login.java
 * using helper classes, HTTP testing using HTTP directly, 
 * HttpUnit and WSF
 * @author Misha
 * @version 1.0
 */
public class LoginTestCase extends TestCase {
	AuthenticationHelper auth;
	ServletRequestHelper request;
	ServletResponse response;
	User u;	
	String loginStrUrl = "http://65.112.118.205/screening/screening?rp=Login&handle=&password=password&firstVisit=false";
	
	/**
	 * constructor for TestCase
	 * */ 
	public LoginTestCase(String name) {
		super(name);
	}
	
	/**
	 * seting up helper classes and logging
	 * */	
	public void setUp() {
		// initializing constnts
		if (Constants.isInitialized() == false) {
			ServletConfigHelper config = new ServletConfigHelper();
			config.readWebXmlParameters("Resources/screening/web.xml");
			Constants.initialize(config);
		}
		
		auth = new AuthenticationHelper();
		request = new ServletRequestHelper();
		response = new ServletResponseHelper();
		User u = new SimpleUser(-1, "aa", "aa123");
		// fixing logging	
		Category root = Category.getRoot();	
		ConsoleAppender app = new ConsoleAppender();
		app.setTarget("System.out");
		root.addAppender(new ConsoleAppender());
	}
	/**
	 * testing that login with correct name/pasword
	 * succeds and properly sets nextPage and
	 * isNextpageInContext properties
	 * */
	public void testCorrectLogin() {
		Login login = new Login();
		// I don't know how to get correct config yet, so i
		// pick up parameter names directly from web.xml
		// mishagam 1/15/2003
		request.setParameter(Constants.HANDLE, "aa");
		request.setParameter(Constants.PASSWORD, "aa123");
		request.setParameter(Constants.REDIRECT, "Next page");
		login.setRequest(request);
		login.setAuthentication(auth);
		try {
			login.process();
		} catch (Exception e) {
			fail("Exception in Login " + e);
		}
		
		assertEquals("Next page", login.getNextPage());	
		assertTrue(!login.isNextPageInContext());	
	}
	/**
	 * test failed logins with wrong name/password pairs.
	 * nextpage property should become "/login.jsp"
	 * */
	public void testFailedLogin() {
		Login login = new Login();
		request.setParameter("handle", "aa");
		request.setParameter("password", "bad password");
		request.setParameter("redir", "Next page");
		login.setRequest(request);
		login.setAuthentication(auth);
		try {
			login.process();
		} catch (Exception e) {
			fail("Exception in Login " + e);
		}		
		assertEquals("/login.jsp", login.getNextPage());	
		assertTrue(login.isNextPageInContext());
		// now testing for null password	
		request.setParameter("password", null);
		try {
			login.process();
		} catch (Exception e) {
			fail("Exception in Login " + e);
		}		
		assertEquals("/login.jsp", login.getNextPage());	
		assertTrue(login.isNextPageInContext());
	}
	/**
	 * tests logout. propert nextPage should become "/"
	 * */
	public void testLogout() {		
		Logout logout = new Logout();
		logout.setRequest(request);
		logout.setAuthentication(auth);
		UserHelper user = new UserHelper();
		user.myId = 9999;
		auth.myUser = user;
		try {
			logout.process();
		} catch (Exception e) {
			fail("Exception in Logout " + e);
		}		
		assertEquals(Constants.CONTROLLER_URL, logout.getNextPage());	
		assertTrue(!logout.isNextPageInContext());
		
	}
	
	/**
	 * testing login page (that we can open login page)
	 * using HTTP connection directly
	 * */	
	public void testLoginOverHttp() {
		URL url;
		try {
			url = new URL(loginStrUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();			
			con.connect();
			
			InputStream is = con.getInputStream();			
			InputStreamReader isr = new InputStreamReader(is);
			//eding all stream in buffer
			char []buf = new char[20000];
			int len = isr.read(buf);
			String page = new String(buf, 0, len);
			// checking for existense of login form in page
			Pattern pat = Pattern.compile("Candidate Evaluation Application.*handle.*password.*login", Pattern.DOTALL);
			Matcher mat = pat.matcher(page);
			boolean b = mat.find();
			assertTrue(b);			
		} catch (Exception e) {
			System.out.println(e);
			fail("testLoginOverHttp() Failed with exception: " +e);
		}
		
	}
	
	/**
	 * testing that we can open login page using HttpUnit
	 * */
	public void testLoginHttpUnit() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(loginStrUrl);
        
        try {
        	WebResponse response = con.getResponse( request );
        	// checking that this is Login page
			String pageText = response.getText();
			assertTrue("We failed to receive login page in testLoginHttpUnit()",
				pageText.indexOf("Candidate Evaluation Application") >= 0);
        } catch (Exception e) {
        	fail("There was exception " + e);
        }		
	}
	
	/**
	 * testing that we can open login page using
	 * WSF framework
	 * */
	public void testLoginWebSiteFlow() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("Login");
			assertTrue("Test of page Login failed", bOk);
			bOk = wsf.testPageForms("Login");
			assertTrue("Test of form on login page failed", bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
	
	/**
	 * Testing what would happen if we use bad/zero handle/password
	 * using WSF framework
	 * */	
	public void testLoginPathsWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPath("LoginToLoginBad");
			assertTrue("path Login to LoginBad failed", bOk);
			bOk = wsf.testPath("LoginToLoginZero");
			assertTrue("path Login to LoginZero failed", bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginPathsWSF failed with Exception " + e);
		}		
	}

}
