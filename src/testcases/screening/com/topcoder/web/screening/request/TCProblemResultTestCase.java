package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

/**
 * Class for testing TCProblemList class using WSF
 * 
 * @author Misha
 */
public class TCProblemResultTestCase extends TestCase {
    /**
     * constructor with name for JUnit framework
     * */	
	public TCProblemResultTestCase(String name) {
		super(name);
	}
	
	/**
	 * Testing that we can open page TCProblemResult
	 * */
	public void testProblemListWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("TCProblemResult");
			assertTrue(bOk);
		} catch (Exception e) {
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
}
