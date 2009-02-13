/*
 * TCS Online Review Application
 *
 * UMProxy.java
 *
 * Copyright (c) 2003  Topcoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.security.TCSubject;

/**
 * An interface defining a proxy for the real bean, so as to hide
 * implementation differences from the tests as much as possible
 *
 * @author ThinMan
 * @version 1.0
 */
interface UMProxy {

    /** Mirror's the bean's getUser method */
    public User getUser(TCSubject subj) throws Exception;

    /** Mirrors the remove() method provided by the EJB framework */
    public void remove() throws Exception;
}

