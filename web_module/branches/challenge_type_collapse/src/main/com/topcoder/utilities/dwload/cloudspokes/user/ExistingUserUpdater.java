package com.topcoder.utilities.dwload.cloudspokes.user;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.supercsv.io.CsvMapReader;
import org.supercsv.prefs.CsvPreference;

import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

public class ExistingUserUpdater {
    /**
     * Logger.
     */
    private static final Logger LOG = LogManager.getLogger(ExistingUserUpdater.class);

    /**
     * DB connection factory name space.
     */
    private static final String DB_CONNECTION_FACTORY_NAMESPACE =
            "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";

     /**
     * DB connection name used to obtain DB connection.
     */
    private static final String DB_CONNECTION_NAME = "DefaultSequence";

    private final String inputFolder;

    /**
     * DB connection.
     */
    private Connection conn;

    private PreparedStatement updateOpenIdStmt = null;

    private CsvMapReader inputReader;

    private String[] inputHeader;

    public ExistingUserUpdater(String inputFolder) {
        this.inputFolder = inputFolder;
    }

    public void update() throws Exception {
        // Establish DB connection.
        try {
            conn = new DBConnectionFactoryImpl(
                    DB_CONNECTION_FACTORY_NAMESPACE).createConnection(DB_CONNECTION_NAME);
            conn.setAutoCommit(false);
        } catch (Exception e) {
            throw new Exception("Failed to establish DB connection.\n" + e.getLocalizedMessage(), e);
        }

        List<File> files = new ArrayList<File>();
        files.add(new File(inputFolder, "sameEmail.csv"));
        files.add(new File(inputFolder, "sameBoth.csv"));
        for (File file : files) {
            // Open input file.
			System.out.println("---------file---------------------------------------"+file.getName());
			
            try {
                inputReader = new CsvMapReader(new FileReader(file), CsvPreference.EXCEL_PREFERENCE);
            } catch (FileNotFoundException e) {
                throw new Exception("Input file not found.\n" + e.getLocalizedMessage(), e);
            }
            try {
                inputHeader = inputReader.getHeader(true);
            } catch (IOException e) {
                try {
                    inputReader.close();
                } catch (IOException ex) {
                }
                throw new Exception("I/O error during input file reading.\n" + e.getLocalizedMessage(), e);
            }
System.out.println("---------hh---------------------------------------");
            // Process input file.
            Map<String, String> line;
            try {
                while (true) {
                    try {
                        line = inputReader.read(inputHeader);
                    } catch (IOException e) {
                        System.err.println("Error reading input file.\n" + e.getLocalizedMessage());
                        throw e;
                    }
                    if (line == null) { System.out.println("---------line is nullll---------------------------------");
                        break;
                    }
                    processInputLine(line);
                }
            } catch (Exception e) {System.out.println("---------eeeeeeeee---------------------------------"+e);
                conn.rollback();
                try {
                    conn.close();
                } catch (Exception ex) {
                }
                throw new Exception("Error during handling line number " + inputReader.getLineNumber() + "\n"
                        + e.getLocalizedMessage(), e);
            } finally {
                // Release resources.
                try {
                    inputReader.close();
                } catch (IOException e) {
                }
            }
        }
        conn.commit();
        try {
            conn.close();
        } catch (Exception e) {
        }
    }

    private void processInputLine(Map<String, String> line) throws Exception {
        String email = line.get("email");
        String openId = line.get("userId");
        String tcHandle = line.containsKey("tcHandle") ? line.get("tcHandle") : line.get("username");
        if (email == null || email.trim().length() == 0 || openId == null || openId.trim().length() == 0) {
            return;
        }

        updateOpenID(tcHandle, openId);
        LOG.info("Updated user with email '" + email + "'.");
    }

    private void updateOpenID(String tcHandle, String openId) throws SQLException {
        if (updateOpenIdStmt == null) {
            updateOpenIdStmt = conn.prepareStatement("UPDATE user SET open_id = ? "   //               ------------, status = 'A' "
                    + "WHERE handle_lower = ?");
        }
        updateOpenIdStmt.setString(1, openId);
        updateOpenIdStmt.setString(2, tcHandle.toLowerCase());
        updateOpenIdStmt.executeUpdate();
    }

    public static void main(String[] args) {
        // Validate command line arguments.
        if (args.length < 1 || args.length > 1 || (args.length == 1 && args[0].equals("-h"))) {
            System.out.println("Usage:");
            System.out.println("    java -jar bin/ExistingUserUpdater.jar inputFolder");
            System.out.println("        Updates existing users. inputFolder specifies folder with input files.");
            System.out.println("    java -jar bin/ExistingUserUpdater.jar -h");
            System.out.println("        Shows this help screen.");
            return;
        }

        // Run updating.
        try {
            new ExistingUserUpdater(args[0]).update();
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            System.err.println("Error occurred:\n" + e.getLocalizedMessage());
            e.printStackTrace(System.err);
        }
    }
}
