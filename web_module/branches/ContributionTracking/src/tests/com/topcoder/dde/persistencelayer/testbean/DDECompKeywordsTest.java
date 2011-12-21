package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompKeywords;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompKeywordsHome;

public final class DDECompKeywordsTest extends DDEServerTestCase {

    private LocalDDECompKeywordsHome keywordsHome;

    DDECompKeywordsTest() {
    }

    protected void setUp() throws NamingException {
        keywordsHome = (LocalDDECompKeywordsHome) lookup(LocalDDECompKeywordsHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String keyword = "Keyword1";
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompKeywords keywords = keywordsHome.create(keyword, catalog);
        Long primaryKey = testGetPrimaryKey(keywords);
        testGetKeyword(keywords, keyword);
        testGetCompCatalog(keywords, catalog);
        testRemove(keywords, catalog, primaryKey);
    }

    private void testGetCompCatalog(LocalDDECompKeywords keywords, LocalDDECompCatalog catalog) {
        LocalDDECompCatalog catalog2 = keywords.getCompCatalog();
        assertTrue(catalog.isIdentical(catalog2));
    }

    private void testGetKeyword(LocalDDECompKeywords keywords, String keyword) {
        String keyword2 = keywords.getKeyword();
        assertEquals(keyword, keyword2);
    }

    private void testRemove(LocalDDECompKeywords keywords, LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        keywords.remove();
        catalog.remove();
        try {
            keywordsHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDECompKeywords keywords) throws FinderException {
        Long primaryKey = (Long) keywords.getPrimaryKey();
        LocalDDECompKeywords keywords2 = keywordsHome.findByPrimaryKey(primaryKey);
        assertTrue(keywords.isIdentical(keywords2));
        return primaryKey;
    }

}
