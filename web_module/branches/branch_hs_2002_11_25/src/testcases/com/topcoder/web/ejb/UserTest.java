package com.topcoder.web.ejb;

import junit.framework.*;

import java.util.*;
import javax.naming.*;
import javax.rmi.*;

public class UserTest extends EJBTestCase {

  public static Test suite() {
    TestSuite ts=new TestSuite("UserTest");
    ts.addTestSuite(UserTest.class);
    return(ts);
  }

  public UserTest(String _name) {
    super(_name);
  }

  public void createTest() throws Exception {
    String username="unlord";
    InitialContext ctx=getContext();
  }

};
