/*
 * TestSpecificationTopic.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.forum.test;

import com.topcoder.dde.forum.*;
import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.ComponentInfo;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.Document;
import com.topcoder.dde.catalog.Forum;
import com.topcoder.dde.forum.DDEForum;
import com.topcoder.forum.ForumException;
import com.topcoder.forum.ForumRemote;
import com.topcoder.forum.Thread;
import com.topcoder.forum.Topic;
import com.topcoder.forum.ForumView;
import com.topcoder.util.idgenerator.bean.*;

import java.util.Collection;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TestSpecificationTopic extends TestCase {

    private DDEForum ddeForum;
    private ForumRemote forum;
    private long forumId;
    private Topic topic1;
    private Topic topic2;
    private Topic subtopic1;
    private Document doc1;
    private Document doc2;
    private Document doc3;

    public TestSpecificationTopic(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        forum = ForumTestSetup.forum;
        ddeForum = ForumTestSetup.ddeForum;
        forumId = ForumTestSetup.forumId;
        topic1 = ForumTestSetup.topic1;
        topic2 = ForumTestSetup.topic2;
        subtopic1 = ForumTestSetup.subtopic1;
        forum.clearPath();
        forum.pushPath(topic1);
        doc1 = ForumTestSetup.doc1;
        doc2 = ForumTestSetup.doc2;
        doc3 = ForumTestSetup.doc3;
    }

    public void testAddGetDocuments() throws Exception {
        SpecificationView view =
                ddeForum.generateSpecificationView(forum.generateView());
        SpecificationTopic st = (SpecificationTopic) view.iterator().next();
        Collection documents;

        st.addDocument(doc1);
        documents = st.getDocuments();
        assertEquals("Wrong number of documents returned", 1, documents.size());
        assertTrue("documents not retrieved correctly",
                documents.contains(doc1));

        st.addDocument(doc2);
        documents = st.getDocuments();
        assertEquals("Wrong number of documents returned", 2, documents.size());
        assertTrue("documents not retrieved correctly",
                documents.contains(doc1));
        assertTrue("documents not retrieved correctly",
                documents.contains(doc2));
    }

    public void testAddGetDocuments_NewView() throws Exception {
        SpecificationView view =
                ddeForum.generateSpecificationView(forum.generateView());
        SpecificationTopic st = (SpecificationTopic) view.iterator().next();
        Collection documents;

        st.addDocument(doc1);
        st.addDocument(doc2);
        forum.updateTopic(st);

        view = ddeForum.generateSpecificationView(forum.generateView());
        st = (SpecificationTopic) view.iterator().next();
        documents = st.getDocuments();
        assertEquals("Wrong number of documents returned", 2, documents.size());
        assertTrue("documents not retrieved correctly",
                documents.contains(doc1));
        assertTrue("documents not retrieved correctly",
                documents.contains(doc2));
    }

    public void testAddDocument_Null() throws Exception {
        SpecificationView view =
                ddeForum.generateSpecificationView(forum.generateView());
        SpecificationTopic st = (SpecificationTopic) view.iterator().next();

        try {
            st.addDocument(null);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException iae) {
            /* the expected case */
        }
    }

    public void testAddDocument_Unregistered() throws Exception {
        SpecificationView view =
                ddeForum.generateSpecificationView(forum.generateView());
        SpecificationTopic st = (SpecificationTopic) view.iterator().next();

        try {
            st.addDocument(doc3);
            fail("Expected an IllegalArgumentException");
        } catch (IllegalArgumentException fe) {
            /* the expected case */
        }
    }

    public void testGetDocuments_Unmodifiable() throws Exception {
        SpecificationView view =
                ddeForum.generateSpecificationView(forum.generateView());
        SpecificationTopic st = (SpecificationTopic) view.iterator().next();
        Collection documents;

        st.addDocument(doc1);
        st.addDocument(doc2);
        documents = st.getDocuments();

        try {
            documents.clear();
            fail("Expected an UnsupportedOPerationException");
        } catch (UnsupportedOperationException uoe) {
            /* the expected case */
        }
        try {
            documents.add(doc3);
            fail("Expected an UnsupportedOPerationException");
        } catch (UnsupportedOperationException uoe) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new ForumTestSetup(new TestSuite(TestSpecificationTopic.class));
    }

}
