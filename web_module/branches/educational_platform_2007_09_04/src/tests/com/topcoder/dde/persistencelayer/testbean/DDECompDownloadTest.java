package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDownload;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDownloadHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

public final class DDECompDownloadTest extends DDEServerTestCase {

    private static final String URL = "http://www.someurl2.com/";
    private static final String DESCRIPTION = "ExamplesDesc6";

    private LocalDDECompDownloadHome compDownloadHome;

    DDECompDownloadTest() {
    }

    static LocalDDECompDownload create(LocalDDECompVersions versions) throws CreateException {
        try {
            LocalDDECompDownloadHome compDownloadHome = lookup();
            return compDownloadHome.create(URL, DESCRIPTION, versions);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        compDownloadHome = lookup();
    }

    private static LocalDDECompDownloadHome lookup() throws NamingException {
        return (LocalDDECompDownloadHome) lookup(LocalDDECompDownloadHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        String url = URL;
        String description = DESCRIPTION;
        LocalDDECompDownload compDownload = create(versions);
        Long primaryKey = testGetPrimaryKey(compDownload);
        testGetUrl(compDownload, url);
        testGetDescription(compDownload, description);
        testGetCompVersions(compDownload, versions);
        testRemove(compDownload, versions, catalog, primaryKey);
    }

    private void testGetCompVersions(LocalDDECompDownload compDownload, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = compDownload.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private void testGetDescription(LocalDDECompDownload compDownload, String description) {
        String description2 = compDownload.getDescription();
        assertEquals(description, description2);
    }

    private void testGetUrl(LocalDDECompDownload compDownload, String url) {
        String url2 = compDownload.getUrl();
        assertEquals(url, url2);
    }

    private void testRemove(LocalDDECompDownload compDownload, LocalDDECompVersions versions, LocalDDECompCatalog catalog,
                            Long primaryKey) throws RemoveException {
        compDownload.remove();
        versions.remove();
        catalog.remove();
        try {
            compDownloadHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDECompDownload compDownload) throws FinderException {
        Long primaryKey = (Long) compDownload.getPrimaryKey();
        LocalDDECompDownload compDownload2 = compDownloadHome.findByPrimaryKey(primaryKey);
        assertTrue(compDownload.isIdentical(compDownload2));
        return primaryKey;
    }

}
