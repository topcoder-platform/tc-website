package com.topcoder.web.test.wsf;

import junit.framework.TestCase;
//import javax.servlet.*;

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
 * class for testing Web site flow for screening site
 * using data from WebSiteFlowTest.xml
 * 
 * @author Mishagam
 * created 1/13/2003
 * */

public class WebSiteFlowTest {
	WebSiteFlowXmlInfo info;
	Map cookies = null;
	WebConversation con = null;
	String baseUrl = "";

	public WebSiteFlowTest() {
	}
	
	void addNewCookies(WebResponse resp) {
		String[] cook = con.getCookieNames();
		/*String [] names = resp.getNewCookieNames();
		for (int i=0; i<names.length; i++) {
			String val = resp.getNewCookieValue(names[i]);
			con.addCookie(names[i], val);
		}*/
	}
	
	/**
	 * tests that we can open page using url from WebSiteFlowTest.xml
	 * 
	 * @param - String pageName - name of page used in WebSiteFlowTest.xml
	 * @throws - Exception
	 * @return - boolean, true - page OK, false - test failed
	 * */
	public boolean testPage(String pageName) throws Exception {
		WsfPage page = info.getPageByName(pageName);
		String requestUrl = baseUrl + page.url;
		WebRequest request = new GetMethodWebRequest(requestUrl);
		WebResponse resp = con.getResponse(request);
		addNewCookies(resp);
		boolean testOk = isCorrectPage(page, resp);

		return testOk;
	}
	
	/**
	 * testing if thi is correct page using page text 
	 * and identification from WebSiteFlowTest.xml
	 * 
	 * @return - boolean, true - page OK, false - test failed
	 * @throws - Exception
	 * */	
	boolean isCorrectPage(WsfPage page, WebResponse resp) throws IOException {
		// testing that it is correct page using all
		// patterns
		boolean testOk = true;

		for (int i = 0; i < page.patterns.length; i++) {
			WsfPattern pat = page.patterns[i];
			String pageText = resp.getText();
			// checking for conformance to pattern
			testOk = testOk && pat.check(pageText);
			if (testOk == false) {
				printPage(page.name, pageText);
			}

		}

		return testOk;
	}
	
	void printPage(String name, String page) throws IOException{
		Writer w = new BufferedWriter(new FileWriter("Source" + name + ".out"));
		w.write(page);
		w.close();		
	}
	
	/**
	 * tests that page links are correct using url from WebSiteFlowTest.xml
	 * 
	 * @param - String pageName - name of page used in WebSiteFlowTest.xml
	 * @throws - Exception
	 * @return - boolean, true - page OK, false - test failed
	 * */
	public boolean testPageLinks(String pageName) throws Exception {
		boolean testOk = true;
		
		/*testOk = this.testPage(pageName);		
		// first check that page reads correctly
		if (!testOk) {
			return testOk;
		}*/
	
		// preparing page
		WsfPage page = info.getPageByName(pageName);
		String requestUrl = baseUrl + page.url;
		WebRequest request = new GetMethodWebRequest(requestUrl);
		// reading page from web site
		WebResponse resp = con.getResponse(request);
		addNewCookies(resp);
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
	
	/**
	 * tests that page forms are correct using url from WebSiteFlowTest.xml
	 * 
	 * @param - String pageName - name of page used in WebSiteFlowTest.xml
	 * @throws - Exception
	 * @return - boolean, true - page OK, false - test failed
	 * */
	public boolean testPageForms(String pageName) throws Exception {
		boolean testOk = true;
		
		// preparing page
		WsfPage page = info.getPageByName(pageName);
		String requestUrl = baseUrl + page.url;
		WebRequest request = new GetMethodWebRequest(requestUrl);
		// reading page from web site
		WebResponse resp = con.getResponse(request);
		addNewCookies(resp);
		// testing all forms one by one
		for (int i = 0; i < page.forms.length && testOk; i++) {
			WsfForm f = page.forms[i];
			WebForm wf = resp.getForms()[i];
			
			// modify web form parameters and submit button			
			for (int j = 0; j < f.params.length; j++) {
				WsfFormParam wfp = f.params[j];
				wf.setParameter(wfp.name, wfp.value);
			}
			SubmitButton sb = wf.getSubmitButton(f.submitName);
			WebRequest frequest = wf.getRequest(sb);
			// check that we can read correct page
			WebResponse fresp = con.getResponse(frequest);
			addNewCookies(fresp);
			WsfPage fpage = info.getPageByName(f.targetPageName);
			testOk = isCorrectPage(fpage, fresp);
		}
		
		return testOk;		
	}
	
	/**
	 * tests that we can succesfully pass path from WebSiteFlowTest.xml
	 * 
	 * @param - String pathName - name of path used in WebSiteFlowTest.xml
	 * @throws - Exception
	 * @return - boolean, true - we succesfully passed path, false - test failed
	 * */
	public boolean testPath(String pathName) throws Exception {
		WsfPath path = info.getPathByName(pathName);
		WsfPage page;
		WebResponse resp=null;
		WebRequest req;
		String url;  	// actual url
		boolean testOk = true;
		
		for (int i=0; i<path.steps.length && testOk; i++) {
			WsfStep l = path.steps[i];
			if (l.type.equals("start")) {
				// opening first page
				page = info.getPageByName((String)l.val);
				url = baseUrl + page.url;
				req = new GetMethodWebRequest(url);
				resp = con.getResponse(req);
				addNewCookies(resp);
			} else if (l.type.equals("finish")) {
				// response should have correct finish page
				page = info.getPageByName((String)l.val);
				testOk = isCorrectPage(page, resp);
				break;
			} else if (l.type.equals("link")) {
				// testing that this is cocect 
				WsfLink lnk = (WsfLink)l.val;
				WebLink wl = resp.getLinkWith(lnk.pattern);
				req = wl.getRequest();
				resp = con.getResponse(req);
				addNewCookies(resp);
				page = info.getPageByName(lnk.targetPageName);
				testOk = isCorrectPage(page, resp);
			} else if (l.type.equals("form")) {
				WsfForm f = (WsfForm)l.val;
				WebForm wf = resp.getForms()[f.index];
				
				// modify web form parameters and submit button			
				for (int j = 0; j < f.params.length; j++) {
					WsfFormParam wfp = f.params[j];
					wf.setParameter(wfp.name, wfp.value);
				}
				SubmitButton sb = wf.getSubmitButton(f.submitName);
				req = wf.getRequest(sb);
				// check that we can read correct page
				resp = con.getResponse(req);
				addNewCookies(resp);
				page = info.getPageByName(f.targetPageName);
				testOk = isCorrectPage(page, resp);
			} else {
				throw new Exception("Wrong type for step: " + l.type);
			}			
		}
		
		return testOk;		
	}
	
	/**
	 * reading WebSiteFlowTest.xml
	 * */
	public void init() throws DataFormatException, Exception {
		if (info == null) {
			info = new WebSiteFlowXmlInfo();
		}
		boolean bret;
		info.init();
		con = new WebConversation();
		baseUrl = (String) info.parameters.get("common-url-base");
		bret = this.testPage("Login");
		bret = this.testPageForms("Login");
	}
}
