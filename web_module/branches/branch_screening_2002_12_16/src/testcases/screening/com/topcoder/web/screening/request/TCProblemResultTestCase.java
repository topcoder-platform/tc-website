package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

/**
 * @author Misha
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class TCProblemResultTestCase extends TestCase {
	
	public TCProblemResultTestCase(String name) {
		super(name);
	}

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
