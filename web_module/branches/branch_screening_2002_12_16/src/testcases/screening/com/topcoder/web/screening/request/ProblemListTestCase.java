package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

/**
 * @author Misha
 */
public class ProblemListTestCase extends TestCase {
	public ProblemListTestCase (String name) {
		super(name);
	}
	
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
