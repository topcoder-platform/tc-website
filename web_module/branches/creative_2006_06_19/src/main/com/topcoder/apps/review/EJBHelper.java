/**
 * Copyright (c) 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.DocumentManagerLocalHome;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocal;
import com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;

/**
 * Helper class that handles the communication with the EJBs from the persistance layer and with the security
 * manager EJBs.
 *
 * @author adic
 * @version 1.0
 */
public class EJBHelper {

    /**
     * Flag indicating whether we are in test mode or not.
     * In test mode all getters return mockup objects.
     * In non-test mode all getters return true EJB instances from the persistence layer.
     */
    private static boolean testMode = false;

    /**
     * The name of the login mockup class
     */
    private static String loginMockupClass = "com.topcoder.apps.review.mockup.LoginMockup";

    /**
     * The name of the policy mockup class
     */
    private static String policyMockupClass = "com.topcoder.apps.review.mockup.PolicyMockup";

    /**
     * The name of the policy manager mockup class
     */
    private static String policyMgrMockupClass = "com.topcoder.apps.review.mockup.PolicyManagerMockup";

    /**
     * The name of the principal manager mockup class
     */
    private static String principalMgrMockupClass = "com.topcoder.apps.review.mockup.PrincipalManagerMockup";

    /**
     * The name of the document manager mockup class
     */
    private static String documentManagerMockupClass = "com.topcoder.apps.review.mockup.DocumentManagerMockup";

    /**
     * The name of the project tracker mockup class
     */
    private static String projectTrackerMockupClass = "com.topcoder.apps.review.mockup.ProjectTrackerMockup";

    /**
     * The name of the user manager mockup class
     */
    private static String userManagerMockupClass = "com.topcoder.apps.review.mockup.UserManagerMockup";

    /**
     * The security manager Login EJB instance.
     */
    private static LoginRemote login = null;

    /**
     * The security manager Policy EJB instance.
     */
    private static PolicyRemote policy = null;

    /**
     * The security manager PolicyMgr EJB instance.
     */
    private static PolicyMgrRemote policyMgr = null;

    /**
     * The security manager PrincipalMgr EJB instance.
     */
    private static PrincipalMgrRemote principalMgr = null;

    /**
     * The document manager instance.
     */
    private static DocumentManagerLocal documentManager = null;

    /**
     * The project tracker instance.
     */
    private static ProjectTrackerLocal projectTracker = null;

    /**
     * The user manager instance.
     */
    private static UserManagerLocal userManager = null;

    /**
     * Constructor (inhibits outside instantiation).
     */
    private EJBHelper() {
    }

    /**
     * Set the test mode.
     * In test mode all getters return mockup objects.
     * In non-test mode all getters return true EJB instances from the persistence layer.
     *
     * @param testMode true if test mode should be set, false otherwise
     */
    public static void setTestMode(boolean testMode) {
        EJBHelper.testMode = testMode;
    }

    /**
     * Set custom mockup classes for testing.
     *
     * @param classNames an array of exactly 7 fully qualified mockup class names
     */
    public static void setMockupClasses(String[] classNames) {
        loginMockupClass = classNames[0];
        policyMockupClass = classNames[1];
        policyMgrMockupClass = classNames[2];
        principalMgrMockupClass = classNames[3];
        documentManagerMockupClass = classNames[4];
        projectTrackerMockupClass = classNames[5];
        userManagerMockupClass = classNames[6];
    }

    /**
     * Get the test mode.
     * In test mode all getters return mockup objects.
     * In non-test mode all getters return true EJB instances from the persistence layer.
     *
     * @return true if test mode is set, false otherwise
     */
    public static boolean isTestMode() {
        return EJBHelper.testMode;
    }

