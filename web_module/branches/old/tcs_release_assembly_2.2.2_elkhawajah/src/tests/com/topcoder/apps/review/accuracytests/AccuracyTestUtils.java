/*
 * TCS Online Review Application
 *
 * AccuracyTestUtils.java
 *
 * Copyright (c) 2003 TopCoder, Inc.  All rights reserved.
 */

package com.topcoder.apps.review.accuracytests;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.topcoder.apps.review.projecttracker.User;

/**
 * A class providing utility routines to the accuracy test suite.  The
 * realization of this class has become much smaller than its initial
 * conception.
 *
 * @author ThinMan
 * @version 1.0
 */
public class AccuracyTestUtils {

    DataSource ds;

    public AccuracyTestUtils() throws NamingException {
        Context ctx = new InitialContext();
        ds = (DataSource) ctx.lookup("java:/InformixDS");
        ctx.close();
    }

    public void close() throws Exception {
    }

    public Connection getConnection() throws SQLException {
        return ds.getConnection();
    }

    public InputStream getStream(String resourceName) {
        return getClass().getClassLoader().getResourceAsStream(resourceName);
    }

    public User[] getUsers(final int count) throws SQLException {
        return getUsers(count, 0);
    }

    public User[] getUsers(final int count, final int skip)
            throws SQLException {
        User[] users = new User[count];
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(
                "select security_user.login_id, user_customer_id, user_id, "
                + "first_name, last_name, email_address "
                + "from user_customer, security_user "
                + "where user_customer.login_id = security_user.login_id;");

        for (int i = 0; i < skip; i++) {
            if (!rs.next()) {
                throw new IndexOutOfBoundsException("Not enough users");
            }
        }
        for (int i = 0; i < count; i++) {
            if (!rs.next()) {
                throw new IndexOutOfBoundsException("Not enough users");
            }
            users[i] = new UserImpl(rs.getString(1), rs.getString(3),
                    rs.getString(4), rs.getString(5),
                    rs.getString(6));
        }

        con.close();

        return users;
    }

}

