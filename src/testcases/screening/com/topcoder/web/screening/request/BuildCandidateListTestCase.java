package com.topcoder.web.screening.request;


import junit.framework.TestCase;
import javax.servlet.*;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * Testing BuildCandidateList class mainly using httpunit and WSF
 * 
 * @author Misha
 * 
 * created 1/10/2003
 * changed 1/28/2003 - moved to WebSiteFlow framework
 *
 * @version 1.0
 */
public class BuildCandidateListTestCase extends TestCase {
	WebSiteFlowTest wsf = null;
	
	/**
	 * constuctor with name for TestCase
	 * */
	public BuildCandidateListTestCase(String name) {
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
	 * tests that we can open page with candidate list
	 * */
	public void testCandidateListWSF() {
		boolean bOk;
		
		try {
			//wsf.init();
			bOk = wsf.testPage("BuildCandidateList");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
	/**
	 * testing links from Candidate list page using 
	 * WSF framework
	 * */	
	public void testCandidateListLinksWSF() {
		boolean bOk;
		
		try {
			//wsf.init();
			bOk = wsf.testPageLinks("BuildCandidateList");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
	/**
	 * testing that we can reach from login page to 
	 * Candidate list page using 
	 * Web Site Flow (WSF) framework
	 * */
	public void testCandidateListPath() {
		boolean bOk;
		
		try {
			bOk = wsf.testPath("LoginToPopulateCandidate");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}

}
