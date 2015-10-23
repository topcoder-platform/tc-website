/*
 * MyContext.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import javax.naming.*;
import java.util.Hashtable;

import com.topcoder.security.login.LoginLocalHome;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.security.policy.PolicyLocalHome;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.apps.review.document.DocumentManagerHome;
import com.topcoder.apps.review.document.DocumentManagerLocalHome;
import com.topcoder.apps.review.projecttracker.UserManagerHome;
import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;
import com.topcoder.apps.review.projecttracker.ProjectTrackerHome;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;
import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;

/**
 * <p>Context used for testing purposes, it implements the lookup
 * method so that the mockup objects are returned.
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyContext implements Context {

    public Object lookup(Name name) throws NamingException {
        return null;
    }

    public void bind(Name name, Object obj) throws NamingException {
    }

    public void bind(String name, Object obj) throws NamingException {
    }

    public void rebind(Name name, Object obj) throws NamingException {
    }

    public void rebind(String name, Object obj) throws NamingException {
    }

    public void unbind(Name name) throws NamingException {
    }

    public void unbind(String name) throws NamingException {
    }

    public void rename(Name oldName, Name newName) throws NamingException {
    }

    public void rename(String oldName, String newName) throws NamingException {
    }

    public NamingEnumeration list(Name name) throws NamingException {
        return null;
    }

    public NamingEnumeration list(String name) throws NamingException {
        return null;
    }

    public NamingEnumeration listBindings(Name name) throws NamingException {
        return null;
    }

    public NamingEnumeration listBindings(String name) throws NamingException {
        return null;
    }

    public void destroySubcontext(Name name) throws NamingException {
    }

    public void destroySubcontext(String name) throws NamingException {
    }

    public Context createSubcontext(Name name) throws NamingException {
        return null;
    }

    public Context createSubcontext(String name) throws NamingException {
        return null;
    }

    public Object lookupLink(Name name) throws NamingException {
        return null;
    }

    public Object lookupLink(String name) throws NamingException {
        return null;
    }

    public NameParser getNameParser(Name name) throws NamingException {
        return null;
    }

    public NameParser getNameParser(String name) throws NamingException {
        return null;
    }

    public Name composeName(Name name, Name prefix) throws NamingException {
        return null;
    }

    public String composeName(String name, String prefix)
            throws NamingException {
        return null;
    }

    public Object addToEnvironment(String propName, Object propVal)
            throws NamingException {
        return null;
    }

    public Object removeFromEnvironment(String propName)
            throws NamingException {
        return null;
    }

    public Hashtable getEnvironment() throws NamingException {
        return null;
    }

    public void close() throws NamingException {
    }

    public String getNameInNamespace() throws NamingException {
        return null;
    }

    public MyContext() {
        System.out.println("Yep.");
    }

    /**
     * <p>Returns the mockup object corresponding to EJB_REF_NAME</p>
     *
     * @param name the EJB_REF_NAME
     * @return the mockup object correspoding to EJB_REF_NAME
     */
    public Object lookup(String name) {
        if (PolicyLocalHome.EJB_REF_NAME.equals(name)) {
            return new MyPolicyLocalHome();
        }
        if (PolicyRemoteHome.EJB_REF_NAME.equals(name)) {
            return new MyPolicyRemoteHome();
        }
        if (LoginLocalHome.EJB_REF_NAME.equals(name)) {
            return new MyLoginLocalHome();
        }
        if (LoginRemoteHome.EJB_REF_NAME.equals(name)) {
            return new MyLoginRemoteHome();
        }
        if (ProjectTrackerLocalHome.EJB_REF_NAME.equals(name)) {
            return new MyProjectTrackerHome();
        }
        if (UserManagerLocalHome.EJB_REF_NAME.equals(name)) {
            return new MyUserManagerHome();
        }
        if (DocumentManagerLocalHome.EJB_REF_NAME.equals(name)) {
            return new MyDocumentManagerHome();
        }
        return null;
    }
}

