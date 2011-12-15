package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.policy.PolicyLocalHome;
import com.topcoder.security.login.LoginLocalHome;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.security.admin.PolicyMgrLocalHome;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;
import com.topcoder.apps.review.document.DocumentManagerLocalHome;
import com.topcoder.apps.review.projecttracker.UserManagerHome;
import com.topcoder.apps.review.projecttracker.ProjectTrackerHome;
import com.topcoder.apps.review.document.DocumentManagerHome;

import javax.naming.*;
import java.util.Hashtable;

/**
 * Serves as the Context for testings seperate from the persistence layer.<p>
 * It is important to note that the only method that is <i>really</tt> implemented
 * is {@link #lookup(String)}.  The rest simply return some default or null value
 * or otherwise do nothing at all.
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class TestingContext implements Context {

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

    public TestingContext() {
    }

    /**
     * The only method that is actually implemented.<p>
     * Even so, it is not very thorough.  If a HomeInterface is looked up by its
     * EJB_REF_NAME then the ThreadLocal instance of the xxxHomeTester is
     * returned.  Recognized EJB_REF_NAMEs are {@link PolicyRemoteHome#EJB_REF_NAME},
     * {@link LoginRemoteHome#EJB_REF_NAME}, {@link DocumentManagerHome#EJB_REF_NAME},
     * {@link UserManagerHome#EJB_REF_NAME} and {@link ProjectTrackerHome#EJB_REF_NAME}.
     * All other lookups return null.
     *
     * @param name the EJB_REF_NAME
     * @return the xxxHomeTester if the EJB_REF_NAME is recognized
     */
    public Object lookup(String name) {
        if (PolicyLocalHome.EJB_REF_NAME.equals(name))
            return PolicyLocalHomeTester.getInstance();
        else if (LoginLocalHome.EJB_REF_NAME.equals(name))
            return LoginLocalHomeTester.getInstance();
        else if (ProjectTrackerLocalHome.EJB_REF_NAME.equals(name))
            return ProjectTrackerLocalHomeTester.getInstance();
        else if (UserManagerLocalHome.EJB_REF_NAME.equals(name))
            return UserManagerLocalHomeTester.getInstance();
        else if (DocumentManagerLocalHome.EJB_REF_NAME.equals(name))
            return DocumentManagerLocalHomeTester.getInstance();
        else if (PolicyRemoteHome.EJB_REF_NAME.equals(name))
            return PolicyRemoteHomeTester.getInstance();
        else if (LoginRemoteHome.EJB_REF_NAME.equals(name))
            return LoginRemoteHomeTester.getInstance();
        else if (ProjectTrackerHome.EJB_REF_NAME.equals(name))
            return ProjectTrackerHomeTester.getInstance();
        else if (UserManagerHome.EJB_REF_NAME.equals(name))
            return UserManagerHomeTester.getInstance();
        else if (DocumentManagerHome.EJB_REF_NAME.equals(name))
            return DocumentManagerHomeTester.getInstance();
        else if (PolicyMgrLocalHome.EJB_REF_NAME.equals(name))
            return PolicyMgrLocalHomeTester.getInstance();
        else if (PolicyMgrRemoteHome.EJB_REF_NAME.equals(name))
            return PolicyMgrRemoteHomeTester.getInstance();
        else
            return null;
    }
}
