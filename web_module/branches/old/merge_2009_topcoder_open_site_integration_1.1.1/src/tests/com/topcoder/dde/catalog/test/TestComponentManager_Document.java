/*
 * TestComponentManager_Document.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.CatalogException;
import com.topcoder.dde.catalog.Document;

import java.util.Collection;
import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * a JUnit test case that exercises the Document management methods of the
 * ComponentManager EJB
 *
 * @author John C. Bollinger
 * @version 1.0
 */
public class TestComponentManager_Document
        extends RemoteComponentManagerTestCase {

    protected Document document;

    /**
     * constructs a new instance configured to run the named test
     *
     * @param  testName a <code>String</code> containing the name of the test
     *         to run
     */
    public TestComponentManager_Document(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        document = new Document("Test Document #" + idGen.nextId(),
                "http://test.com/doc", Document.OTHER);
    }

    /**
     * tests the normal functioning of the addDocument method
     */
    synchronized public void testAddDocument() throws Exception {
        Document doc = manager1.addDocument(document);
        Iterator it = manager1.getDocuments().iterator();
        try {
            assertEquals("Document not added correctly", document, it.next());
        } finally {
            manager1.removeDocument(doc.getId());
        }
    }

    /**
     * tests the functioning of the addDocument method when a document matching
     * the argument already exists
     */
/*
 * Objecting to this case is not required
 *
    synchronized public void testAddDocument_Exists() throws Exception {
        Document doc = manager1.addDocument(document);
        try {
            manager1.addDocument(document);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager1.removeDocument(doc.getId());
        }
    }
 */

    /**
     * tests the functioning of the addDocument method when the argument is
     * <code>null</code>
     */
    public void testAddDocument_Null() throws Exception {
        try {
            manager1.addDocument(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /*
     * getDocuments tested implicitly throughout this test case
     */

    /**
     * tests the normal functioning of the removeDocument method
     */
    synchronized public void testRemoveDocument() throws Exception {
        Document doc = manager1.addDocument(document);
        Collection documents;

        manager1.removeDocument(doc.getId());
        documents = manager1.getDocuments();

        assertTrue("Document not removed", !documents.contains(document));
    }

    /**
     * tests the functioning of the removeDocument method when no document
     * matching the argument exists
     */
    public void testRemoveDocument_Missing() throws Exception {
        try {
            manager1.removeDocument(idGen.nextId());
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the removeDocument method when the document
     * matching the argument is not associated with the component being managed
     */
    synchronized public void testRemoveDocument_NotOwned() throws Exception {
        Document doc = manager2.addDocument(document);
        try {
            manager1.removeDocument(doc.getId());
        } catch (Exception e) {
            manager2.removeDocument(doc.getId());
            throw e;
        }
    }

    /**
     * tests the normal functioning of the updateDocument method
     */
    synchronized public void testUpdateDocument() throws Exception {
        Document doc = manager1.addDocument(document);
        Document doc2 = new Document(doc.getName(), doc.getURL(), doc.getType());
        Collection documents;

        try {
            doc.setURL("https://test.com/docs/doc");
            manager1.updateDocument(doc);
            documents = manager1.getDocuments();
            assertTrue("Document not updated on the server",
                    documents.contains(doc));
            assertTrue("Document duplicated, not updated",
                    !documents.contains(doc2));
        } finally {
            manager1.removeDocument(doc.getId());
        }
    }

    /**
     * tests the functioning of the updateDocument method when the argument is
     * <code>null</code>
     */
    public void testUpdateDocument_Null() throws Exception {
        try {
            manager1.updateDocument(null);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateDocument method when no document
     * matching the argument exists
     */
    public void testUpdateDocument_Missing() throws Exception {
        try {
            manager1.updateDocument(document);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            /* the expected case */
        }
    }

    /**
     * tests the functioning of the updateDocument method when the document
     * matching the argument is not associated with the component being managed
     */
/*
 * Not a valid test -- this behavior is not required or expected
 *
    synchronized public void testUpdateDocument_NotOwned() throws Exception {
        Document doc = manager2.addDocument(document);
        try {
            manager1.updateDocument(doc);
            fail("Expected a CatalogException");
        } catch (CatalogException ce) {
            // the expected case
        } finally {
            manager2.removeDocument(doc.getId());
        }
    }
 */

    public static Test suite() {
        return new ComponentManagerTestSetup(new TestSuite(TestComponentManager_Document.class));
    }

}