                                                                                                                                                                                                                               package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

/**
 * Testing web site flow for all pages
 * 
 * @author Misha
 */
public class TestWebSiteFlow extends TestCase {
	/**
	 * constructor wuth name for JUnit framework
	 * */
	public TestWebSiteFlow(String name) {
		super(name);
	}
	
	/**
	 * testing accesible pages from WebSiteFlowTest.xml
	 * */
	public void testLoginWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
		} catch (Exception e) {
			e.printStackTrace();
			fail("testProblemResultWebSiteFlow failed with Exception " + e);
		}		
	}
	/**
	 * testing accesible pages from WebSiteFlowTest.xml
	 * */
	public void testLoginPopulateCandidatePathWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPath("LoginToPopulateCandidate");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testProblemResultWebSiteFlow failed with Exception " + e);
		}		
	}
}
