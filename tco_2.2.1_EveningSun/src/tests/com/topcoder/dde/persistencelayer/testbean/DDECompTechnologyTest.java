package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompTechnology;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompTechnologyHome;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypes;

public final class DDECompTechnologyTest extends DDEServerTestCase {

    private LocalDDECompTechnologyHome technologyHome;

    DDECompTechnologyTest() {
    }

    protected void setUp() throws NamingException {
        technologyHome = (LocalDDECompTechnologyHome) lookup(LocalDDECompTechnologyHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        LocalDDETechnologyTypes technologyTypes = DDETechnologyTypesTest.create();
        LocalDDECompTechnology technology = technologyHome.create(versions, technologyTypes);
        Long primaryKey = testGetPrimaryKey(technology);
        testGetCompVersions(technology, versions);
        testGetTechnologyTypes(technology, technologyTypes);
        testRemove(technology, technologyTypes, versions, catalog, primaryKey);
    }

    private void testGetTechnologyTypes(LocalDDECompTechnology technology, LocalDDETechnologyTypes technologyTypes) {
        LocalDDETechnologyTypes technologyTypes2 = technology.getTechnologyTypes();
        assertTrue(technologyTypes.isIdentical(technologyTypes2));
    }

    private void testGetCompVersions(LocalDDECompTechnology technology, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = technology.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private Long testGetPrimaryKey(LocalDDECompTechnology technology) throws FinderException {
        Long primaryKey = (Long) technology.getPrimaryKey();
        LocalDDECompTechnology technology2 = technologyHome.findByPrimaryKey(primaryKey);
        assertTrue(technology.isIdentical(technology2));
        return primaryKey;
    }

    private void testRemove(LocalDDECompTechnology technology, LocalDDETechnologyTypes technologyTypes,
                            LocalDDECompVersions versions, LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        technology.remove();
        technologyTypes.remove();
        versions.remove();
        catalog.remove();
        try {
            technologyHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
