package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

/**
 * @author Misha
 */
public class ProblemResultTestCase extends TestCase {
	
	public ProblemResultTestCase(String name) {
		super(name);
	}

	public void testProblemResultWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("ProblemResult");
			assertTrue(bOk);
		} catch (Exception e) {
			fail("testProblemResultWebSiteFlow failed with Exception " + e);
		}		
	}
}
