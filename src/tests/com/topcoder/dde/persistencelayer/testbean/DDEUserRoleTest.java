package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompCatalog;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDERoles;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserRole;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserRoleHome;

public final class DDEUserRoleTest extends DDEServerTestCase {

    private LocalDDEUserRoleHome userRoleHome;

    DDEUserRoleTest() {
    }

    protected void setUp() throws NamingException {
        userRoleHome = (LocalDDEUserRoleHome) lookup(LocalDDEUserRoleHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        LocalDDECompCatalog catalog = DDECompCatalogTest.create();
        LocalDDECompVersions versions = DDECompVersionsTest.create(catalog);
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        int tcsRating = 14;
        LocalDDERoles roles = DDERolesTest.create();
        LocalDDEUserRole userRole = userRoleHome.create(tcsRating, userMaster, versions, roles);
        Long primaryKey = testGetPrimaryKey(userRole);
        testGetCompVersions(userRole, versions);
        testGetUserMaster(userRole, userMaster);
        testGetRoles(userRole, roles);
        testGetTcsRating(userRole, tcsRating);
        testRemove(userRole, roles, versions, catalog, primaryKey);
    }

    private void testGetTcsRating(LocalDDEUserRole userRole, int tcsRating) {
        int tcsRating2 = userRole.getTcsRating();
        assertEquals(tcsRating, tcsRating2);
    }

    private void testGetRoles(LocalDDEUserRole userRole, LocalDDERoles roles) {
        LocalDDERoles roles2 = userRole.getRoles();
        assertTrue(roles.isIdentical(roles2));
    }

    private void testRemove(LocalDDEUserRole userRole, LocalDDERoles roles, LocalDDECompVersions versions,
                            LocalDDECompCatalog catalog, Long primaryKey) throws RemoveException {
        userRole.remove();
        roles.remove();
        versions.remove();
        catalog.remove();
        try {
            userRoleHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testGetUserMaster(LocalDDEUserRole userRole, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = userRole.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private void testGetCompVersions(LocalDDEUserRole userRole, LocalDDECompVersions versions) {
        LocalDDECompVersions versions2 = userRole.getCompVersions();
        assertTrue(versions.isIdentical(versions2));
    }

    private Long testGetPrimaryKey(LocalDDEUserRole userRole) throws FinderException {
        Long primaryKey = (Long) userRole.getPrimaryKey();
        LocalDDEUserRole userRole2 = userRoleHome.findByPrimaryKey(primaryKey);
        assertTrue(userRole.isIdentical(userRole2));
        return primaryKey;
    }

}
