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
 *
 * @version 1.0
 */
public class BuildCandidateListTestCase extends TestCase {
	
	String candidateListStrUrl = 
	    "http://65.112.118.205/screening/screening?rp=BuildCandidateList";
	
	public BuildCandidateListTestCase(String name) {
		super(name);
	}
	
	public void testCorrectPage() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(candidateListStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// testing that this is Session Setup page
        	// we test that there is line Create a New Session
        	String pat = "<b>Candidate List</b></font>";
        	String pageText = resp.getText();
        	int ind = pageText.indexOf(pat);
        	assertTrue("Cannot find Candidate List in page text", ind > 0);
        } catch(Exception e) {
        	fail("testCorrectPage() failed with exception " + e);
        }
	}
	
	public void testEditButton() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(candidateListStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// getting save link
        	WebLink editLink = resp.getLinkWith("Edit");
        	assertTrue(editLink.getURLString().indexOf("rp=PopulateCandidate") > 0);
        	request = editLink.getRequest();
        	resp = con.getResponse(request);
        	// checking that we get confirmation page
        	// for now I get pattern of page from mock page
        	// selected text create new session
        	String title = resp.getTitle();
         	assertEquals("Wrong title after Edit link: " + title,
         			title, "TopCoder - Candidate Setup");        	
        	// checking that we get candidateSetupPage
        	/* don't work for now - we will test later
        	WebForm form = resp.getForms()[0];
        	assertTrue(form.getName().equals("sessionSetupForm"));
        	*/
        } catch(Exception e) {
        	fail("testEditButton() failed with exception " + e);
        }		
	}

	public void testAddCandidateButton() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(candidateListStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// getting save link
        	WebLink editLink = resp.getLinkWith("Add Candidate");
        	assertTrue(editLink.getURLString().indexOf("rp=PopulateCandidate") > 0);
        	request = editLink.getRequest();
        	resp = con.getResponse(request);
        	// checking that we get confirmation page
        	// for now I get pattern of page from mock page
        	// selected text create new session
        	String title = resp.getTitle();
         	assertEquals("Wrong title after Edit link: " + title,
         			title, "TopCoder - Candidate Setup");        	
        	// checking that we get candidateSetupPage
        	/*WebForm form = resp.getForms()[0];
        	assertTrue(form.getName().equals("sessionSetupForm"));*/
        } catch(Exception e) {
        	fail("testAddCandidateButton() failed with exception " + e);
        }		
	}


	public void testViewButton() {
		WebConversation con = new WebConversation();
        WebRequest request = new GetMethodWebRequest(candidateListStrUrl);
        try {
        	WebResponse resp = con.getResponse(request);
        	// getting save link
        	WebLink editLink = resp.getLinkWith("View");
        	assertTrue(editLink.getURLString().indexOf("rp=NoteList") > 0);
        	request = editLink.getRequest();
        	resp = con.getResponse(request);
        	// checking that we NoteList page
        	String text = resp.getText();
         	assertTrue("Wrong page", text.indexOf("<B>Note List</B>")>0);
        } catch(Exception e) {
        	fail("testViewButton() failed with exception " + e);
        }		
	}
	
	public void testCandidateListWSF() {
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
