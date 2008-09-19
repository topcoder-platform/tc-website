package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDETechnologyTypes;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserMaster;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserTechnologies;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEUserTechnologiesHome;

public final class DDEUserTechnologiesTest extends DDEServerTestCase {

    private LocalDDEUserTechnologiesHome userTechnologiesHome;

    DDEUserTechnologiesTest() {
    }

    protected void setUp() throws NamingException {
        userTechnologiesHome = (LocalDDEUserTechnologiesHome) lookup(LocalDDEUserTechnologiesHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        typicalTest();
        testCreateTwoUserTechnologies();
    }

    private void testCreateTwoUserTechnologies() throws Exception {
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        LocalDDETechnologyTypes technologyTypes1 = DDETechnologyTypesTest.create();
        LocalDDEUserTechnologies userTechnologies1 = userTechnologiesHome.create(1100, 1, userMaster, technologyTypes1);
        userTechnologiesHome.findByPrimaryKey((Long) userTechnologies1.getPrimaryKey());
        LocalDDETechnologyTypes technologyTypes2 = DDETechnologyTypesTest.create();
        LocalDDEUserTechnologies userTechnologies2 = userTechnologiesHome.create(1200, 2, userMaster, technologyTypes2);
        LocalDDEUserMaster userMaster2 = userTechnologies1.getUserMaster();
        assertNotNull("was reset to null?", userMaster2);
        assertTrue(userMaster.isIdentical(userMaster2));
        userTechnologies2.remove();
        userTechnologies1.remove();
        technologyTypes2.remove();
        technologyTypes1.remove();
    }

    private void typicalTest() throws Exception {
        LocalDDEUserMaster userMaster = DDEUserMasterTest.create();
        LocalDDETechnologyTypes technologyTypes = DDETechnologyTypesTest.create();
        int rating = 14;
        int months = 15;
        LocalDDEUserTechnologies userTechnologies = userTechnologiesHome.create(rating, months, userMaster, technologyTypes);
        Long primaryKey = testGetPrimaryKey(userTechnologies);
        testGetUserMaster(userTechnologies, userMaster);
        testGetTechnologyTypes(userTechnologies, technologyTypes);
        testGetRating(userTechnologies, rating);
        testGetMonths(userTechnologies, months);
        testRemove(userTechnologies, technologyTypes, primaryKey);
    }

    private void testGetMonths(LocalDDEUserTechnologies userTechnologies, int months) {
        int months2 = userTechnologies.getMonths();
        assertEquals(months, months2);
    }

    private void testGetRating(LocalDDEUserTechnologies userTechnologies, int rating) {
        int rating2 = userTechnologies.getRating();
        assertEquals(rating, rating2);
    }

    private void testGetTechnologyTypes(LocalDDEUserTechnologies userTechnologies, LocalDDETechnologyTypes technologyTypes) {
        LocalDDETechnologyTypes technologyTypes2 = userTechnologies.getTechnologyTypes();
        assertTrue(technologyTypes.isIdentical(technologyTypes2));
    }

    private void testRemove(LocalDDEUserTechnologies userTechnologies, LocalDDETechnologyTypes technologyTypes,
                            Long primaryKey) throws RemoveException {
        userTechnologies.remove();
        technologyTypes.remove();
        try {
            userTechnologiesHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

    private void testGetUserMaster(LocalDDEUserTechnologies userTechnologies, LocalDDEUserMaster userMaster) {
        LocalDDEUserMaster userMaster2 = userTechnologies.getUserMaster();
        assertTrue(userMaster.isIdentical(userMaster2));
    }

    private Long testGetPrimaryKey(LocalDDEUserTechnologies userTechnologies) throws FinderException {
        Long primaryKey = (Long) userTechnologies.getPrimaryKey();
        LocalDDEUserTechnologies userTechnologies2 = userTechnologiesHome.findByPrimaryKey(primaryKey);
        assertTrue(userTechnologies.isIdentical(userTechnologies2));
        return primaryKey;
    }

}
