package com.topcoder.web.screening.request;


import junit.framework.TestCase;
import javax.servlet.*;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * Testing BuildCandidateList class mainly using httpunit
 * 
 * @author Misha
 * 
 * created 1/10/2003
 * changed 1/28/2003 - moved to WebSiteFlow framework
 *
 * @version 1.0
 */
public class BuildCandidateListTestCase extends TestCase {
	
	
	public BuildCandidateListTestCase(String name) {
		super(name);
	}
	
	
	public void testCandidateListWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("BuildCandidateList");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
	
	public void testCandidateListLinksWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPageLinks("BuildCandidateList");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}
	
	public void testCandidateListPath() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPath("LoginToPopulateCandidate");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}

}
