/*
 * RemoteComponentManagerTestCase.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentRequest;
import com.topcoder.dde.catalog.ComponentSummary;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.catalog.ComponentVersionRequest;
import com.topcoder.dde.catalog.Role;
import com.topcoder.dde.catalog.Download;

/*
 * a base class for JUnit test case classes that exercise the ComponentManager
 * EJB; provides common setUp and tearDown code, and common class and instance
 * variables
 *
 * @author John C. Bollinger
 * @version 1.0
 */

public class RemoteComponentManagerTestCase extends RemoteCatalogTestCase {

    protected long newVersionNumber;
    protected ComponentSummary summary1;
    protected ComponentSummary summary2;
    protected Download defaultDownload;
    protected Role memberRole;
    protected ComponentManager manager1;
    protected ComponentManager manager2;
    protected ComponentManager manager3;

    public RemoteComponentManagerTestCase(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        newVersionNumber = ComponentManagerTestSetup.newVersionNumber;
        summary1 = ComponentManagerTestSetup.summary1;
        summary2 = ComponentManagerTestSetup.summary2;
        defaultDownload = ComponentManagerTestSetup.defaultDownload;
        memberRole = ComponentManagerTestSetup.memberRole;
        manager1 = componentManagerHome.create(summary1.getComponentId());
        manager2 = componentManagerHome.create(summary2.getComponentId(),
                summary2.getVersion());
        manager3 = componentManagerHome.create(summary2.getComponentId(),
                newVersionNumber);
    }

    public void tearDown() throws Exception {
        manager1.remove();
        manager2.remove();
        manager3.remove();
        super.tearDown();
    }
}
