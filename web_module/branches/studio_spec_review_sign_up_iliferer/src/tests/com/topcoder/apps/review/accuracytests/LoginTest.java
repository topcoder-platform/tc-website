/*
 * LoginTest.java
 *
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.*;
import com.topcoder.security.login.*;
import com.topcoder.security.policy.*;
import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.accuracytests.ejb.*;

/**
 *
 * @author  valeriy
 */
public class LoginTest extends AbstractAccuracyTest {

    public static final String USERNAME = "username";
    public static final String PASSWORD = "password";

    private Login login;
    private long id;

    /** Creates a new instance of LoginTest */
    public LoginTest(String name) {
        super(name);
    }

    public void setUp() throws Exception {
        super.setUp();
        login = new Login();
        LoginLocalTester ltester = getLoginTester();
        id = ltester.addUser(USERNAME, PASSWORD).getUserId();
    }

    public void testLogin1() throws Exception {
        try {
            LoginData data = ActionDataFactory.getLoginData(USERNAME, PASSWORD);
            ResultData res = login.start(data);
            if (!(res instanceof LoginResult)) {
                fail("LoginResult expected, but was ", res);
            }
            long uid = ((LoginResult) res).getUser().getId();
            assertEquals("Invalid user id", id, uid);
        } catch (Exception e) {
            e.printStackTrace();
            fail("Unexpected exception " + e);
        }
    }

    public void testLogin2() throws Exception {
        try {
            LoginData data = ActionDataFactory.getLoginData("uuu", "ppp");
            ResultData res = login.start(data);
            if (!(res instanceof FailureResult)) {
                fail("FailureResult expected, but was ", res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            //fail("Unexpected exception "+e);
        }
    }

}
