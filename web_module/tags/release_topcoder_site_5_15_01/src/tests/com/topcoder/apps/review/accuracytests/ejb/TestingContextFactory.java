/*
 * TestingContextFactory.java
 *
 * Created on July 7, 2003, 9:41 PM
 */

package com.topcoder.apps.review.accuracytests.ejb;

import javax.naming.*;
import javax.naming.spi.*;

/**
 *
 * @author  Admin
 */
public class TestingContextFactory implements InitialContextFactory {

    /** Creates a new instance of TestingContextFactory */
    public TestingContextFactory() {
    }

    public Context getInitialContext(java.util.Hashtable environment) throws NamingException {
        return new TestingContext();
    }

}
