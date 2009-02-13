package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECountryCodes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDECountryCodesHome;

public final class DDECountryCodesTest extends DDEServerTestCase {

    private static final String DESCRIPTION = "CountryCodesDesc8";

    private LocalDDECountryCodesHome countryCodesHome;

    DDECountryCodesTest() {
    }

    static LocalDDECountryCodes create() throws CreateException {
        try {
            LocalDDECountryCodesHome countryCodesHome = lookup();
            return countryCodesHome.create(DESCRIPTION);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        countryCodesHome = lookup();
    }

    private static LocalDDECountryCodesHome lookup() throws NamingException {
        return (LocalDDECountryCodesHome) lookup(LocalDDECountryCodesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        String description = DESCRIPTION;
        LocalDDECountryCodes countryCodes = create();
        Long primaryKey = testFindByPrimaryKey(countryCodes);
        testGetDescription(countryCodes, description);
        testRemove(countryCodes, primaryKey);
    }

    private Long testFindByPrimaryKey(LocalDDECountryCodes countryCodes) throws FinderException {
        Long primaryKey = (Long) countryCodes.getPrimaryKey();
        LocalDDECountryCodes countryCodes2 = countryCodesHome.findByPrimaryKey(primaryKey);
        assertTrue(countryCodes.isIdentical(countryCodes2));
        return primaryKey;
    }

    private void testGetDescription(LocalDDECountryCodes countryCodes, String description) {
        String description2 = countryCodes.getDescription();
        assertEquals(description, description2);
    }

    private void testRemove(LocalDDECountryCodes countryCodes, Long primaryKey) throws RemoveException {
        countryCodes.remove();
        try {
            countryCodesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
