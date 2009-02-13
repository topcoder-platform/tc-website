package com.topcoder.web.screening.request;

import junit.framework.TestCase;
import javax.servlet.*;
import com.topcoder.web.test.wsf.WebSiteFlowTest;
import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * Testing PopulateProblemDetail class using WSF
 * 
 * @author Misha
 * created 2/6/2003
  */
public class PopulateProblemDetailsTestCase extends TestCase {
	WebSiteFlowTest wsf = null;

	public PopulateProblemDetailsTestCase(String name) {
		super(name);
	}
	/**
	 * logging in to be able to test other pages
	 * */
	public void setUp() {
		wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
		} catch (Exception e) {
			e.printStackTrace();
			fail("setUp failed with Exception " + e);
		}		
	}

	/**
	 * tests that we can open page with problem details
	 * */
	public void testProblemDetailWSF() {
		boolean bOk;
		
		try {
			//wsf.init();
			bOk = wsf.testPage("PopulateProblemDetail");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testProblemDetailWSF failed with Exception " + e);
		}		
	}
	public void testPopPathWSF() {
		boolean bOk;
		
		try {
			//wsf.init();
			bOk = wsf.testPath("LoginToPopulateCandidate");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testProblemDetailWSF failed with Exception " + e);
		}		
	}
	public void testSessiosetupWSF() {
		boolean bOk;
		
		try {
			//wsf.init();
			bOk = wsf.testPage("PopulateSession");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testProblemDetailWSF failed with Exception " + e);
		}		
	}
}
