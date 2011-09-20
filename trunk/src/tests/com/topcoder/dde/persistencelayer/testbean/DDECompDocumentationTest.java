package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDocumentation;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDocumentationHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

public final class DDECompDocumentationTest extends DDEServerTestCase {

    private static final String DOCUMENT_NAME = "CompDocumentationName16";
    private static final String URL = "http://www.someurl.com/";
    private static final int DOCUMENT_TYPE_ID = DDEDocTypesTest.DOCUMENT_TYPE_ID;

    private LocalDDECompDocumentationHome documentationHome;

    DDECompDocumentationTest() {
    }

    static LocalDDECompDocumentation create(LocalDDECompVersions versions) throws CreateException {
        try {
            LocalDDECompDocumentationHome documentationHome = lookup();
            return documentationHome.create(DOCUMENT_TYPE_ID, DOCUMENT_NAME, URL, versions);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        documentationHome = lookup();
    }

    private static LocalDDECompDocumentationHome lookup() throws NamingException {
        return (LocalDDECompDocumentationHome) lookup(LocalDDECompDocumentationHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        String documentName = DOCUMENT_NAME;
        String url = URL;
        long docTypes = DOCUMENT_TYPE_ID;
        LocalDDECompDocumentation documentation = create(versions);
        Long primaryKey = testGetPrimaryKey(documentation);
        testGetDocumentName(documentation, documentName);
        testGetUrl(documentation, url);
        testGetCompVersions(documentation, versions);
        testGetDocTypes(documentation, docTypes);
        testRemove(documentation, versions, catalog, primaryKey);
    }

    private void testGetDocumentName(LocalDDECompDocumentation documentation, String documentName) {
        String documentName2 = documentation.getDocumentName();
        assertEquals(documentName, documentName2);
    }

    private void testGetDocTypes(LocalDDECompDocumentation documentation, long docTypes) {
        long docTypes2 = documentation.getDocumentTypeId();
        assertEquals(docTypes, docTypes2);
    }

    private void testGetCompVersions(LocalDDECompDocumentation documentation, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = documentation.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private void testGetUrl(LocalDDECompDocumentation documentation, String url) {
        String url2 = documentation.getUrl();
        assertEquals(url, url2);
    }

    private Long testGetPrimaryKey(LocalDDECompDocumentation documentation) throws FinderException {
        Long primaryKey = (Long) documentation.getPrimaryKey();
        LocalDDECompDocumentation documentation2 = documentationHome.findByPrimaryKey(primaryKey);
        assertTrue(documentation.isIdentical(documentation2));
        return primaryKey;
    }

    private void testRemove(LocalDDECompDocumentation documentation, LocalDDECompVersions versions, LocalDDECompCatalog catalog,
                            Long primaryKey) throws RemoveException {
        documentation.remove();
        versions.remove();
        catalog.remove();
        try {
            documentationHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
