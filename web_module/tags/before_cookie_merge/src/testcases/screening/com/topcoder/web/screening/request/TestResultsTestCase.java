package com.topcoder.web.screening.request;

/**
 * @author Misha
 */
import junit.framework.TestCase;
import javax.servlet.*;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.test.*;
import com.topcoder.web.test.wsf.*;

import org.apache.log4j.*;
// imports for HTTP testing
import java.net.*;
import java.io.*;
import java.util.regex.*;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * class for testing TestResult page over http 
 * using WSF framework
 * 
 * @author MishaGam
 * */
public class TestResultsTestCase extends TestCase {
	/** 
	 * constructor with name for JUnit framework
	 * */
	public TestResultsTestCase(String name) {
		super(name);
	}
	
	/**
	 * testing that we can open TestResults page
	 * */
	public void testTestResultsWebSiteFlow() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		String name = "TestResults";
		
		try {
			wsf.init();
			bOk = wsf.testPage(name);
			assertTrue("We failed to read page " + name + " Correctly", 
				bOk);
		} catch (Exception e) {
			fail("test" + name + "WebSiteFlow failed with Exception " + e);
		}		
	}
	
	/**
	 * testing links on testresults page
	 * */
	public void testTestResultsLinksWebSiteFlow() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		String name = "TestResults";
		
		try {
			wsf.init();
			bOk = wsf.testPageLinks(name);
			assertTrue("links on page " + name + " weren't correct", 
				bOk);
		} catch (Exception e) {
			fail("test" + name + "LinksWebSiteFlow failed with Exception " + e);
		}		
	}
}
