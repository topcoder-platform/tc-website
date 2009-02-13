/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.MediumDAO;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.common.dao.GenericDAO;

import java.io.Serializable;
import java.util.List;

import junit.framework.Assert;

/**
 * <p>A unit test for {@link MediumDAOHibernate} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
 */
public class MediumDAOHibernateTestCase extends TCHibernateTestCase {

    /**
     * <p>An <code>Integer</code> array listing the IDs of pre-defined medium types.</p>
     */
    private final Integer[] ids = {Medium.APPAREL, Medium.BROCHURE, Medium.COMPUTER_SCREEN, Medium.EMAIL_NEWSLETTER,
                                   Medium.LARGE_PRINT, Medium.POSTER, Medium.PRINT, Medium.STATIONARY, Medium.WEB};

    /**
     * <p>A <code>String</code> array listing the descriptions of pre-defined medium types.</p>
     */
    private final String[] descriptions = {"Aparrel (T-Shirt, Embroidery, Hat etc.)", "Brochure", "Computer Screen",
                                           "Email Newsletter", "Sign/Banner (Large Print)", "Poster", "Print",
                                           "Stationary (letterhead, business cards, envelopes, etc.)", "Web"};

    /**
     * <p>The instance of {@link MediumDAOHibernate} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private MediumDAOHibernate testedInstance = null;

    /**
     * <p>Constructs new <code>MediumDAOHibernateTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public MediumDAOHibernateTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new MediumDAOHibernate();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link MediumDAO#find(Serializable)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of existing medium types and expects the method to return the valid {@link Medium} instances
     * matching the provided IDs.</p>
     */
    public void testFind_Integer() {
        int cnt = this.ids.length;

        for (int i = 0; i < cnt; i++) {
            Medium type = this.testedInstance.find(this.ids[i]);
            Assert.assertNotNull("The existing medium type is not found", type);
            Assert.assertEquals("Wrong medium type ID retrieved", this.ids[i], type.getId());
            Assert.assertEquals("Wrong medium type description retrieved", this.descriptions[i], type.getDescription());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MediumDAO#find(Serializable)} method for accurate behavior.</p>
     *
     * <p>Passes the IDs of non-existing medium types and expects the method to return <code>nuill</code>.</p>
     */
    public void testFind_Integer_NonExisting() {
        Integer[] ids = {-10, 0, 3232, 10};
        for (int i = 0; i < ids.length; i++) {
            Medium type = this.testedInstance.find(ids[i]);
            Assert.assertNull("The Medium instance is returned for non-existing ID", type);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MediumDAO#findAll()} method for accurate behavior.</p>
     *
     * <p>Verifies that the method returns the valid {@link Medium} instances for all existing medium types.</p>
     */
    public void testFindAll() {
        int cnt = this.ids.length;

        List<Medium> types = this.testedInstance.findAll();
        Assert.assertEquals("Wrong number of medium types is retrieved", cnt, types.size());

        for (int i = 0; i < cnt; i++) {
            boolean found = false;
            for (Medium returnedType : types) {
                if (returnedType.getId().equals(this.ids[i])) {
                    found = true;
                    Assert.assertEquals("Wrong medium type description retrieved", this.descriptions[i],
                                        returnedType.getDescription());
                }
            }
            Assert.assertTrue("The medium type " + this.ids[i] + " is not retrieved", found);
        }
    }

    /**
     * <p>Accuracy test. Tests the declaration of the tested class.</p>
     *
     * <p>Verifies that the interface is declared correctly.</p>
     */
    public void testDeclaration() {
        Class<GenericDAO> superClass = GenericDAO.class;
        Class<MediumDAOHibernate> testedClass = MediumDAOHibernate.class;
        Assert.assertTrue(testedClass.getName() + " does not extend " + superClass.getName(),
                          superClass.isAssignableFrom(testedClass));
    }
}
