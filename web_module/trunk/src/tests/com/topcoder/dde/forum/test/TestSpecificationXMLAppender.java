/*
 * TestSpecificationXMLAppender.java
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

public class TestSpecificationXMLAppender extends TestCase {

    private DDEForum ddeForum;
    private ForumRemote forum;
    private long forumId;
    private Topic topic1;
    private Topic topic2;
    private Topic subtopic1;
    private Document doc1;
    private Document doc2;
    private Document doc3;

    public TestSpecificationXMLAppender(String testName) {
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

    public void testVisitTopic() throws Exception {
        SpecificationView view =
                ddeForum.generateSpecificationView(forum.generateView());
        SpecificationTopic st = (SpecificationTopic) view.iterator().next();
        Collection documents;
        SpecificationXMLAppender appender = new SpecificationXMLAppender("");
        String noDocString;
        String withDocString;

        appender.visitTopic(st);
        noDocString = appender.getXML();
        assertTrue("No XML generated", noDocString.length() > 0);

        appender = new SpecificationXMLAppender("");
        st.addDocument(doc1);
        appender.visitTopic(st);
        withDocString = appender.getXML();
        assertTrue("No XML generated", withDocString.length() > 0);
        assertTrue("No XML generated for a document",
                withDocString.length() > noDocString.length());
    }

    public static Test suite() {
        return new ForumTestSetup(new TestSuite(TestSpecificationXMLAppender.class));
    }

}
