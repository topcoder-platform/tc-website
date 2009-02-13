/*
 * AllForumTests.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.forum.test;

import junit.framework.*;

/**
 * a JUnit test suite that exercises all of the classes of the DDE specification
 * forum package
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class AllForumTests extends TestSuite {

    public AllForumTests() {
        addTestSuite(TestSpecificationTopic.class);
        addTestSuite(TestSpecificationXMLAppender.class);
        addTestSuite(TestDDEForum.class);
    }

    public static Test suite() {
        return new ForumTestSetup(new AllForumTests());
    }
}