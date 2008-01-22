package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypesHome;

public final class DDETechnologyTypesTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "TechnologyTypesDesc4";
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;
    private static final String NAME = "TechnologyTypesName16";

    private LocalDDETechnologyTypesHome technologyTypesHome;

    DDETechnologyTypesTest() {
    }

    static LocalDDETechnologyTypes create() throws CreateException {
        try {
            LocalDDETechnologyTypesHome technologyTypesHome = lookup();
            return technologyTypesHome.create(NAME, DESCRIPTION, STATUS_ID);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        technologyTypesHome = lookup();
    }

    private static LocalDDETechnologyTypesHome lookup() throws NamingException {
        return (LocalDDETechnologyTypesHome) lookup(LocalDDETechnologyTypesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        long status = STATUS_ID;
        String name = NAME;
        LocalDDETechnologyTypes technologyTypes = create();
        Long primaryKey = testGetPrimaryKey(technologyTypes);
        testGetDescription(technologyTypes, description);
        testGetStatus(technologyTypes, status);
        testGetName(technologyTypes, name);
        testRemove(technologyTypes, primaryKey);
    }

    private void testGetName(LocalDDETechnologyTypes technologyTypes, String name) {
        String name2 = technologyTypes.getName();
        assertEquals(name, name2);
    }

    private void testGetStatus(LocalDDETechnologyTypes technologyTypes, long status) {
        long status2 = technologyTypes.getStatusId();
        assertEquals(status, status2);
    }

    private void testGetDescription(LocalDDETechnologyTypes technologyTypes, String description) {
        String description2 = technologyTypes.getDescription();
        assertEquals(description, description2);
    }

    private Long testGetPrimaryKey(LocalDDETechnologyTypes technologyTypes) throws FinderException {
        Long primaryKey = (Long) technologyTypes.getPrimaryKey();
        LocalDDETechnologyTypes technologyTypes2 = technologyTypesHome.findByPrimaryKey(primaryKey);
        assertTrue(technologyTypes.isIdentical(technologyTypes2));
        return primaryKey;
    }

    private void testRemove(LocalDDETechnologyTypes technologyTypes, Long primaryKey)
            throws RemoveException {
        technologyTypes.remove();
        try {
            technologyTypesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
