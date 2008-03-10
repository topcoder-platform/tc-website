/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import com.topcoder.db.connectionfactory.DBConnectionException;
import com.topcoder.db.connectionfactory.DBConnectionFactory;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * <p>A helper utility class providing various methods for getting the data from the test database. Such data is usually
 * used to test the effects of the executed tested methods of tested persistence class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly
 */
public final class DatabaseUtil {

    /**
     * <p>Constructs new <code>DatabaseUtil</code> instance. This implementation does nothing.</p>
     */
    private DatabaseUtil() {
    }

    /**
     * <p>Clears the test database tables involved in unit testing. The records are removed from
     * <code>SUBMISSION_REVIEW</code>, <code>SUBMISSION</code> tables.</p>
     *
     * @param factory a <code>DBConnectionFactory</code> to be used for obtaining connections to target database.
     * @throws SQLException if an SQL error occurs.
     * @throws DBConnectionException if connection to test database could not be established.
     */
    public static void clearTables(DBConnectionFactory factory) throws SQLException, DBConnectionException {
        String[] tables = {"submission_review", "submission_review_audit", "submission_audit", "submission_prize_xref",
                           "contest_result", "submission", "contest_document_xref", "document", "image", "path",
                           "contest_registration", "contest_config", "contest_file_type_xref", "contest_prize_xref",
                           "contest", "prize"};
        String[] userTables = {"email", "comp1_common_oltp:user_group_xref", "comp1_informixoltp:coder",
                               "comp1_common_oltp:security_user", "comp1_common_oltp:user"};
        String[] userIdColumns = {"user_id", "login_id", "coder_id", "login_id", "user_id"};

        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = factory.createConnection();
            con.setAutoCommit(true);
            for (int i = 0; i < tables.length; i++) {
                String table = tables[i];
                ps = con.prepareStatement("DELETE FROM " + table);
                ps.executeUpdate();
                ps.close();
            }
            for (int i = 0; i < userTables.length; i++) {
                String table = userTables[i];
                String idColumn = userIdColumns[i];
                ps = con.prepareStatement("DELETE FROM " + table + " WHERE " + idColumn + " BETWEEN 1 AND 10");
                ps.executeUpdate();
                ps.close();
            }
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * <p>Populates the test database tables with sample data to be used for testing. The SQL commands for inserting the
     * sample data are read from the <code>modifications/test_files/testData.sql</code> text file.</p>
     *
     * @param factory a <code>DBConnectionFactory</code> to be used for obtaining connections to target database.
     * @throws SQLException if an SQL error occurs.
     * @throws DBConnectionException if connection to test database could not be established.
     * @throws IOException if an I/O error occurs while reading from file with test data.
     * @throws FileNotFoundException if the file with SQL script with test data is not found.
     */
    public static void populateTables(DBConnectionFactory factory) throws DBConnectionException, SQLException,
                                                                          IOException {
        Connection con = null;
        PreparedStatement ps = null;
        BufferedReader reader = null;

        String line = null;
        try {
            reader = new BufferedReader(new FileReader("./test_files/studio/testData.sql"));

            con = factory.createConnection();
            con.setAutoCommit(true);

            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if ((line.length() > 0) && (!line.startsWith("--"))) {
                    if (line.endsWith(";")) {
                        line = line.substring(0, line.length() - 1);
                    }
                    ps = con.prepareStatement(line);
                    ps.executeUpdate();
                    ps.close();
                }
            }
        } finally {
            if (line != null) {
                System.out.println("Last SQL statement : " + line);
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    // Ignore
                }
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
