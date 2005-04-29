package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompExamples;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompExamplesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

public final class DDECompExamplesTest extends DDEServerTestCase {

    private LocalDDECompExamplesHome examplesHome;

    DDECompExamplesTest() {
    }

    protected void setUp() throws NamingException {
        examplesHome = (LocalDDECompExamplesHome) lookup(LocalDDECompExamplesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        String url = "http://www.someurl.com/";
        String description = "ExamplesDesc4";
        LocalDDECompExamples examples = examplesHome.create(url, description, versions);
        Long primaryKey = testGetPrimaryKey(examples);
        testGetUrl(examples, url);
        testGetDescription(examples, description);
        testGetCompVersions(examples, versions);
        testRemove(examples, versions, catalog, primaryKey);
    }

    private void testGetCompVersions(LocalDDECompExamples examples, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = examples.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private void testGetDescription(LocalDDECompExamples examples, String description) {
        String description2 = examples.getDescription();
        assertEquals(description, description2);
    }

    private void testGetUrl(LocalDDECompExamples examples, String url) {
        String url2 = examples.getUrl();
        assertEquals(url, url2);
    }

    private void testRemove(LocalDDECompExamples examples, LocalDDECompVersions versions, LocalDDECompCatalog catalog,
                            Long primaryKey) throws RemoveException {
        examples.remove();
        versions.remove();
        catalog.remove();
        try {
            examplesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDECompExamples examples) throws FinderException {
        Long primaryKey = (Long) examples.getPrimaryKey();
        LocalDDECompExamples examples2 = examplesHome.findByPrimaryKey(primaryKey);
        assertTrue(examples.isIdentical(examples2));
        return primaryKey;
    }

}
