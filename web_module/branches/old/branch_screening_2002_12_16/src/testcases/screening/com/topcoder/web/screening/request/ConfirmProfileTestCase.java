package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;
import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * Testing ConfirmProfile page mainly using WSF
 * 
 * @author Misha
 * created 2/6/2003
 */
public class ConfirmProfileTestCase extends TestCase {
	
	public ConfirmProfileTestCase(String name) {
		super(name);
	}		

	/**
	 * testing that we can reach from login page to 
	 * ConfirmProfile page using 
	 * Web Site Flow (WSF) framework
	 * */
	public void testConfirmProfilePath() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPath("LoginToConfirmProfile");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testLoginWebSiteFlow failed with Exception " + e);
		}		
	}

}
