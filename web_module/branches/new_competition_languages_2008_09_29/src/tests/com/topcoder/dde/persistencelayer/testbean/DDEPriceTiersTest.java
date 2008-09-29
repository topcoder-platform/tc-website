package com.topcoder.dde.persistencelayer.testbean;

import java.util.Collection;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.naming.NamingException;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPriceTiers;
import com.topcoder.dde.persistencelayer.interfaces.LocalDDEPriceTiersHome;

public final class DDEPriceTiersTest extends DDEServerTestCase {

    private static final double DISCOUNT_PERCENT = 5.34;

    private LocalDDEPriceTiersHome priceTiersHome;

    DDEPriceTiersTest() {
    }

    static LocalDDEPriceTiers create() throws CreateException {
        try {
            LocalDDEPriceTiersHome priceTiersHome = lookup();
            return priceTiersHome.create(DISCOUNT_PERCENT);
        } catch (NamingException e) {
            throw new CreateException("" + e);
        }
    }

    protected void setUp() throws NamingException {
        priceTiersHome = lookup();
    }

    private static LocalDDEPriceTiersHome lookup() throws NamingException {
        return (LocalDDEPriceTiersHome) lookup(LocalDDEPriceTiersHome.EJB_REF_NAME);
    }

    public void test() throws Exception {
        double discountPercent = DISCOUNT_PERCENT;
        LocalDDEPriceTiers priceTiers = testCreate();
        Long primaryKey = testFindByPrimaryKey(priceTiers);
        testGetDiscountPercent(priceTiers, discountPercent);
        testRemove(priceTiers, primaryKey);
    }

    private LocalDDEPriceTiers testCreate() throws FinderException, CreateException {
        Collection allExisted = priceTiersHome.findAll();
        LocalDDEPriceTiers priceTiers = create();
        Collection all = priceTiersHome.findAll();
        assertEquals(allExisted.size() + 1, all.size());
        return priceTiers;
    }

    private Long testFindByPrimaryKey(LocalDDEPriceTiers priceTiers) throws FinderException {
        Long primaryKey = (Long) priceTiers.getPrimaryKey();
        LocalDDEPriceTiers priceTiers2 = priceTiersHome.findByPrimaryKey(primaryKey);
        assertTrue(priceTiers.isIdentical(priceTiers2));
        return primaryKey;
    }

    private void testGetDiscountPercent(LocalDDEPriceTiers priceTiers, double discountPercent) {
        double discountPercent2 = priceTiers.getDiscountPercent();
        assertEquals(0, discountPercent, discountPercent2);
    }

    private void testRemove(LocalDDEPriceTiers priceTiers, Long primaryKey) throws RemoveException {
        priceTiers.remove();
        try {
            priceTiersHome.findByPrimaryKey(primaryKey);
            fail();
        } catch (FinderException e) {
        }
    }

}
