/*
 * TCS Online Review Application
 *
 * Sub2UMProxy.java
 *
 * Copyright (c) 2003  Topcoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;
import com.topcoder.security.TCSubject;

import javax.naming.Context;
import javax.naming.InitialContext;

/**
 * An implementation of the UMProxy interface particular to submitter 2's
 * submission
 *
 * @author ThinMan
 * @version 1.0
 */
class Sub2UMProxy implements UMProxy {

    private final static String HOME_NAME =
            "java:comp/env/projecttracker/UserManager";
    private UserManagerLocal bean;

    public Sub2UMProxy() throws Exception {
        Context ctx = new InitialContext();
        UserManagerLocalHome home =
                (UserManagerLocalHome) ctx.lookup(HOME_NAME);
        bean = home.create();
    }

    public User getUser(TCSubject subj) throws Exception {
        return bean.getUser(subj);
    }

    public void remove() throws Exception {
        bean.remove();
    }
}

