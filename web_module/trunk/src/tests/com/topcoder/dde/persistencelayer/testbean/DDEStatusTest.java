package com.topcoder.dde.persistencelayer.testbean;

import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEStatus;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEStatusHome;

public final class DDEStatusTest extends DDEServerTestCase {

    static final long STATUS_ID = 0;

    private static final String DESCRIPTION = "DELETED";

    private LocalDDEStatusHome statusHome;

    DDEStatusTest() {
    }

    private static LocalDDEStatus create() throws CreateException {
        try {
            LocalDDEStatusHome statusHome = lookup();
            return statusHome.create(STATUS_ID, DESCRIPTION);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        statusHome = lookup();
    }

    private static LocalDDEStatusHome lookup() throws NamingException {
        return (LocalDDEStatusHome) lookup(LocalDDEStatusHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        LocalDDEStatus status;
        try {
            status = statusHome.findByPrimaryKey(new Long(STATUS_ID));
        } catch (FinderException e) {
            status = testCreate();
        }
        testFindByPrimaryKey(status);
        testSetDescription(status);
        testFindByDescription(description);
        testGetDescription(status, description);
    }

    private LocalDDEStatus testCreate() throws Exception {
        Collection allExisted = statusHome.findAll();
        LocalDDEStatus status = create();
        Collection all = statusHome.findAll();
        assertEquals(allExisted.size() + 1, all.size());
        return status;
    }

    private Long testFindByPrimaryKey(LocalDDEStatus status) throws FinderException {
        Long primaryKey = (Long) status.getPrimaryKey();
        LocalDDEStatus status2 = statusHome.findByPrimaryKey(primaryKey);
        assertTrue(status.isIdentical(status2));
        return primaryKey;
    }

    private void testFindByDescription(String description) throws FinderException {
        Collection collection = statusHome.findByDescription(description);
        assertTrue(collection.size() > 0);
    }

    private void testGetDescription(LocalDDEStatus status, String description) {
        String description2 = status.getDescription();
        assertEquals(description, description2);
    }

    private void testSetDescription(LocalDDEStatus status) {
        String description2 = DESCRIPTION;
        status.setDescription(description2);
        testGetDescription(status, description2);
    }

}
