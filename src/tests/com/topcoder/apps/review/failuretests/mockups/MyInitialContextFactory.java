/*
 * MyInitialContextFactory.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.spi.InitialContextFactory;

/**
 * <p>An implementation of InitialContextFactory that returns
 * a new MyContext.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyInitialContextFactory implements InitialContextFactory {
    public Context getInitialContext(Hashtable environment)
            throws NamingException {
        return (new MyContext());
    }
}
