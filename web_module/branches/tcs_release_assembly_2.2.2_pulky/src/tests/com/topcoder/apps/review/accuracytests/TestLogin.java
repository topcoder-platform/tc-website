package com.topcoder.apps.review.accuracytests;

import junit.framework.Test;
import junit.framework.TestSuite;
import com.topcoder.apps.review.*;

//import org.apache.cactus.ServletTestCase;
//import org.apache.cactus.WebResponse;
//import org.apache.cactus.WebRequest;
//import org.apache.cactus.server.ServletContextWrapper;
import servletunit.struts.MockStrutsTestCase;
import com.topcoder.apps.review.projecttracker.User;


/**
 * @author Misha
 *
 * To change this generated comment edit the template variable "typecomment":
 * Window>Preferences>Java>Templates.
 * To enable and disable the creation of type comments go to
 * Window>Preferences>Java>Code Generation.
 */
public class TestLogin extends MockStrutsTestCase {

    public TestLogin(String name) {
        super(name);
    }

    /**
     * Initialize for the tests.
     */
    public void setUp() throws Exception {
        super.setUp();
        //setConfigFile("struts-config.xml");
        setConfigFile("conf/struts-config.xml");
        BusinessDelegate businessDelegate = new BusinessDelegate();
        businessDelegate.setUseMockup(true);
    }

    /**
     * Tear down for the tests.
     */
    public void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * Test the success login.
     */
    public void testLoginSuccess() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "pzhao");
        addRequestParameter("password", "xxx");
        actionPerform();

        verifyForward("success");
        user = getSession().getAttribute("user");
        assertTrue(user instanceof User);
        assertEquals("pzhao", ((User) user).getHandle());

        verifyNoActionErrors();
    }

    /**
     * Test wrong password.
     */
    public void testLoginBadPassword() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "pzhao");
        addRequestParameter("password", "xxx22");
        actionPerform();

        verifyForward("login");
        user = getSession().getAttribute("user");
        assertNull(user);
    }

    /**
     * Test wrong password.
     */
    public void testLoginBadName() {
        Object user = null;

        setRequestPathInfo("/login");
        addRequestParameter("username", "pzhao222");
        addRequestParameter("password", "xxx");
        actionPerform();

        verifyForward("login");
        user = getSession().getAttribute("user");
        assertNull(user);
    }


    /**
     * @return a test suite (<code>TestSuite</code>) that includes all methods
     *         starting with "test"
     */
    public static Test suite() {
        // All methods starting with "test" will be executed in the test suite.
        return new TestSuite(TestLogin.class);
    }
}
