package com.topcoder.web.screening.request;

import junit.framework.TestCase;
import junit.framework.TestCase;

import com.topcoder.web.test.wsf.WebSiteFlowTest;

import com.topcoder.web.screening.model.CandidateInfo;
import com.topcoder.web.screening.common.Constants;

import com.topcoder.web.test.ServletRequestHelper;

/**
 * JUnit class for testing PopulateCandidate class
 * */
public class PopulateCandidateTestCase extends TestCase {

    private PopulateCandidate pCand;
    private ServletRequestHelper helper;
    
    /**
     * constructor with name for TestCase
     * */
    public PopulateCandidateTestCase(String name) {
        super(name);
    }

    public void setUp() {
        helper = new ServletRequestHelper();
        pCand = new PopulateCandidate();
        pCand.setRequest(helper);
    }

    public void tearDown() {
        pCand = null;
        helper = null;
    }

    public void testProcessWithCandidateInfo() {
        helper.setAttribute(Constants.CANDIDATE_INFO, new CandidateInfo());
        try {
            pCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }
    }

    public void testProcessWithCandidateId() {
        helper.setParameter(Constants.USER_ID, "123");
        try {
            pCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }

        CandidateInfo info = (CandidateInfo)helper.getAttribute(Constants.CANDIDATE_INFO);
        assertNotNull("candidateInfo wasn't created in process call", info);
        assertEquals(new Long(123), info.getUserId());
    }

    public void testProcessWithoutParams() {
        try {
            pCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }
    }
    
    /**
     * testing that we can open Populate Candidate page
     * using Web Site Flow framework
     * */
	public void testPopulateCandidateWSF() {
		WebSiteFlowTest wsf = new WebSiteFlowTest();
		boolean bOk;
		
		try {
			wsf.init();
			bOk = wsf.testPage("PopulateCandidate");
			assertTrue(bOk);
		} catch (Exception e) {
			fail("testPopulateCandidateWebSiteFlow failed with Exception " + e);
		}		
	}
}
