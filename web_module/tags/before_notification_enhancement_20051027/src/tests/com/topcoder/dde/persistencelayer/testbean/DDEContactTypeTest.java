package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEContactType;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEContactTypeHome;

public final class DDEContactTypeTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "ContactTypeDesc8";
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;

    private LocalDDEContactTypeHome contactTypeHome;

    DDEContactTypeTest() {
    }

    static LocalDDEContactType create() throws CreateException {
        try {
            LocalDDEContactTypeHome contactTypeHome = lookup();
            return contactTypeHome.create(DESCRIPTION, STATUS_ID);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        contactTypeHome = lookup();
    }

    private static LocalDDEContactTypeHome lookup() throws NamingException {
        return (LocalDDEContactTypeHome) lookup(LocalDDEContactTypeHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        long status = STATUS_ID;
        LocalDDEContactType contactType = create();
        Long primaryKey = testGetPrimaryKey(contactType);
        testGetDescription(contactType, description);
        testGetStatus(contactType, status);
        testRemove(contactType, primaryKey);
    }

    private void testGetStatus(LocalDDEContactType contactType, long status) {
        long status2 = contactType.getStatusId();
        assertEquals(status, status2);
    }

    private void testGetDescription(LocalDDEContactType contactType, String description) {
        String description2 = contactType.getDescription();
        assertEquals(description, description2);
    }

    private Long testGetPrimaryKey(LocalDDEContactType contactType) throws FinderException {
        Long primaryKey = (Long) contactType.getPrimaryKey();
        LocalDDEContactType contactType2 = contactTypeHome.findByPrimaryKey(primaryKey);
        assertTrue(contactType.isIdentical(contactType2));
        return primaryKey;
    }

    private void testRemove(LocalDDEContactType contactType, Long primaryKey) throws RemoveException {
        contactType.remove();
        try {
            contactTypeHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
