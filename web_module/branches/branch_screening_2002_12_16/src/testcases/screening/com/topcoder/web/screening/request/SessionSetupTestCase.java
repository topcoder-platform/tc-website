package com.topcoder.web.screening.request;

import junit.framework.TestCase;
import javax.servlet.*;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;


/**
 * Testing SessionSetup class mainly using httpunit
 * @author Misha
 */
public class SessionSetupTestCase extends TestCase {
	
	String sessionSetupStrUrl = 
	    "http://65.112.118.205/screening/screening?rp=SessionSetup";
	
	public SessionSetupTestCase(String name) {
		super(name);
	}
	
	/**
	 * testing that we can open Session setup page
	 **/	
	public void testCorrectPage() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(sessionSetupStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// testing that this is Session Setup page
        	// we test that there is line Create a New Session
        	String pat = "Create a New Session";
        	String pageText = resp.getText();
        	assertTrue(pageText.indexOf(pat) > 0);
        	// check name of form
        	WebForm form = resp.getForms()[0];
        	assertTrue(form.getName().equals("sessionSetupForm"));
        } catch(Exception e) {
        	fail("testCorrectPage() failed with exception " + e);
        }
	}
	
	/**
	 * testing that we can get to session confirmation page
	 * */	
	public void testSessionConfirmation() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(sessionSetupStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// getting save link
        	WebLink saveLink = resp.getLinkWith("save");
        	assertTrue(saveLink.getURLString().indexOf("sess_setup_confirm.jsp") > 0);
        	request = saveLink.getRequest();
        	resp = con.getResponse(request);
        	// checking that we get confirmation page
        	// for now I get pattern of page from mock page
        	String pat = "Set-Up Session Confirmation";
        	String pageText = resp.getText();
        	assertTrue(pageText.indexOf(pat) > 0);        	
        } catch(Exception e) {
        	fail("testCorrectPage() failed with exception " + e);
        }		
	}
	
	/**
	 * testing link to new test profile
	 * */
	public void testLinkAddNewTestProfile() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(sessionSetupStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// getting save link
        	WebLink saveLink = resp.getLinkWith("Create a New Test Profile");
        	assertTrue(saveLink.getURLString().indexOf("sess_o_setup.jsp") > 0);
        	request = saveLink.getRequest();
        	resp = con.getResponse(request);
        	// checking that we get confirmation page
        	// for now I get pattern of page from mock page
        	// selected text create new session
        	String pat = "FONT SIZE=\"3\" COLOR=\"#666666\"><B>Create a New Session";
        	String pageText = resp.getText();
        	assertTrue(pageText.indexOf(pat) > 0);        	
        } catch(Exception e) {
        	fail("testCorrectPage() failed with exception " + e);
        }		
	}
	
	/**
	 * testing link to candidate setup
	 * */
	public void testLinkCandidateSetup() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(sessionSetupStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// getting save link
        	WebLink saveLink = resp.getLinkWith("Add a Candidate");
        	assertTrue(saveLink.getURLString().indexOf("cand_setup.jsp") > 0);
        	request = saveLink.getRequest();
        	resp = con.getResponse(request);
        	// checking that we get Candidate setup page
        	String pat = "<strong>Set-Up a Candidate</strong>";
        	String pageText = resp.getText();
        	assertTrue(pageText.indexOf(pat) > 0);        	
        } catch(Exception e) {
        	fail("testCorrectPage() failed with exception " + e);
        }		
	}

}
