package com.topcoder.dde.persistencelayer.testbean;

import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECategories;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECategoriesHome;

public final class DDECategoriesTest extends DDEServerTestCase {

    private LocalDDECategoriesHome categoriesHome;
    private static final String DESCRIPTION = "CategoriesDesc6";
    private static final Long PARENT_CATEGORY_ID = new Long(5);
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;
    private static final String NAME = "CategoriesName17";

    DDECategoriesTest() {
    }

    static LocalDDECategories create() throws CreateException {
        try {
            LocalDDECategoriesHome categoriesHome = lookup();
            return categoriesHome.create(PARENT_CATEGORY_ID, NAME, DESCRIPTION, STATUS_ID);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        categoriesHome = lookup();
    }

    private static LocalDDECategoriesHome lookup() throws NamingException {
        return (LocalDDECategoriesHome) lookup(LocalDDECategoriesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        Long parentCategoryId = PARENT_CATEGORY_ID;
        String description = DESCRIPTION;
        long status = STATUS_ID;
        String name = NAME;
        LocalDDECategories categories = testCreate();
        Long primaryKey = testGetPrimaryKey(categories);
        testGetDescription(categories, description);
        testGetParentCategoryId(categories, parentCategoryId);
        testGetStatus(categories, status);
        testGetName(categories, name);
        testRemove(categories, primaryKey);
    }

    private void testGetName(LocalDDECategories categories, String name) {
        String name2 = categories.getName();
        assertEquals(name, name2);
    }

    private LocalDDECategories testCreate() throws FinderException, CreateException {
        Collection allExisted = categoriesHome.findAllActive();
        LocalDDECategories categories = create();
        Collection all = categoriesHome.findAllActive();
        assertEquals(allExisted.size(), all.size());
        return categories;
    }

    private void testGetStatus(LocalDDECategories categories, long status) {
        long status2 = categories.getStatusId();
        assertEquals(status, status2);
    }

    private void testGetParentCategoryId(LocalDDECategories categories, Long parentCategoryId) {
        Long parentCategoryId2 = categories.getParentCategoryId();
        assertEquals(parentCategoryId, parentCategoryId2);
    }

    private void testGetDescription(LocalDDECategories categories, String description) {
        String description2 = categories.getDescription();
        assertEquals(description, description2);
    }

    private Long testGetPrimaryKey(LocalDDECategories categories) throws FinderException {
        Long primaryKey = (Long) categories.getPrimaryKey();
        LocalDDECategories categories2 = categoriesHome.findByPrimaryKey(primaryKey);
        assertTrue(categories2.isIdentical(categories2));
        return primaryKey;
    }

    private void testRemove(LocalDDECategories categories, Long primaryKey) throws RemoveException {
        categories.remove();
        try {
            categoriesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
