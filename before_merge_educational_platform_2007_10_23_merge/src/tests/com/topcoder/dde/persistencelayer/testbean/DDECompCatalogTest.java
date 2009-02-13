package com.topcoder.dde.persistencelayer.testbean;

import java.sql.Timestamp;
import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalogHome;

public final class DDECompCatalogTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "CompCatalogDesc1";
    private static final int CURRENT_VERSION = 1;
    private static final Timestamp CREATE_TIME = currentTimestamp();
    private static final String COMPONENT_NAME = "CompCatalogComponentName15";
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;
    private static final String SHORT_DESC = "CompCatalogShortDesc16";
    private static final String FUNCTION_DESC = "CompCatalogFunctionDesc17";

    private LocalDDECompCatalogHome catalogHome;

    DDECompCatalogTest() {
    }

    static LocalDDECompCatalog create() throws CreateException {
        try {
            LocalDDECompCatalogHome catalogHome = lookup();
            return catalogHome.create(CURRENT_VERSION, COMPONENT_NAME, DESCRIPTION, CREATE_TIME, STATUS_ID, SHORT_DESC,
                    FUNCTION_DESC, 0);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        catalogHome = lookup();
    }

    private static LocalDDECompCatalogHome lookup() throws NamingException {
        return (LocalDDECompCatalogHome) lookup(LocalDDECompCatalogHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        long currentVersion = CURRENT_VERSION;
        Timestamp createTime = CREATE_TIME;
        String componentName = COMPONENT_NAME;
        String shortDesc = SHORT_DESC;
        String functionDesc = FUNCTION_DESC;
        long status = STATUS_ID;
        LocalDDECompCatalog catalog = testCreate();
        Long primaryKey = testGetPrimaryKey(catalog);
        testFindByCurrentVersion(currentVersion);
        testGetDescription(catalog, description);
        testGetCurrentVersion(catalog, currentVersion);
        testGetComponentName(catalog, componentName);
        testGetCreateTime(catalog, createTime);
        testGetStatusId(catalog, status);
        testGetShortDesc(catalog, shortDesc);
        testGetFunctionDesc(catalog, functionDesc);
        testRemove(catalog, primaryKey);
    }

    private void testGetFunctionDesc(LocalDDECompCatalog catalog, String functionDesc) {
        String functionDesc2 = catalog.getFunctionDesc();
        assertEquals(functionDesc, functionDesc2);
    }

    private void testGetShortDesc(LocalDDECompCatalog catalog, String shortDesc) {
        String shortDesc2 = catalog.getShortDesc();
        assertEquals(shortDesc, shortDesc2);
    }

    private void testGetComponentName(LocalDDECompCatalog catalog, String componentName) {
        String componentName2 = catalog.getComponentName();
        assertEquals(componentName, componentName2);
    }

    private void testGetStatusId(LocalDDECompCatalog catalog, long status) {
        long status2 = catalog.getStatusId();
        assertEquals(status, status2);
    }

    private void testGetCreateTime(LocalDDECompCatalog catalog, Timestamp createTime) {
        Timestamp createTime2 = catalog.getCreateTime();
        assertEquals(createTime, createTime2);
    }

    private void testGetCurrentVersion(LocalDDECompCatalog catalog, long currentVersion) {
        long currentVersion2 = catalog.getCurrentVersion();
        assertEquals(currentVersion, currentVersion2);
    }


    private LocalDDECompCatalog testCreate() throws Exception {
        Collection allExisted = catalogHome.findByStatusId(STATUS_ID);
        LocalDDECompCatalog catalog = create();
        Collection all = catalogHome.findByStatusId(STATUS_ID);
        assertEquals(allExisted.size() + 1, all.size());
        return catalog;
    }


    private void testFindByCurrentVersion(long currentVersion) throws FinderException {
        Collection collection = catalogHome.findByCurrentVersionActive(currentVersion);
        assertTrue(collection.size() == 0);
    }

    private void testGetDescription(LocalDDECompCatalog catalog, String description) {
        String description2 = catalog.getDescription();
        assertEquals(description, description2);
    }

    private void testRemove(LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        catalog.remove();
        try {
            catalogHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private Long testGetPrimaryKey(LocalDDECompCatalog catalog) throws FinderException {
        Long primaryKey = (Long) catalog.getPrimaryKey();
        LocalDDECompCatalog status2 = catalogHome.findByPrimaryKey(primaryKey);
        assertTrue(catalog.isIdentical(status2));
        return primaryKey;
    }

}
