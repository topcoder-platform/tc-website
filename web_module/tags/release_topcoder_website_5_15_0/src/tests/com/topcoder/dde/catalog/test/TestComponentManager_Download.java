/*
 * TestComponentManager_Download.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.Download;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Download management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Download
        extends RemoteComponentManagerTestCase {

    protected Download download;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Download(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        download = new Download("Test Download #" + idGen.nextId(),
                "http://test.com/dl");
    }

    /**
     * tests the normal functioning of the addDownload method
     */
    synchronized public void testAddDownload() throws Exception {
        Download dl = manager1.addDownload(download);
        Iterator it = manager1.getDownloads().iterator();
        try {
            assertEquals("Download not added correctly", download, it.next());
        } finally {
            manager1.removeDownload(dl.getId());
        }
    }

    /**
     * tests the functioning of the addDownload method when a download matching
     * the argument already exists
     */
/*
 * Objecting to this case is not required
 *
    synchronized public void testAddDownload_Exists() throws Exception {
        Download dl = manager1.addDownload(download);
        try {
            manager1.addDownload(download);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager1.removeDownload(dl.getId());
        }
    }
 */

    /**
     * tests the functioning of the addDownload method when the argument is
     * <code>null</code>
     */
    public void testAddDownload_Null() throws Exception {
        try {
            manager1.addDownload(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /*
     * getDownloads tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeDownload method
     */
    synchronized public void testRemoveDownload() throws Exception {
        Download dl = manager1.addDownload(download);
        Collection downloads;

        manager1.removeDownload(dl.getId());
        downloads = manager1.getDownloads();

        assertTrue("Download not removed", !downloads.contains(download));
    }

    /**
     * tests the functioning of the removeDownload method when no download
     * matching the argument exists
     */
    public void testRemoveDownload_Missing() throws Exception {
        try {
            manager1.removeDownload(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeDownload method when the download
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveDownload_NotOwned() throws Exception {
        Download dl = manager2.addDownload(download);
        try {
            manager1.removeDownload(dl.getId());
        } catch (Exception e) {
            manager2.removeDownload(dl.getId());
            throw e;
        }
    }

    /**
     * tests the normal functioning of the updateDownload method
     */
    synchronized public void testUpdateDownload() throws Exception {
        Download dl = manager1.addDownload(download);
        Download dl2 = new Download(dl.getDescription(), dl.getURL());
        Collection downloads;

        try {
            dl.setURL("https://test.com/download/dl");
            manager1.updateDownload(dl);
            downloads = manager1.getDownloads();
            assertTrue("Download not updated on the server",
                    downloads.contains(dl));
            assertTrue("Download duplicated, not updated",
                    !downloads.contains(dl2));
        } finally {
            manager1.removeDownload(dl.getId());
        }
    }

    /**
     * tests the functioning of the updateDownload method when the argument is
     * <code>null</code>
     */
    public void testUpdateDownload_Null() throws Exception {
        try {
            manager1.updateDownload(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateDownload method when no download
     * matching the argument exists
     */
    public void testUpdateDownload_Missing() throws Exception {
        try {
            manager1.updateDownload(download);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateDownload method when the download
     * matching the argument is not associated with the component being managed
     */
/*
 * Not a valid test -- the behavior tested for is not required or expected
 *
    synchronized public void testUpdateDownload_NotOwned() throws Exception {
        Download dl = manager2.addDownload(download);
        try {
            manager1.updateDownload(dl);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager2.removeDownload(dl.getId());
        }
    }
 */

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Download.class));
    }

}