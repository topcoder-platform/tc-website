/*
 * MyPolicyLocalHome.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;

import javax.ejb.Handle;
import javax.ejb.HomeHandle;
import javax.ejb.EJBMetaData;
import javax.ejb.RemoveException;
import javax.ejb.CreateException;

import com.topcoder.security.policy.PolicyLocal;
import com.topcoder.security.policy.PolicyLocalHome;

/**
 * <p>A mockup implementation of PolicyLocalHome used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyPolicyLocalHome extends EJBHomeBase implements PolicyLocalHome {
    /**
     * <p>Returns a new instance of MyPolicyLocal.</p>
     */
    public PolicyLocal create() throws CreateException {
        return (new MyPolicyLocal());
    }
}
