/*
 * TestDDEForum.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.forum.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentSummary;
import com.topcoder.dde.catalog.Document;
import com.topcoder.dde.catalog.Forum;
import com.topcoder.dde.forum.*;
import com.topcoder.dde.user.User;
import com.topcoder.forum.ForumException;
import com.topcoder.forum.ForumRemote;
import com.topcoder.forum.Thread;
import com.topcoder.forum.Topic;
import com.topcoder.forum.ForumView;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.util.idgenerator.bean.*;

import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TestDDEForum extends TestCase {

    private DDEForum ddeForum;
    private TCSubject subject;
    private long forumId;
    private Catalog catalog;
    private ComponentManager componentManager;
    private ForumRemote forum;
    private PrincipalMgrRemote principalMgr;
    private LoginRemote login;
    private IdGen idGen;
    private RolePrincipal moderateRole;
    private RolePrincipal postRole;
    private UserPrincipal defaultUserPrincipal;
    private User defaultUser;
    private long componentId;
    private Topic topic1;
    private Topic topic2;
    private Topic subtopic1;
    private Document doc1;
    private Document doc2;
    private Document doc3;

    public TestDDEForum(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        ddeForum = ForumTestSetup.ddeForum;
        forumId = ForumTestSetup.forumId;
        catalog = ForumTestSetup.catalog;
        componentManager = ForumTestSetup.componentManager;
        forum = ForumTestSetup.forum;
        principalMgr = ForumTestSetup.principalMgr;
        login = ForumTestSetup.login;
        idGen = ForumTestSetup.idGen;
        defaultUserPrincipal = ForumTestSetup.defaultUserPrincipal;
        defaultUser = ForumTestSetup.defaultUser;
        moderateRole = ForumTestSetup.moderateRole;
        postRole = ForumTestSetup.postRole;
        componentId = ForumTestSetup.componentId;
        topic1 = ForumTestSetup.topic1;
        topic2 = ForumTestSetup.topic2;
        subtopic1 = ForumTestSetup.subtopic1;
        doc1 = ForumTestSetup.doc1;
        doc2 = ForumTestSetup.doc2;
        doc3 = ForumTestSetup.doc3;
    }

    public void testCanModerate() throws Exception {
        TCSubject subject = login.login(
                defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());

        assertTrue("User already has moderate permission",
                !ddeForum.canModerate(forumId, subject));
        principalMgr.assignRole(defaultUserPrincipal, moderateRole, null);
        subject = login.login(
                defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());
        assertTrue("User already doesn't have moderate permission",
                ddeForum.canModerate(forumId, subject));
    }

    public void testCanModerate_InvalidForum() throws Exception {
        TCSubject subject = login.login(
                defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());
        assertTrue("Expected false response",
                !ddeForum.canModerate(idGen.nextId(), subject));
    }

    public void testCanModerate_NullSubject() throws Exception {
        try {
            ddeForum.canModerate(forumId, null);
            fail("Expected a ForumException");
        } catch (ForumException fe) {
            /* the expected case */
        }
    }

    public void testCanPost() throws Exception {
        TCSubject subject = login.login(
                defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());

        assertTrue("User already has post permission",
                !ddeForum.canPost(forumId, subject));
        principalMgr.assignRole(defaultUserPrincipal, postRole, null);
        subject = login.login(
                defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());
        assertTrue("User doesnn't have post permission",
                ddeForum.canPost(forumId, subject));
    }

    public void testCanPost_InvalidForum() throws Exception {
        TCSubject subject = login.login(
                defaultUser.getRegInfo().getUsername(),
                defaultUser.getRegInfo().getPassword());
        assertTrue("Expected false response",
                !ddeForum.canPost(idGen.nextId(), subject));
    }

    public void testCanPost_NullSubject() throws Exception {
        try {
            ddeForum.canPost(forumId, null);
            fail("Expected a ForumException");
        } catch (ForumException fe) {
            /* the expected case */
        }
    }

    public void testGenerateSpecificationView() throws Exception {
        ForumView view;
        SpecificationView sView;
        Iterator viewIterator;
        int count;

        /* set up a view of the forum root */
        forum.clearPath();
        view = forum.generateView();
        // Added by Albert
        viewIterator = view.iterator();
        while (viewIterator.hasNext()) {
            System.out.println("From ForumView: " + ((Topic) viewIterator.next()).getName());
        }
        // End of added

        sView = ddeForum.generateSpecificationView(view);

        /* test whether it contains the correct elements */
        viewIterator = sView.iterator();
        count = 0;

        System.out.println("Topic1 Name: " + topic1.getName() + ".");
        System.out.println("Topic2 Name: " + topic2.getName() + ".");
        while (viewIterator.hasNext()) {
            SpecificationTopic t = (SpecificationTopic) viewIterator.next();

            System.out.println("Spec Topic Name: " + t.getName() + ".");
            assertTrue("Bad or garbled specification topic",
                    t.getName().equals(topic1.getName())
                    || t.getName().equals(topic2.getName()));
            count++;
        }
        assertEquals("Wrong number of specification topics", 2, count);

        /* set up a view of a topic */
        forum.pushPath(topic1);
        view = forum.generateView();
        sView = ddeForum.generateSpecificationView(view);

        /* test whether it contains the correct element and no others */
        viewIterator = sView.iterator();
        assertTrue("SpecificationView contains no element",
                viewIterator.hasNext());
        SpecificationTopic t = (SpecificationTopic) viewIterator.next();
        assertTrue("Bad or garbled specification topic",
                t.getName().equals(topic1.getName()));
        assertTrue("Wrong number of specification topics",
                !viewIterator.hasNext());

        /* Specification view test tacked on here: */
        assertTrue("The view has an empty XML representation",
                sView.toXML().length() > 0);
    }

    public void testGenerateSpecificationView_Null() throws Exception {
        try {
            ddeForum.generateSpecificationView(null);
            fail("Expected a ForumException");
        } catch (ForumException fe) {
            /* the expected case */
        }
    }

    public void testGetForumType() throws Exception {
        assertEquals("Wrong type identified", Forum.COLLABORATION,
                ddeForum.getForumType(forumId));
    }

    public void testGetForumType_InvalidId() throws Exception {
        try {
            ddeForum.getForumType(idGen.nextId());
            fail("Expected a ForumException");
        } catch (ForumException fe) {
            /* the expected case */
        }
    }

    public void testGetLinkedComponent() throws Exception {
        ComponentSummary compSummary = ddeForum.getLinkedComponent(forumId);
        assertEquals("Wrong component", componentId, compSummary.getComponentId());
    }

    public void testGetLinkedComponent_InvalidId() throws Exception {
        try {
            ddeForum.getLinkedComponent(idGen.nextId());
            fail("Expected a ForumException");
        } catch (ForumException fe) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new ForumTestSetup(new TestSuite(TestDDEForum.class));
    }
}
