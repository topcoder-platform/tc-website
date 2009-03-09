package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDERoles;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDERolesHome;

public final class DDERolesTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "RolesDesc7";
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;
    private static final String NAME = "RolesName18";

    private LocalDDERolesHome rolesHome;

    DDERolesTest() {
    }

    static LocalDDERoles create() throws CreateException {
        try {
            LocalDDERolesHome rolesHome = lookup();
            return rolesHome.create(NAME, DESCRIPTION, STATUS_ID);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        rolesHome = lookup();
    }

    private static LocalDDERolesHome lookup() throws NamingException {
        return (LocalDDERolesHome) lookup(LocalDDERolesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        long status = STATUS_ID;
        LocalDDERoles roles = create();
        Long primaryKey = testGetPrimaryKey(roles);
        testGetDescription(roles, description);
        testGetStatus(roles, status);
        testRemove(roles, primaryKey);
    }

    private void testGetStatus(LocalDDERoles roles, long status) {
        long status2 = roles.getStatusId();
        assertEquals(status, status2);
    }

    private void testGetDescription(LocalDDERoles roles, String description) {
        String description2 = roles.getDescription();
        assertEquals(description, description2);
    }

    private Long testGetPrimaryKey(LocalDDERoles roles) throws FinderException {
        Long primaryKey = (Long) roles.getPrimaryKey();
        LocalDDERoles roles2 = rolesHome.findByPrimaryKey(primaryKey);
        assertTrue(roles.isIdentical(roles2));
        return primaryKey;
    }

    private void testRemove(LocalDDERoles roles, Long primaryKey) throws RemoveException {
        roles.remove();
        try {
            rolesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
