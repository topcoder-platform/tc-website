package com.topcoder.web.screening.model;

import junit.framework.TestCase;

public class CandidateInfoTestCase extends TestCase {

    private CandidateInfo info;

    public CandidateInfoTestCase(String name) {
        super(name);
    }

    public void setUp() {
        info = new CandidateInfo();
    }

    public void tearDown() {
        info = null;
    }

    public void testGetSet() {
        Long val = new Long(-1);
        info.setUserId(val);
        assertEquals(val, info.getUserId());

        String email = "foo@bar.com";
        info.setEmailAddress(email);
        assertEquals(email, info.getEmailAddress());

        String password = "12345";
        info.setPassword(password);
        assertEquals(password, info.getPassword());
    }
}
