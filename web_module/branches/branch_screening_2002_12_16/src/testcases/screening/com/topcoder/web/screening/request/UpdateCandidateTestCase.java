package com.topcoder.web.screening.request;

import junit.framework.TestCase;

import com.topcoder.web.screening.model.CandidateInfo;

import com.topcoder.web.test.ServletRequestHelper;

public class UpdateCandidateTestCase extends TestCase {
    private UpdateCandidate uCand;
    private ServletRequestHelper helper;

    public UpdateCandidateTestCase(String name) {
        super(name);
    }

    public void setUp() {
        helper = new ServletRequestHelper();
        uCand = new UpdateCandidate();
        uCand.setRequest(helper);
    }

    public void tearDown() {
        uCand = null;
        helper = null;
    }

    public void testProcessWithoutParams() {
        Exception e = null;
        try {
            uCand.process();
        }
        catch(Exception ex) {
            e = ex;
        }
        assertNotNull("Expected exception but got none", e);
    }

    public void testProcessWithOnlyEmailAddress() {
        Exception e = null;
        //this email should bomb
        helper.setParameter("emailAddress", "foobar");
        try {
            uCand.process();
        }
        catch(Exception ex) {
            e = ex;
        }
        assertNotNull("Expected exception but did not get one", e);

        helper.setParameter("emailAddress", "foo@bar.com");
        try {
            uCand.process();
        }
        catch(Exception ex) {
            e = ex;
        }
        assertNotNull("Expected exception but did not get one", e);
    }

    public void testProcessWithAllParameters() {
        helper.setParameter("emailAddress", "foo@bar.com");
        helper.setParameter("password", "12345");
        helper.setParameter("referrer", "session");
        try {
            uCand.process();
        }
        catch(Exception e) {
            fail(e.getMessage());
        }
    }

}
