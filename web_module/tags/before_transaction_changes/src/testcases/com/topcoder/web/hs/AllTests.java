package com.topcoder.web.hs;

import junit.framework.*;

public class AllTests {


    ////////////////////////////////////////////////////////////////////////////
    public static Test suite() {
    ////////////////////////////////////////////////////////////////////////////

        TestSuite ts=new TestSuite("AllTests");

        ts.addTest(com.topcoder.web.ejb.user.UserTest.suite());
        ts.addTest(com.topcoder.web.ejb.user.UserTermsOfUseTest.suite());
        ts.addTest(com.topcoder.web.ejb.user.UserSchoolTest.suite());
        ts.addTest(com.topcoder.web.ejb.email.EmailTest.suite());
        ts.addTest(com.topcoder.web.ejb.school.SchoolTest.suite());
        ts.addTest(com.topcoder.web.ejb.termsofuse.TermsOfUseTest.suite());

        return ts;
    }


    ////////////////////////////////////////////////////////////////////////////
    public static void main(String args[]) {
    ////////////////////////////////////////////////////////////////////////////

        Test t=AllTests.suite();
        TestResult tr=new TestResult();
        t.run(tr);
        System.out.println("Number of test cases run: "+tr.runCount());
        System.out.println("All were successful: "+tr.wasSuccessful());
    }
}
