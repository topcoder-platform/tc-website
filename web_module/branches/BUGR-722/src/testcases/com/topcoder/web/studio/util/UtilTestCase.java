/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import junit.framework.Assert;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.db.connectionfactory.ConfigurationException;
import com.topcoder.db.connectionfactory.DBConnectionException;

import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.mockejb.jndi.MockContextFactory;

import java.sql.SQLException;
import java.io.IOException;

/**
 * <p>A unit test case for {@link Util} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2
 */
public class UtilTestCase extends TCHibernateTestCase {

    /**
     * <p>Constructs new <code>UtilTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public UtilTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void setUp() {
        try {
            String dbNamespcae = "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";

            DBConnectionFactoryImpl connectionFactory = new DBConnectionFactoryImpl(dbNamespcae);
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);

            ConfigManager cm = ConfigManager.getInstance();
            String jdbcUrl = cm.getString(dbNamespcae, "connections.TestingConnection.parameters.jdbc_url");
            String jdbcUser = cm.getString(dbNamespcae, "connections.TestingConnection.parameters.user");
            String jdbcPassword = cm.getString(dbNamespcae, "connections.TestingConnection.parameters.password");

            DataSource ds = new InformixSimpleDataSource(jdbcUrl, jdbcUser, jdbcPassword);
            MockContextFactory.setAsInitial();
            new InitialContext().bind(DBMS.STUDIO_DATASOURCE_NAME, ds);
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }
        super.setUp();
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void tearDown() {
        super.tearDown();
        try {
            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
            MockContextFactory.revertSetAsInitial();
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Util#isSubmissionPurchased(String)} method for accurate behavior.</p>
     *
     * <p>Passes the ID of a submission which has a payment with <code>Paid</code> status and verifies that the method
     * returns <code>true</code>.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testIsSubmissionPurchased_Paid() throws Exception {
        String[] submissionIds = new String[] {"3", "4"};
        for (int i = 0; i < submissionIds.length; i++) {
            String submissionId = submissionIds[i];
            Assert.assertTrue("Wrong result for paid submission", Util.isSubmissionPurchased(submissionId));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Util#isSubmissionPurchased(String)} method for accurate behavior.</p>
     *
     * <p>Passes the ID of a submission which has a payment with <code>UnPaid</code> status and verifies that the method
     * returns <code>false</code>.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testIsSubmissionPurchased_UnPaid() throws Exception {
        String[] submissionIds = new String[] {"5", "6"};
        for (int i = 0; i < submissionIds.length; i++) {
            String submissionId = submissionIds[i];
            Assert.assertFalse("Wrong result for unpaid submission", Util.isSubmissionPurchased(submissionId));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Util#isSubmissionPurchased(String)} method for accurate behavior.</p>
     *
     * <p>Passes the ID of a submission which has a payment with <code>Marked For Purchase</code> status and verifies
     * that the method returns <code>false</code>.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testIsSubmissionPurchased_MarkedForPurchase() throws Exception {
        String[] submissionIds = new String[] {"7", "8"};
        for (int i = 0; i < submissionIds.length; i++) {
            String submissionId = submissionIds[i];
            Assert.assertFalse("Wrong result for marked for purchase submission",
                               Util.isSubmissionPurchased(submissionId));
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Util#isSubmissionPurchased(String)} method for accurate behavior.</p>
     *
     * <p>Passes the ID of a submission which has no associated payment and verifies that the method returns
     * <code>false</code>.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testIsSubmissionPurchased_NoPayment() throws Exception {
        String[] submissionIds = new String[] {"1", "2"};
        for (int i = 0; i < submissionIds.length; i++) {
            String submissionId = submissionIds[i];
            Assert.assertFalse("Wrong result for submission with no payment", Util.isSubmissionPurchased(submissionId));
        }
    }
}
