package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.screening.model.CandidateInfo;

import com.topcoder.web.test.ServletRequestHelper;

public class PopulateCandidateTestCase extends TestCase {

    private PopulateCandidate pCand;
    private ServletRequestHelper helper;

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
        helper.setAttribute("candidateInfo", new CandidateInfo());
        try {
            pCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }
    }

    public void testProcessWithCandidateId() {
        helper.setParameter("candidateId", "123");
        try {
            pCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }

        CandidateInfo info = (CandidateInfo)helper.getAttribute("candidateInfo");
        assertNotNull("candidateInfo wasn't created in process call", info);
        assertEquals(new Long(123), info.getCandidateId());
    }

    public void testProcessWithoutParams() {
        try {
            pCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }
    }
}
