package com.topcoder.web.screening.request;

import junit.framework.TestCase;
import javax.servlet.*;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;

/**
 * Testing Candidate, Note and NoteList using path and WSF.
 * Tests that you can add candidate and note and they
 * will arive in lists
 * 
 * @author Misha
 * 
 * created 2/12/2003
 *
 * @version 1.0
 */
public class NoteListTestCase extends TestCase {
	WebSiteFlowTest wsf = null;
	/**
	 * constuctor with name for TestCase
	 * */
	public NoteListTestCase(String name) {
		super(name);
	}
	
	/**
	 * logging in to be able to test other pages
	 * */
	public void setUp() {
		wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("Login");
			bOk = wsf.testPageForms("Login");
		} catch (Exception e) {
			e.printStackTrace();
			fail("setUp failed with Exception " + e);
		}		
	}
	
	/**
	 * tests path where we add caqndidate with random
	 * name to Candidates, check Candidates list that this
	 * new candidate exists, adds note and check that note exists.
	 * look at WebSiteFlowTest.xml
	 * */
	public void testCandidateToNoteCreatePath() {
		boolean bOk;
		
		try {
			//wsf.init();
			bOk = wsf.testPath("CandidateToNoteCreate");
			assertTrue(bOk);
		} catch (Exception e) {
			e.printStackTrace();
			fail("testCandidateToNoteCreatePath failed with Exception " + e);
		}		
	}
}
