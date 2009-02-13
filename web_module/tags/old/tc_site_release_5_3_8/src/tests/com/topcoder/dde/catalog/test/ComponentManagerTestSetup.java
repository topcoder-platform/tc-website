/*
 * ComponentManagerTestSetup.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.*;
import junit.framework.Test;

public class ComponentManagerTestSetup extends CatalogTestSetup {

    private static int componentManagerInitializationCount = 0;
    private static Catalog catalog;
    static long newVersionNumber;
    static ComponentSummary summary1;
    static ComponentSummary summary2;
    static Download defaultDownload;
    static Role memberRole;

    public ComponentManagerTestSetup(Test t) {
        super(t);
    }

    public void setUp() throws Exception {
        super.setUp();
        synchronized (ComponentManagerTestSetup.class) {
            if (componentManagerInitializationCount++ == 0) {
                ComponentManager manager;
                ComponentRequest request;
                ComponentVersionInfo versionInfo;

                catalog = catalogHome.create();
                request = new ComponentRequest(DEF_COMP_NAME + idGen.nextId(),
                        DEF_COMP_SHORTD, DEF_COMP_DESC, DEF_COMP_FUNCTIONAL,
                        DEF_COMP_KEYWORDS, DEF_COMP_COMMENTS, DEF_COMP_VERSION,
                        defaultUser.getId());
                summary1 = catalog.requestComponent(request);
                request = new ComponentRequest(DEF_COMP_NAME + idGen.nextId(),
                        DEF_COMP_SHORTD, DEF_COMP_DESC, DEF_COMP_FUNCTIONAL,
                        DEF_COMP_KEYWORDS, DEF_COMP_COMMENTS, DEF_COMP_VERSION,
                        defaultUser.getId());
                summary2 = catalog.requestComponent(request);
                memberRole = catalog.addRole(
                        new Role("Test Role #" + idGen.nextId(),
                                "A role for use during component testing"));
                manager = componentManagerHome.create(summary2.getComponentId());
                versionInfo = manager.getVersionInfo();
                versionInfo.setPhase(ComponentVersionInfo.SPECIFICATION);
                manager.updateVersionInfo(versionInfo);
                versionInfo.setPhase(ComponentVersionInfo.DEVELOPMENT);
                manager.updateVersionInfo(versionInfo);
                versionInfo.setPhase(ComponentVersionInfo.COMPLETED);
                manager.updateVersionInfo(versionInfo);
                newVersionNumber = manager.createNewVersion(
                        new ComponentVersionRequest("new version time",
                                "Version 867.53.09", defaultUser.getId()));
                defaultDownload = manager.addDownload(new Download(
                        "A default download for testing purposes",
                        "http://test.com/download/default"));
                manager.remove();
            }
        }
    }

    public void tearDown() throws Exception {
        synchronized (ComponentManagerTestSetup.class) {
            if (--componentManagerInitializationCount == 0) {
                catalog.removeRole(memberRole.getId());
                catalog.removeComponent(summary1.getComponentId());
                catalog.removeComponent(summary2.getComponentId());
                catalog.remove();
            }
        }
        super.tearDown();
    }

}
