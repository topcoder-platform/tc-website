package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

/**
 * JUnit testing of ProblemList class over http 
 * using WSF
 * 
 * @author Misha
 */
public class ProblemListTestCase extends TestCase {
    /**
     * constructor with name for TestCase
     * */
	public ProblemListTestCase (String name) {
		super(name);
	}
	
    /**
     * testing that we can open Problem List page
     * using Web Site Flow framework
     * */
	public void testProblemListWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("ProblemList");
			assertTrue(bOk);
		} catch (Exception e) {
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
}
