/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.topcoder.db.connectionfactory.DBConnectionFactory;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

/**
 * <strong>Purpose</strong>:
 * Helper class for DB operations.
 *
 * @author WishingBone
 * @version 1.0
 */
public class DbHelper {

    /**
     * <strong>Purpose</strong>:
     * The data source to create the connection.
     */
    private static DBConnectionFactory cf = null;

    /**
     * <strong>Purpose</strong>:
     * Get connection from DB connection factory.
     *
     * @throws DatabaseException if connection creation fails.
     */
    public static Connection getConnection() {
        try {
            if (DbHelper.cf == null) {
                DbHelper.cf = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            }
            return DbHelper.cf.createConnection();
        } catch (Exception ex) {
            throw new DatabaseException("Creation of connection fails. ", ex);
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Dispose the DB resources.
     *
     * @param conn the db connection.
     * @param stmt the db statement.
     * @param rs the db resultset.
     */
    public static void dispose(Connection conn, Statement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ex) {
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception ex) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ex) {
            }
        }
    }
}