    /**
     * Get an instance of the security manager login.
     *
     * @return the LoginRemote instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized LoginRemote getLogin() throws NamingException, RemoteException, CreateException {
        if (login == null) {
            if (testMode) {
                try {
                    login = (LoginRemote) Class.forName(loginMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(LoginRemoteHome.EJB_REF_NAME);
                LoginRemoteHome home = (LoginRemoteHome) PortableRemoteObject.narrow(objref, LoginRemoteHome.class);
                login = home.create();
            }
        }
        return login;
    }

    /**
     * Get an instance of the security manager policy.
     *
     * @return the PolicyRemote instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized PolicyRemote getPolicy() throws NamingException, RemoteException, CreateException {
        if (policy == null) {
            if (testMode) {
                try {
                    policy = (PolicyRemote) Class.forName(policyMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(PolicyRemoteHome.EJB_REF_NAME);
                PolicyRemoteHome home = (PolicyRemoteHome) PortableRemoteObject.narrow(objref, PolicyRemoteHome.class);
                policy = home.create();
            }
        }
        return policy;
    }

    /**
     * Get an instance of the security manager policy manager.
     *
     * @return the PolicyMgrRemote instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized PolicyMgrRemote getPolicyMgr() throws NamingException, RemoteException, CreateException {
        if (policyMgr == null) {
            if (testMode) {
                try {
                    policyMgr = (PolicyMgrRemote) Class.forName(policyMgrMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(PolicyMgrRemoteHome.EJB_REF_NAME);
                PolicyMgrRemoteHome home =
                        (PolicyMgrRemoteHome) PortableRemoteObject.narrow(objref, PolicyMgrRemoteHome.class);
                policyMgr = home.create();
            }
        }
        return policyMgr;
    }

    /**
     * Get an instance of the security manager principal manager.
     *
     * @return the PrincipalMgrRemote instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized PrincipalMgrRemote getPrincipalMgr() throws NamingException, RemoteException, CreateException {
        if (principalMgr == null) {
            if (testMode) {
                try {
                    principalMgr = (PrincipalMgrRemote) Class.forName(principalMgrMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemoteHome home =
                        (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(objref, PrincipalMgrRemoteHome.class);
                principalMgr = home.create();
            }
        }
        return principalMgr;
    }

    /**
     * Get an instance of the document manager.
     *
     * @return the DocumentManager instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized DocumentManagerLocal getDocumentManager() throws NamingException, RemoteException, CreateException {
        if (documentManager == null) {
            if (testMode) {
                try {
                    documentManager = (DocumentManagerLocal) Class.forName(documentManagerMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(DocumentManagerLocalHome.EJB_REF_NAME);
                DocumentManagerLocalHome home = (DocumentManagerLocalHome) PortableRemoteObject.narrow(objref, DocumentManagerLocalHome.class);
                documentManager = home.create();
            }
        }
        return documentManager;
    }

    /**
     * Get an instance of the project tracker.
     *
     * @return the ProjectTracker instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized ProjectTrackerLocal getProjectTracker() throws NamingException, RemoteException, CreateException {
        if (projectTracker == null) {
            if (testMode) {
                try {
                    projectTracker = (ProjectTrackerLocal) Class.forName(projectTrackerMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(ProjectTrackerLocalHome.EJB_REF_NAME);
                ProjectTrackerLocalHome home = (ProjectTrackerLocalHome) PortableRemoteObject.narrow(objref, ProjectTrackerLocalHome.class);
                projectTracker = home.create();
            }
        }
        return projectTracker;
    }

    /**
     * Get an instance of the user manager.
     *
     * @return the UserManager instance
     *
     * @throws NamingException thrown from the EJB lookup code
     * @throws RemoteException thrown from the EJB lookup code
     * @throws CreateException thrown from the EJB lookup code
     */
    public static synchronized UserManagerLocal getUserManager() throws NamingException, RemoteException, CreateException {
        if (userManager == null) {
            if (testMode) {
                try {
                    userManager = (UserManagerLocal) Class.forName(userManagerMockupClass).newInstance();
                } catch (Exception e) {
                    System.err.println("mockup classes are absent");
                }
            } else {
                Context initial = new InitialContext();
                Object objref = initial.lookup(UserManagerLocalHome.EJB_REF_NAME);
                UserManagerLocalHome home = (UserManagerLocalHome) PortableRemoteObject.narrow(objref, UserManagerLocalHome.class);
                userManager = home.create();
            }
        }
        return userManager;
    }

}

