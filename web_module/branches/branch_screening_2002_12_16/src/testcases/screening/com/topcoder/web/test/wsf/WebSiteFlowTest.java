package com.topcoder.web.test.wsf;

import junit.framework.TestCase;
import javax.servlet.*;

// imports for HTTP testing
import java.net.*;
import java.io.*;
import java.util.*;
import java.util.zip.DataFormatException;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;
// import for reading xml
import javax.xml.parsers.*;

/**
 * class for testing Web flow for screening site
 * using data from WebSiteFlowTest.xml
 * 
 * @author Mishagam
 * created 1/13/2003
 * */

public class WebSiteFlowTest {
	WebSiteFlowXmlInfo info;

	public WebSiteFlowTest() {
	}
	
	public boolean testPage(String pageName) throws Exception {
		WsfPage page = info.getPageByName(pageName);
		WebConversation con = new WebConversation();
		String requestUrl = (String) info.parameters.get("common_url_base");
		requestUrl += page.url;
		WebRequest request = new GetMethodWebRequest(requestUrl);

		WebResponse resp = con.getResponse(request);
		boolean testOk = isCorrectPage(page, resp);

		return testOk;
	}
	
	boolean isCorrectPage(WsfPage page, WebResponse resp) throws IOException {
		// testing that it is correct page using all
		// patterns
		boolean testOk = true;
		
		for (int i = 0; i < page.patterns.length; i++) {
			WsfPattern pat = page.patterns[i];
			String pageText = resp.getText();
			// checking for conformance to pattern
			testOk = testOk && pat.check(pageText);
		}
		
		return testOk;
	}
	
	public boolean testPageLinks(String pageName) throws Exception {
		boolean testOk = true;
		
		/*testOk = this.testPage(pageName);		
		// first check that page reads correctly
		if (!testOk) {
			return testOk;
		}*/
	
		// preparing page
		WsfPage page = info.getPageByName(pageName);
		WebConversation con = new WebConversation();
		String requestUrl = (String) info.parameters.get("common_url_base");
		requestUrl += page.url;
		WebRequest request = new GetMethodWebRequest(requestUrl);
		// reading page from web site
		WebResponse resp = con.getResponse(request);
		// testing all links one by one
		for (int i = 0; i < page.links.length && testOk; i++) {
			WsfLink l = page.links[i];
			WebLink wl = resp.getLinkWith(l.pattern);
			// reading linked page
			WebRequest lrequest = wl.getRequest();
			WebResponse lresp = con.getResponse(lrequest);
			// checking that we have read correct page
			WsfPage lpage = info.getPageByName(l.targetPageName);
			testOk = isCorrectPage(lpage, lresp);
		}
		
		return testOk;
	}

	public void init() throws DataFormatException {
		if (info == null) {
			info = new WebSiteFlowXmlInfo();
		}
		info.readParameters();
		info.readPages();
	}
}
