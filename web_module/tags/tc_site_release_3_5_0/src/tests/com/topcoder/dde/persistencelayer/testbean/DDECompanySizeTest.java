package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompanySize;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompanySizeHome;

public final class DDECompanySizeTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "CompanySizeDesc9";

    private LocalDDECompanySizeHome companySizeHome;

    DDECompanySizeTest() {
    }

    static LocalDDECompanySize create() throws CreateException {
        try {
            LocalDDECompanySizeHome companySizeHome = lookup();
            return companySizeHome.create(DESCRIPTION);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        companySizeHome = lookup();
    }

    private static LocalDDECompanySizeHome lookup() throws NamingException {
        return (LocalDDECompanySizeHome) lookup(LocalDDECompanySizeHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        LocalDDECompanySize companySize = create();
        Long primaryKey = testFindByPrimaryKey(companySize);
        testGetDescription(companySize, description);
        testRemove(companySize, primaryKey);
    }

    private Long testFindByPrimaryKey(LocalDDECompanySize companySize) throws FinderException {
        Long primaryKey = (Long) companySize.getPrimaryKey();
        LocalDDECompanySize companySize2 = companySizeHome.findByPrimaryKey(primaryKey);
        assertTrue(companySize.isIdentical(companySize2));
        return primaryKey;
    }

    private void testGetDescription(LocalDDECompanySize companySize, String description) {
        String description2 = companySize.getDescription();
        assertEquals(description, description2);
    }

    private void testRemove(LocalDDECompanySize companySize, Long primaryKey) throws RemoveException {
        companySize.remove();
        try {
            companySizeHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
