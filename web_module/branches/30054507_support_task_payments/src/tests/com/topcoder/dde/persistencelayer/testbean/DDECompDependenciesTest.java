package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDependencies;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDependenciesHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

public final class DDECompDependenciesTest extends DDEServerTestCase {

    private LocalDDECompDependenciesHome dependenciesHome;

    DDECompDependenciesTest() {
    }

    protected void setUp() throws NamingException {
        dependenciesHome = (LocalDDECompDependenciesHome) lookup(LocalDDECompDependenciesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        LocalDDECompVersions childVersions = DDECompVersionsTest.create(catalog);
        LocalDDECompDependencies dependencies = dependenciesHome.create(versions, childVersions);
        Long primaryKey = testGetPrimaryKey(dependencies);
        getCompVersions(dependencies, versions);
        testGetChildCompVersions(dependencies, childVersions);
        testRemove(dependencies, versions, childVersions, catalog, primaryKey);
    }

    private void testGetChildCompVersions(LocalDDECompDependencies dependencies, LocalDDECompVersions childVersions) {
        LocalDDECompVersions childVersions2 = dependencies.getChildCompVersions();
        assertTrue(childVersions.isIdentical(childVersions2));
    }

    private void getCompVersions(LocalDDECompDependencies dependencies, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = dependencies.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private Long testGetPrimaryKey(LocalDDECompDependencies dependencies) throws FinderException {
        Long primaryKey = (Long) dependencies.getPrimaryKey();
        LocalDDECompDependencies dependencies2 = dependenciesHome.findByPrimaryKey(primaryKey);
        assertTrue(dependencies.isIdentical(dependencies2));
        return primaryKey;
    }

    private void testRemove(LocalDDECompDependencies dependencies, LocalDDECompVersions versions,
                            LocalDDECompVersions childVersions, LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        dependencies.remove();
        versions.remove();
        childVersions.remove();
        catalog.remove();
        try {
            dependenciesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
