/*
 * TestComponentManager.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.*;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

public class TestComponentManager extends RemoteComponentManagerTestCase {

    protected Catalog catalog;

    public TestComponentManager(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalog = catalogHome.create();
    }

    public void tearDown() throws Exception {
        catalog.remove();
        super.tearDown();
    }

    public void testCanDownload() throws Exception {
        /* need to know how to set up the test fixture */
    }

    public void testCanDownload_Null() throws Exception {
        try {
            manager1.canDownload(null);
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testCreateNewVersion() throws Exception {
        ComponentVersionInfo vinfo2 = manager2.getVersionInfo();
        ComponentVersionInfo vinfo3 = manager3.getVersionInfo();
        Iterator roleIterator = manager3.getTeamMemberRoles().iterator();
        boolean foundRole = false;

        assertEquals("Version comments incorrect", "new version time",
                vinfo3.getComments());
        assertEquals("Version label incorrect", "Version 867.53.09",
                vinfo3.getVersionLabel());
        assertEquals("Incorrect phase", ComponentVersionInfo.COLLABORATION,
                vinfo3.getPhase());
        assertEquals("Wrong price", 0d, vinfo3.getPrice(), 0d);
        assertEquals("Wrong version number", vinfo2.getVersion() + 1,
                vinfo3.getVersion());
        assertEquals("Wrong forum is active",
                manager3.getForum(Forum.COLLABORATION),
                manager2.getActiveForum(Forum.COLLABORATION));
        while (roleIterator.hasNext()) {
            TeamMemberRole role = (TeamMemberRole) roleIterator.next();
            if (role.getRoleName().equals("REQUESTOR")) {
                assertEquals("Wrong Requestor userid", defaultUser.getId(),
                        role.getUserId());
                foundRole = true;
                break;
            }
        }
        assertTrue("No Requestor", foundRole);
    }

    public void testCreateNewVersion_Null() throws Exception {
        try {
            manager1.createNewVersion(null);
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    synchronized public void testGetActiveForum() throws Exception {
        /* partially tested in testCreateNewVersion */
/*
 * incorrect expectation
        assertNull("Forum not expected",
                   manager1.getActiveForum(Forum.COLLABORATION));
 */
        assertNull("Valid forum not expected",
                manager2.getActiveForum(Forum.SPECIFICATION));
        assertEquals("Different versions return different forums",
                manager2.getActiveForum(Forum.COLLABORATION),
                manager3.getActiveForum(Forum.COLLABORATION));
    }

    public void testGetActiveForum_Invalid() throws Exception {
        assertNull(manager1.getActiveForum(-1));
    }

    public void testGetAllVersionInfo() throws Exception {
        Collection col = manager2.getAllVersionInfo();
        assertEquals("Different versions report different infos", col,
                manager3.getAllVersionInfo());
        assertEquals("Wrong number of version infos", 2, col.size());
        assertTrue("Missing a version info",
                col.contains(manager2.getVersionInfo()));
        assertTrue("Missing a version info",
                col.contains(manager3.getVersionInfo()));
        col = manager1.getAllVersionInfo();
        assertEquals("Wrong number of version infos", 1, col.size());
        assertTrue("Missing a version info",
                col.contains(manager1.getVersionInfo()));
    }

    public void testGetClosedForums() throws Exception {
        Collection col = manager2.getClosedForums(Forum.COLLABORATION);
        assertEquals("Different versions report different forums", col,
                manager3.getClosedForums(Forum.COLLABORATION));
        assertEquals("Wrong number of forums", 1, col.size());
        assertTrue("Missing a forum",
                col.contains(manager2.getForum(Forum.COLLABORATION)));
        col = manager1.getClosedForums(Forum.SPECIFICATION);
        assertEquals("Wrong number of version infos", 0, col.size());
    }

/*
 *  Tested implicitly in several other places
 *
 *  public void testGetComponentInfo() throws Exception {
 *  }
 */
    public void testGetForum_Invalid() throws Exception {
        assertNull(manager1.getForum(-1));
    }

    public void testGetNumVersions() throws Exception {
        assertEquals("Wrong number of versions", 1, manager1.getNumVersions());
        assertEquals("Wrong number of versions", 2, manager2.getNumVersions());
        assertEquals("Wrong number of versions", 2, manager3.getNumVersions());
    }

/*
 *  Tested implicitly in several other places
 *
 *  public void testGetVersionInfo() throws Exception {
 *  }
 */

    public void testSetVersion() throws Exception {
        manager2.setVersion(newVersionNumber);
        assertEquals("Version not set correctly", manager3.getVersionInfo(),
                manager2.getVersionInfo());
    }

    public void testSetVersion_Invalid() throws Exception {
        try {
            manager1.setVersion(idGen.nextId());
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testTrackDownload() throws Exception {
        manager2.trackDownload(defaultUser.getId(), defaultDownload.getId(),
                defaultLevel.getId());
        /* test succeeds if no exception is thrown */
    }

    public void testTrackDownload_BadUser() throws Exception {
        try {
            manager2.trackDownload(idGen.nextId(), defaultDownload.getId(),
                    defaultLevel.getId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testTrackDownload_BadDownload() throws Exception {
        try {
            manager2.trackDownload(defaultUser.getId(), idGen.nextId(),
                    defaultLevel.getId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testTrackDownload_BadLicense() throws Exception {
        try {
            manager2.trackDownload(defaultUser.getId(), defaultDownload.getId(),
                    idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    synchronized public void testUpdateComponentInfo() throws Exception {
        /* partially tested in other tests */
        ComponentInfo info = manager1.getComponentInfo();
        ComponentInfo savedInfo = manager1.getComponentInfo();
        Iterator searchIterator = catalog.search("rutabagas", null).iterator();
        boolean found;

        while (searchIterator.hasNext()) {
            assertTrue(!summary1.equals(searchIterator.next()));
        }
        info.setDescription(
                "It's like giant dancing rutabagas in the back seat of a Porsche 911 Turbo --");
        info.setFunctionalDescription(
                "it gets you a night in the drunk tank");
        info.setName("Hallucinogen");
        info.setShortDescription("rutabagas.  right.");
        info.setStatus(ComponentInfo.APPROVED);
        manager1.updateComponentInfo(info);
        assertEquals("Component info not updated correctly", info,
                manager1.getComponentInfo());

        searchIterator = catalog.search("rutabagas", null).iterator();
        found = false;
        while (searchIterator.hasNext()) {
            if (summary1.equals(searchIterator.next())) {
                found = true;
                break;
            }
        }

        manager1.updateComponentInfo(savedInfo);
    }

    public void testUpdateComponentInfo_Null() throws Exception {
        try {
            manager1.updateComponentInfo(null);
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateComponentInfo_Invalid() throws Exception {
        try {
            manager1.updateComponentInfo(manager2.getComponentInfo());
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    synchronized public void testUpdateVersionInfo() throws Exception {
        /* partially tested in other tests */
        ComponentVersionInfo info = manager1.getVersionInfo();
        ComponentVersionInfo savedInfo = manager1.getVersionInfo();

        info.setComments(
                "This is the version that rocks, not the one that sucks rocks.");
        info.setPrice(75000d);
        info.setVersionLabel("Rocker 1.7236.67");
        manager1.updateVersionInfo(info);
        assertEquals("Info not updated correctly", info,
                manager1.getVersionInfo());

        manager1.updateVersionInfo(savedInfo);
    }

    public void testUpdateVersionInfo_Null() throws Exception {
        try {
            manager1.updateVersionInfo(null);
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public void testUpdateVersionInfo_Invalid() throws Exception {
        try {
            manager1.updateVersionInfo(manager2.getVersionInfo());
            fail("expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager.class));
    }

}
