/*
 * ForumTestSetup.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.forum.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogHome;
import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentRequest;
import com.topcoder.dde.catalog.ComponentSummary;
import com.topcoder.dde.catalog.Document;
import com.topcoder.dde.catalog.Forum;
import com.topcoder.dde.forum.*;
import com.topcoder.dde.user.test.UserTestSetup;
import com.topcoder.forum.ForumRemote;
import com.topcoder.forum.ForumRemoteHome;
import com.topcoder.forum.Thread;
import com.topcoder.forum.Topic;
import com.topcoder.forum.ForumView;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;
import com.topcoder.security.policy.PermissionCollection;

import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import junit.framework.Test;
import junit.extensions.TestSetup;

/**
 * a JUnit TestSetup that performs one-time setup for running tests of the
 * specification forum classes
 *
 * @author  John C. Bollinger
 * @version 1.0
 */
public class ForumTestSetup extends UserTestSetup {

    protected static final String DEF_COMP_NAME = "Bat Test Component";
    protected static final String DEF_COMP_SHORTD = "Another test component";
    protected static final String DEF_COMP_DESC =
            "A component for testing the specification forum, Robin.  "
            + "Not recommended for actual crime fighting.";
    protected static final String DEF_COMP_FUNCTIONAL =
            "No function beyond testing and CPU cycle eating";
    protected static final String DEF_COMP_KEYWORDS =
            "test" + ComponentInfo.KEYWORD_DELIMITER + "batman";
    protected static final String DEF_COMP_COMMENTS = "Holy testing, Batman!";
    protected static final String DEF_COMP_VERSION = "Gotham";

    private static int forumInitializationCount = 0;

    static Catalog catalog;
    static ComponentManager componentManager;
    static ForumRemote forum;
    static PolicyMgrRemote policyMgr;
    static PrincipalMgrRemote principalMgr;
    static RolePrincipal moderateRole;
    static RolePrincipal postRole;
    static DDEForum ddeForum;
    static UserPrincipal defaultUserPrincipal;
    static LoginRemote login;
    static long forumId;
    static long componentId;
    static Topic topic1;
    static Topic topic2;
    static Topic subtopic1;
    static Thread thread1;
    static Document doc1;
    static Document doc2;
    static Document doc3;

    public ForumTestSetup(Test t) {
        super(t);
    }

    public void setUp() throws Exception {
        super.setUp();
        ComponentRequest request;
        ComponentSummary compSummary;
        PermissionCollection permissions;
        long templ;
        Topic tp1, tp2, stp1;
        Thread th1;

        /* Need: Component w/ ComponentManager
                 Forum w/topics, subtopics, and threads
                 Catalog
                 Document(s)
                 2 TCSubjects
                 2 RolePrincipals
                 Use PrincipalManager, PolicyManager
         */
        synchronized (ForumTestSetup.class) {
            if (forumInitializationCount++ == 0) {

                CatalogHome catalogHome =
                        (CatalogHome) PortableRemoteObject.narrow(
                                namingContext.lookup(CatalogHome.EJB_REF_NAME),
                                CatalogHome.class);
                ComponentManagerHome componentManagerHome =
                        (ComponentManagerHome) PortableRemoteObject.narrow(
                                namingContext.lookup(ComponentManagerHome.EJB_REF_NAME),
                                ComponentManagerHome.class);
                ForumRemoteHome forumHome =
                        (ForumRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(ForumRemoteHome.EJB_REF_NAME),
                                ForumRemoteHome.class);
                PolicyMgrRemoteHome policyMgrHome =
                        (PolicyMgrRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(PolicyMgrRemoteHome.EJB_REF_NAME),
                                PolicyMgrRemoteHome.class);
                PrincipalMgrRemoteHome principalMgrHome =
                        (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME),
                                PrincipalMgrRemoteHome.class);
                LoginRemoteHome loginHome =
                        (LoginRemoteHome) PortableRemoteObject.narrow(
                                namingContext.lookup(LoginRemoteHome.EJB_REF_NAME),
                                LoginRemoteHome.class);
                DDEForumHome ddeForumHome =
                        (DDEForumHome) PortableRemoteObject.narrow(
                                namingContext.lookup("DDEForumEJB"),
                                DDEForumHome.class);

                catalog = catalogHome.create();
                request = new ComponentRequest(DEF_COMP_NAME, DEF_COMP_SHORTD,
                        DEF_COMP_DESC, DEF_COMP_FUNCTIONAL, DEF_COMP_KEYWORDS,
                        DEF_COMP_COMMENTS, DEF_COMP_VERSION, defaultUser.getId());
                compSummary = catalog.requestComponent(request);
                componentId = compSummary.getComponentId();
                catalog.approveComponent(componentId);
                componentManager = componentManagerHome.create(componentId);
                Forum f = componentManager.getForum(Forum.COLLABORATION);
                assertNotNull("Forum is null", f);
                forumId = f.getId();
                forum = forumHome.create(forumId);
                policyMgr = policyMgrHome.create();
                principalMgr = principalMgrHome.create();

                moderateRole = principalMgr.createRole(
                        "ForumModerator " + compSummary.getComponentId(), null);
                permissions = new PermissionCollection();
                permissions.addPermission(new ForumModeratePermission(forumId));
                policyMgr.addPermissions(moderateRole, permissions, null);

                postRole = principalMgr.createRole(
                        "ForumPoster " + compSummary.getComponentId(), null);
                permissions = new PermissionCollection();
                permissions.addPermission(new ForumPostPermission(forumId));
                policyMgr.addPermissions(postRole, permissions, null);

                defaultUserPrincipal = principalMgr.getUser(defaultUser.getId());

                ddeForum = ddeForumHome.create();

                login = loginHome.create();

                templ = idGen.nextId();
                tp1 = new Topic("Test Topic text #" + templ,
                        "Test Topic #" + templ);
                templ = idGen.nextId();
                tp2 = new Topic("Test Topic text #" + templ,
                        "Test Topic #" + templ);
                templ = idGen.nextId();
                stp1 = new Topic("Test Topic text #" + templ,
                        "Test Topic #" + templ);
                templ = idGen.nextId();
                th1 = new com.topcoder.forum.Thread(
                        "Test Thread text #" + templ);

                topic1 = forum.addTopic(tp1);
                topic2 = forum.addTopic(tp1);
                forum.pushPath(topic1);
                subtopic1 = forum.addTopic(stp1);
                forum.pushPath(subtopic1);
                thread1 = forum.addThread(th1);

                doc1 = new Document("Grocery List",
                        "http://www.mygroceries.net/~nobody/list",
                        Document.OTHER);
                doc2 = new Document("Laundry List",
                        "http://www.mylaundry.net/~nobody/list",
                        Document.OTHER);
                doc3 = new Document("Mailing List",
                        "http://www.myspam.net/~nobody/list",
                        Document.OTHER);

                doc1 = componentManager.addDocument(doc1);
                doc2 = componentManager.addDocument(doc2);
            }
        }
    }

    public void tearDown() throws Exception {
        synchronized (ForumTestSetup.class) {
            if (--forumInitializationCount == 0) {
                catalog.removeComponent(
                        componentManager.getComponentInfo().getId());
                catalog.remove();
                componentManager.remove();
                forumId = -1L;
                forum.remove();
                policyMgr.remove();
                principalMgr.removeRole(moderateRole, null);
                principalMgr.removeRole(postRole, null);
                principalMgr.remove();
                ddeForum.remove();
                login.remove();
            }
        }
        super.tearDown();
    }

}
