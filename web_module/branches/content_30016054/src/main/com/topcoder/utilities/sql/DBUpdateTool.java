/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.sql;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

/**
 * <p>A DB utility which is intended to read SQL statements from input files and runs them against target database.</p>
 *
 * <p>The purpose of this tool is to parse the SQL statements from the provided input files and execute them
 * sequentially. Each executed SQL statement may return another SQL statements which are executed right after the
 * statement which returned them. Those returned statements are executed either in separate single transaction or in
 * same transaction with statement which returned them if that statement is preceded with <code>@TRANSACTION</code>
 * annotation in the source input file.</p>
 *
 * <p>Below is the sample configuration for this tool:</p>
 *
 * <pre>
 * &lt;?xml version="1.0"?&gt;
 * &lt;dbUpdateTool&gt;
 *    &lt;sourcesList&gt;
 *        &lt;source name = "DBNAME1"
 *                value = "jdbc:informix-sqli://HOST:PORT/DB1:INFORMIXSERVER=SERVER;user=USER;password=PASSWORD"/&gt;
 *        &lt;source name = "DBNAME2"
 *                value = "jdbc:informix-sqli://HOST:PORT/DB2:INFORMIXSERVER=SERVER;user=USER;password=PASSWORD"/&gt;
 *    &lt;/sourcesList&gt;
 *    &lt;adminEmails&gt;test@test.com&lt;/adminEmails&gt;
 *    &lt;systemEmail&gt;tc@domu-12-31-39-00-4d-d4.compute-1.internal&lt;/systemEmail&gt;
 *    &lt;errorEmailSubject&gt;An error reported by DB Update Tool&lt;/errorEmailSubject&gt;
 *    &lt;errorEmailTemplate&gt;Following error is reported by DB Update Tool: {0}&lt;/errorEmailTemplate&gt;
 *    &lt;inputFiles&gt;/tmp/test_files/DBNAME1.sql:/tmp/test_files/DBNAME2.sql&lt;/inputFiles&gt;
 *    &lt;parameterList&gt;
 *    &lt;/parameterList&gt;
 *&lt;/dbUpdateTool&gt;
 * </pre>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class DBUpdateTool extends DBUtility {

    /**
     * <p>A <code>String</code> providing the annotation to be used in source input files which require a standalone
     * transaction for execution.</p>
     */
    public static final String TRANSACTION_ATTRIBUTE = "@TRANSACTION";

    /**
     * <p>A <code>String</code> providing the system email address to be used for sending notification emails from.</p>
     */
    private String systemEmail;

    /**
     * <p>A <code>String</code> providing the list of email addresses for administrators to be notified on errors
     * encountered while tool is running.</p>
     */
    private String[] adminEmails;

    /**
     * <p>A <code>String</code> providing the template for email to be sent to administrators to notify on errors.</p>
     */
    private String errorEmailTemplate;

    /**
     * <p>A <code>String</code> providing the subject for email to be sent to administrators to notify on errors.</p>
     */
    private String errorEmailSubject;

    /**
     * <p>A <code>String</code> providing the list of input files with queries to be processed by this tool.</p>
     */
    private String[] inputFiles;

    /**
     * <p>Constructs new <code>DBUpdateTool</code> instance. This implementation does nothing.</p>
     */
    public DBUpdateTool() {
    }

    /**
     * <p>Process the DBUtility.<p/>
     *
     * <p>The utility first parses the xml and then the command line (overwriting duplicated parameters), then validates
     * the parameters, checks the driver and starts the utility.</p>
     *
     * @param args command line arguments
     */
    @Override
    protected void process(String[] args) {
        try {
            super.process(args);
        } catch (Exception e) {
            handleError(e);
        }
    }

    /**
     * <p>Aborts the utility and show the causing error. Notifies administrators on error.</p>
     */
    @Override
    protected void fatal_error() {
        handleError(new IllegalStateException(sErrorMsg.toString()));
        super.fatal_error();
    }

    /**
     * <p>Aborts the utility and show the causing error. Notifies administrators on error.</p>
     *
     * @param e The exception causing the fatal error.
     */
    @Override
    protected void fatal_error(Exception e) {
        handleError(e);
        super.fatal_error(e);
    }

    /**
     * <p>Runs this DB utility.<p/>
     *
     * <p>Schedules the job for running at desired intervals. The job will read the SQL statements from input files
     * specified by configuration and run them against target database. Any encountered errors are logged and emailed
     * to system administrators.</p>
     */
    @Override
    protected void runUtility() throws Exception {
        log.info("DB Update Tool : started");
        run();
    }

    /**
     * <p>Processes and validates the parameters for this utility.</p>
     */
    protected void processParams() {
        super.processParams();

        // Parse email addresses for notifications on errors
        String adminEmailsList = (String) params.get("adminEmails");
        if (adminEmailsList == null || adminEmailsList.trim().length() == 0) {
            setUsageError("Please specify adminEmails.\n");
        } else {
            this.adminEmails = adminEmailsList.trim().split(" ");
        }
        this.systemEmail = (String) params.get("systemEmail");
        if (this.systemEmail == null || this.systemEmail.trim().length() == 0) {
            setUsageError("Please specify a systemEmail.\n");
        }
        log.debug("adminEmails : " + Arrays.toString(this.adminEmails));
        log.debug("systemEmail : " + this.systemEmail);

        // Parse names for input files with queries to be processed
        String inputFilesList = (String) params.get("inputFiles");
        if (inputFilesList == null || inputFilesList.trim().length() == 0) {
            setUsageError("Please specify inputFiles.\n");
        } else {
            StringTokenizer tokenizer = new StringTokenizer(inputFilesList, File.pathSeparator);
            this.inputFiles = new String[tokenizer.countTokens()];
            int index = 0;
            while (tokenizer.hasMoreTokens()) {
                this.inputFiles[index++] = tokenizer.nextToken();
            }
        }
        log.debug("inputFiles : " + Arrays.toString(this.inputFiles));

        // Parse error email details
        this.errorEmailSubject = (String) params.get("errorEmailSubject");
        if (this.errorEmailSubject == null || this.errorEmailSubject.trim().length() == 0) {
            setUsageError("Please specify a errorEmailSubject.\n");
        }
        this.errorEmailTemplate = (String) params.get("errorEmailTemplate");
        if (this.errorEmailTemplate == null || this.errorEmailTemplate.trim().length() == 0) {
            setUsageError("Please specify a errorEmailTemplate.\n");
        }
        log.debug("errorEmailSubject : " + this.errorEmailSubject);
        log.debug("errorEmailTemplate : " + this.errorEmailTemplate);
    }

    /**
     * <p>Shows the help on usage of this DB utility.</p>
     *
     * @param msg a <code>String</code> providing error message.
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg).append("\n");
        sErrorMsg.append("DBUpdateTool:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append("   -runInterval : interval (in milliseconds) for running the tool periodically (optional, defaults to an hour).\n");
        sErrorMsg.append("   -adminEmails : a space-separated list of admin email addresses (required).\n");
        sErrorMsg.append("   -systemEmail : a system email address to send email notifications from (required).\n");
        sErrorMsg.append("   -errorEmailSubject : a subject for email to send to admins to notify on errors (required).\n");
        sErrorMsg.append("   -errorEmailTemplate : a template for email to send to admins to notify on errors (required).\n");
        sErrorMsg.append("   -inputFiles : a list of input files with queries to be processed separated with "
                         + "OS-dependent path separator character (required, the order of items in list is "
                         + "important).\n");
        fatal_error();
    }

    /**
     * <p>Handles the exception encountered while running the </p>
     *
     * @param e an <code>Exception</code> providing the cause of error.
     */
    private void handleError(Exception e) {
        log.error("DB Update Tool failed to perform successfully due to unexpected error", e);

        StringWriter sw = new StringWriter();
        e.printStackTrace(new PrintWriter(sw));
        String errorMessage = MessageFormat.format(this.errorEmailTemplate, sw.toString());

        // Send emails notifying administrators on encountered error
        for (int i = 0; i < this.adminEmails.length; i++) {
            String adminEmail = this.adminEmails[i];
            try {
                sendMail(this.systemEmail, adminEmail, this.errorEmailSubject, errorMessage);
            } catch (Exception e1) {
                log.error("DB Update Tool failed to notify administrator " + adminEmail + " on error", e1);
            }
        }
        log.debug("DB Update Tool notified administrators on error: " + e.getMessage());
    }


    /**
     * <p>Runs this job. Reads SQL statements from input files and runs them against target databases.</p>
     *
     * @see Thread#run()
     */
    public void run() {
        log.info("DB Update Tool job started");
        try {
            for (int i = 0; i < inputFiles.length; i++) {
                String queryFilePath = inputFiles[i];
                File inputFile = new File(queryFilePath);
                processFile(inputFile);
            }
        } catch (Exception e) {
            handleError(e);
        }
        log.info("DB UpdateTool job finished");
    }

    /**
     * <p>Processes the specified input file which is expected to provide the SQL statements to be executed against
     * target database. The short name of the file (with extension part stripped off) must match one of the sources
     * defined in configuration for this tool and will specify which DB connection is to be used for running the
     * queries.</p>
     *
     * <p>Each SQL statement in file may take multiple lines and is separated from other statements by empty lines.
     * Optionally, a line containing <code>@TRANSACTION</code> text only may precede the SQL statement to indicate
     * that statement is to be executed in transaction context.</p>
     *
     * @param inputFile a <code>File</code> referencing the file with queries to be executed.
     * @throws SQLException if an SQL error occurs while executing SQL statements.
     * @throws IOException if an I/O error occurs while reading the queries from file.
     */
    private void processFile(File inputFile) throws SQLException, IOException {
        log.debug("DB Update Tool starts processing input file: " + inputFile.getAbsolutePath());
        // Parse the name of DB source from the file name
        String source;
        String fileName = inputFile.getName();
        int pos = fileName.lastIndexOf(".");
        if (pos > 0) {
            source = fileName.substring(0, pos);
        } else {
            source = fileName;
        }

        boolean isTransactionRequired = false;
        StringBuilder sql = new StringBuilder();

        // Read the statements and their transactional attributes
        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        try {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (line.length() == 0) {
                    // Empty line. If there is a single SQL statement collected so far - execute it; otherwise
                    // ignore empty line
                    if (sql.length() > 0) {
                        processQuery(source, sql.toString(), isTransactionRequired);
                        sql.setLength(0);
                        isTransactionRequired = false;
                    }
                } else {
                    // Non empty line. If it is a continuation of current SQL statement then collect it to buffer
                    // Otherwise check if it is a flag indicating on requirement for transaction context
                    if (TRANSACTION_ATTRIBUTE.equals(line)) {
                        isTransactionRequired = true;
                    } else {
                        sql.append(line);
                    }
                }
            }
            // Check if there is last SQL statement parsed from file but not executed
            if (sql.length() > 0) {
                processQuery(source, sql.toString(), isTransactionRequired);
            }
        } finally {
            reader.close();
            log.debug("DB Update Tool finished processing input file: " + inputFile.getAbsolutePath());
        }
    }

    /**
     * <p>Executes the specified SQL statement against the target database referenced by the specified source
     * (possibly in transaction context).</p>
     *
     * @param source a <code>String</code> referencing the target database to execute statement against.
     * @param sql a <code>String</code> providing the SQL statement to be executed.
     * @param transactionForQueryRequired <code>true</code> if statement itself requires a transaction context;
     *        <code>false</code> otherwise.
     * @throws SQLException if an SQL error occurs while executing the query.
     */
    private void processQuery(String source, String sql, boolean transactionForQueryRequired) throws SQLException {
        // Strip last ; character if present
        sql = sql.trim();
        if (sql.endsWith(";")) {
            sql = sql.substring(0, sql.length() - 1);
        }

        // Disable auto-commit feature as there is a need to manage transactions explicitly
        setAutoCommit(source, false);

        String lastSQL = sql;
        // Execute current statement and process it's results possibly running additional statements returned
        // with results
        PreparedStatement statement = prepareStatement(source, sql);
        try {
            boolean result = statement.execute();
            log.info("DB Update Tool executed statement: " + sql);
            if (result) {
                // There are statements to execute

                // Collect the new statements returned with result and manage transaction for current query
                // based on transactionForQueryRequired flag
                ResultSet resultSet = statement.getResultSet();
                List<String> newStatements = new ArrayList<String>();
                try {
                    while (resultSet.next()) {
                        newStatements.add(resultSet.getString(1));
                    }
                } finally {
                    // Close result set and commit the current explicitly managed transaction for original query if
                    // one does not require transaction
                    DBMS.close(resultSet);
                    if (!transactionForQueryRequired) {
                        commit(source);
                    }
                }

                // Execute new SQL statements returned by the original query result. Set the transaction context
                // based on transactionForQueryRequired flag
                for (String newSql : newStatements) {
                    lastSQL = newSql;
                    PreparedStatement newStatement = prepareStatement(source, newSql);
                    try {
                        newStatement.execute();
                        log.info("DB Update Tool executed statement: " + newSql);
                    } finally {
                        DBMS.close(newStatement);
                    }
                }

                // Commit the transaction for executed statements from result only if transaction context
                // is not required for original statement
                if (!transactionForQueryRequired) {
                    commit(source);
                }
            }

            // If original query required transaction context then commit the final transaction
            if (transactionForQueryRequired) {
                commit(source);
            }
        } catch (SQLException e) {
            log.error("DB Update Tool failed to process statement due to error below. Will rollback the current "
                      + "transaction.", e);
            log.error("The statement which caused an error is: " + lastSQL);
            rollback(source);
            handleError(e);
        } finally {
            DBMS.close(statement);
            setAutoCommit(source, true);
        }
    }
}
