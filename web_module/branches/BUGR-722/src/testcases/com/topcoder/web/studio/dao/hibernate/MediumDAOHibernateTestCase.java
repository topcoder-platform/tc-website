/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.dao.MediumDAO;
import com.topcoder.web.studio.model.Medium;
import junit.framework.Assert;

import java.io.Serializable;
import java.util.List;

/**
 * <p>A unit test for {@link MediumDAOHibernate} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
 */
public class MediumDAOHibernateTestCase extends TCHibernateTestCase {

    /**
     * <p>A <code>String</code> array listing the descriptions of pre-defined medium types.</p>
     */
    private final String[] descriptions = {"Web",
            "Application",
            "Desktop",
            "Email",
            "Print",
            "Large Print",
            "Mobile",
            "Apparel",
            "Other"
    };
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
     * <p/>
     * <p>Passes the IDs of existing medium types and expects the method to return the valid {@link Medium} instances
     * matching the provided IDs.</p>
     */
    public void testFind_Integer() {
        Integer firstMediumId = 1;

        Medium type = this.testedInstance.find(firstMediumId);
        Assert.assertNotNull("The existing medium type is not found", type);
        Assert.assertEquals("Wrong medium type ID retrieved", firstMediumId, type.getId());
        Assert.assertEquals("Wrong medium type description retrieved", this.descriptions[0], type.getDescription());
    }

    /**
     * <p>Accuracy test. Tests the {@link MediumDAO#find(Serializable)} method for accurate behavior.</p>
     * <p/>
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
     * <p/>
     * <p>Verifies that the method returns the valid {@link Medium} instances for all existing medium types.</p>
     */
    public void testFindAll() {
        int cnt = this.descriptions.length;

        List<Medium> types = this.testedInstance.findAll();
        Assert.assertEquals("Wrong number of medium types is retrieved", cnt, types.size());

        for (int i = 0; i < cnt; i++) {
            boolean found = false;
            for (Medium returnedType : types) {
                if (returnedType.getDescription().equals(this.descriptions[i])) {
                    found = true;
                }
            }
            Assert.assertTrue("The medium type " + this.descriptions[i] + " is not retrieved", found);
        }
    }

    /**
     * <p>Accuracy test. Tests the declaration of the tested class.</p>
     * <p/>
     * <p>Verifies that the interface is declared correctly.</p>
     */
    public void testDeclaration() {
        Class<GenericDAO> superClass = GenericDAO.class;
        Class<MediumDAOHibernate> testedClass = MediumDAOHibernate.class;
        Assert.assertTrue(testedClass.getName() + " does not extend " + superClass.getName(),
                superClass.isAssignableFrom(testedClass));
    }
}
