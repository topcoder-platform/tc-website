package com.topcoder.web.ejb;

import junit.framework.*;

import java.util.*;
import javax.naming.*;
import javax.rmi.*;

public class AllTestsEJB {

  public static Test suite() {
    TestSuite ts=new TestSuite("EJBTests");
    ts.addTest(UserTest.suite());
    return(ts);
  }

  public static void main(String _argv[]) {
    Test t=AllTestsEJB.suite();
    TestResult tr=new TestResult();
    t.run(tr);
    System.out.println("Number of test cases run: "+tr.runCount());
    System.out.println("All were successful: "+tr.wasSuccessful());
  }
}; 
