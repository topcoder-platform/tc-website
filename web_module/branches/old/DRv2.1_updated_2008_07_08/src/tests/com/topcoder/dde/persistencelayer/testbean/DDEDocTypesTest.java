package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDocTypes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEDocTypesHome;

public final class DDEDocTypesTest extends DDEServerTestCase {

    static final int DOCUMENT_TYPE_ID = 0;

    private static final String DESCRIPTION = "DocTypesDesc0";
    private static final long STATUS_ID = DDEStatusTest.STATUS_ID;

    private LocalDDEDocTypesHome docTypesHome;

    DDEDocTypesTest() {
    }

    static LocalDDEDocTypes create() throws CreateException {
        try {
            LocalDDEDocTypesHome docTypesHome = lookup();
            return docTypesHome.create(DOCUMENT_TYPE_ID, DESCRIPTION, STATUS_ID);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        docTypesHome = lookup();
    }

    private static LocalDDEDocTypesHome lookup() throws NamingException {
        return (LocalDDEDocTypesHome) lookup(LocalDDEDocTypesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        long status = STATUS_ID;
        LocalDDEDocTypes docTypes;
        try {
            docTypes = docTypesHome.findByPrimaryKey(new Long(DOCUMENT_TYPE_ID));
            docTypes.remove();
        } catch (FinderException e) {
        }
        docTypes = create();
        Long primaryKey = testGetPrimaryKey(docTypes);
        testGetDescription(docTypes, description);
        testGetStatus(docTypes, status);
        testRemove(docTypes, primaryKey);
        create();
    }

    private void testGetStatus(LocalDDEDocTypes docTypes, long status) {
        long status2 = docTypes.getStatusId();
        assertEquals(status, status2);
    }

    private void testGetDescription(LocalDDEDocTypes docTypes, String description) {
        String description2 = docTypes.getDescription();
        assertEquals(description, description2);
    }

    private Long testGetPrimaryKey(LocalDDEDocTypes docTypes) throws FinderException {
        Long primaryKey = (Long) docTypes.getPrimaryKey();
        LocalDDEDocTypes docTypes2 = docTypesHome.findByPrimaryKey(primaryKey);
        assertTrue(docTypes.isIdentical(docTypes2));
        return primaryKey;
    }

    private void testRemove(LocalDDEDocTypes docTypes, Long primaryKey) throws RemoveException {
        docTypes.remove();
        try {
            docTypesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
