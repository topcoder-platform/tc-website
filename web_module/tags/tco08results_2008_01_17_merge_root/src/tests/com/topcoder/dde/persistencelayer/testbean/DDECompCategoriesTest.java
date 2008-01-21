package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECategories;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCategories;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCategoriesHome;

public final class DDECompCategoriesTest extends DDEServerTestCase {

    private LocalDDECompCategoriesHome compCategoriesHome;

    DDECompCategoriesTest() {
    }

    protected void setUp() throws NamingException {
        compCategoriesHome = (LocalDDECompCategoriesHome) lookup(LocalDDECompCategoriesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECategories categories = DDECategoriesTest.create();
        LocalDDECompCategories compCategories = compCategoriesHome.create(catalog, categories);
        Long primaryKey = testGetPrimaryKey(compCategories);
        testGetCompCatalog(compCategories, catalog);
        testGetCategories(compCategories, categories);
        testRemove(compCategories, categories, catalog, primaryKey);
    }

    private void testGetCategories(LocalDDECompCategories compCategories, LocalDDECategories categories) {
        LocalDDECategories categories2 = compCategories.getCategories();
        assertTrue(categories.isIdentical(categories2));
    }

    private void testGetCompCatalog(LocalDDECompCategories compCategories, LocalDDECompCatalog catalog) {
        LocalDDECompCatalog catalog2 = compCategories.getCompCatalog();
        assertTrue(catalog.isIdentical(catalog2));
    }

    private Long testGetPrimaryKey(LocalDDECompCategories compCategories) throws FinderException {
        Long primaryKey = (Long) compCategories.getPrimaryKey();
        LocalDDECompCategories compCategories2 = compCategoriesHome.findByPrimaryKey(primaryKey);
        assertTrue(compCategories.isIdentical(compCategories2));
        return primaryKey;
    }

    private void testRemove(LocalDDECompCategories compCategories, LocalDDECategories categories, LocalDDECompCatalog catalog,
                            Long primaryKey) throws RemoveException {
        compCategories.remove();
        categories.remove();
        catalog.remove();
        try {
            compCategoriesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
