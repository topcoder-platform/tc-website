/*
 * MyLoginLocalHome.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;

import javax.ejb.Handle;
import javax.ejb.EJBHome;
import javax.ejb.HomeHandle;
import javax.ejb.EJBMetaData;
import javax.ejb.RemoveException;
import javax.ejb.CreateException;

import com.topcoder.security.login.LoginLocal;
import com.topcoder.security.login.LoginLocalHome;

/**
 * <p>A mockup implementation of LoginLocalHome used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyLoginLocalHome extends EJBHomeBase implements LoginLocalHome {
    /**
     * <p>Returns a new instance of MyLoginLocal.</p>
     */
    public LoginLocal create() throws CreateException {
        return (new MyLoginLocal());
    }
}
