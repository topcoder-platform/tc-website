/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.util.config.ConfigManager;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 * <strong>Purpose</strong>:
 * This class is used to log auto-screening results to a database. It logs the results of the screening process
 * steps as well as the final result (success/failure).
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Added "max_retries", "retry_sleep_time" properties to CM.
 * </li>
 * <li>
 * log(...) methods were modified to retry the execution of the update statment.
 * </li>
 * </ol>
 *
 * @author TheCois, WishingBone, pulky
 * @version 1.0.1
 */
public class ScreeningLogger {

    /**
     * The namespace for the configuration.
     *
     * @since 1.0.1
     */
    private static final String SCREENING_LOGGER_NAMESPACE = "com.topcoder.apps.screening.ScreeningLogger";

    /**
     * The name of the property in the configuration file that contains the number of retries for lock hits.
     *
     * @since 1.0.1
     */
    private static final String MAX_RETRIES_PROPERTY_NAME = "max_retries";

    /**
     * The name of the property in the configuration file that contains the sleep time before a retry.
     *
     * @since 1.0.1
     */
    private static final String RETRY_SLEEP_TIME_PROPERTY_NAME = "retry_sleep_time";

    /**
     * The default number of retries for lock hits.
     *
     * @since 1.0.1
     */
    private static final int DEFAULT_MAX_RETRIES = 3;

    /**
     * The default sleep time before a retry.
     *
     * @since 1.0.1
     */
    private static final int DEFAULT_RETRY_SLEEP_TIME = 1000;

    /**
     * <strong>Purpose</strong>:
     * The id generator to generate the screening result ids.
     */
    private IdGen idGen;


    private IScreeningRequest request = null;


    /**
     * <strong>Purpose</strong>:
     * The number of retries for lock hits.
     *
     * @since 1.0.1
     */
    private final int maxRetries;

    /**
     * <strong>Purpose</strong>:
     * The sleep time before a retry. (milliseconds)
     *
     * @since 1.0.1
     */
    private final int retrySleepTime;

    /**
     * <strong>Purpose</strong>:
     * Creates an instance of this class.
     */
    public ScreeningLogger() {
        int defaultMaxRetries = DEFAULT_MAX_RETRIES;
        int defaultRetrySleepTime = DEFAULT_RETRY_SLEEP_TIME;

        try {
            ConfigManager cm = ConfigManager.getInstance();

            String maxRetriesString = cm.getString(SCREENING_LOGGER_NAMESPACE, MAX_RETRIES_PROPERTY_NAME);
            if (maxRetriesString != null) {
                try {
                    defaultMaxRetries = Integer.parseInt(maxRetriesString);
                } catch (NumberFormatException nfe) {
                    // uses default
                }
            }

            String retrySleepTimeString = cm.getString(SCREENING_LOGGER_NAMESPACE, RETRY_SLEEP_TIME_PROPERTY_NAME);
            if (retrySleepTimeString != null) {
                try {
                    defaultRetrySleepTime = Integer.parseInt(retrySleepTimeString);
                } catch (NumberFormatException nfe) {
                    // uses default
                }
            }
        } catch (Exception e) {
            // uses default
        }

        maxRetries = defaultMaxRetries;
        retrySleepTime = defaultRetrySleepTime;

        initializeIdGen();
    }

    /**
     * <strong>Purpose</strong>:
     * Initialize Id Generator.
     */
    private void initializeIdGen() {
        try {
            InitialContext context = new InitialContext();
            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o, IdGenHome.class);
            idGen = idGenHome.create();
        } catch (Exception ex) {
            throw new DatabaseException("Failed to intialize Id Generator.", ex);
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Logs the outcome of a screening step using a given logging level (see the Level class). Any argument is
     * accepted and no exceptions are thrown.
     *
     * <strong>Valid args</strong>:
     * Any Level and non-null ScreeningData instance.
     *
     * @param message The ScreeningData instance representing the outcome of a screening step.
     *
     * @throws NullPointerException if message is null.
     * @throws DatabaseException if logging fails.
     */
    public void log(ScreeningData message) {
        if (message == null) {
            throw new NullPointerException("message should not be null.");
        }
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement("INSERT INTO screening_result" +
                "(screening_result_id, dynamic_response_text, screening_response_id, create_user, " +
                " create_date, screening_task_id) VALUES(?, ?, ?, ?, ?, ?)");
            stmt.setLong(1, idGen.nextId());
            stmt.setString(2, message.getResponseText());
            stmt.setLong(3, message.getResponseId());
            stmt.setLong(4, 1);
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            stmt.setLong(6, request.getTaskId());

            if (!executeUpdate(stmt, maxRetries, retrySleepTime)) {
                throw new DatabaseException("Log result failed after " + maxRetries + " retries.");
            }
        } catch (SQLException sqle) {
            throw new DatabaseException("Log result fails.", sqle);
        } catch (RemoteException re) {
            throw new DatabaseException("ID generation fails.", re);
        } finally {
            DbHelper.dispose(conn, stmt, rs);
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Logs the outcome of the screening process using a given logging level (see the Level class).
     *
     * <strong>Valid args</strong>:
     * Any Level and non-null ScreeningResult instance.
     *
     * @param message The ScreeningResult instance representing the outcome of a the entire screening process.
     *
     * @throws NullPointerException if message is null.
     * @throws DatabaseException if logging fails.
     */
    public void log(ScreeningResult message) {
        if (message == null) {
            throw new NullPointerException("message should not be null.");
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DbHelper.getConnection();

            if (this.request instanceof SubmissionScreeningRequest) {
                stmt = conn.prepareStatement("UPDATE submission SET passed_auto_screening = ? WHERE submission_v_id = ?");
            } else if (request instanceof SpecificationScreeningRequest){
                stmt = conn.prepareStatement("UPDATE specification SET passed_auto_screening = ? WHERE specification_id = ?");
            }

            stmt.setBoolean(1, message.isSuccess());
            stmt.setLong(2, this.request.getArtifactId());

            if (!executeUpdate(stmt, maxRetries, retrySleepTime)) {
                throw new DatabaseException("Log result failed after " + maxRetries + " retries.");
            }
        } catch (SQLException sqle) {
            throw new DatabaseException("Log result fails.", sqle);
        } finally {
            DbHelper.dispose(conn, stmt, null);
        }
    }

    public IScreeningRequest getRequest() {
        return this.request;
    }

    public void setRequest(IScreeningRequest request) {
        this.request = request;
    }


    /**
     * <strong>Purpose</strong>:
     * Executes the update statment and if it fails, retries "maxRetries" times.
     * Between executions, waits "retrySleepTime" milliseconds.
     *
     * @param stmt The update statment to be executed.
     * @param maxRetries The number of retries if execution fails.
     * @param retrySleepTime The sleep time between executions.
     *
     * @return true if execution succedeed.
     *
     * @since 1.0.1
     */
    private boolean executeUpdate(PreparedStatement stmt, int maxRetries, int retrySleepTime) {
        // Update can hit a lock so we'll try to execute it "maxRetries" times.
        int updResult = 0;
        for (int retryCnt = 0; retryCnt < maxRetries && updResult != 1; retryCnt++) {
            try {
                updResult = stmt.executeUpdate();
            } catch (SQLException sqle) {
                if (updResult != 1) {
                    // hit an optimistic lock, go to sleep ("retrySleepTime" milliseconds)
                    try {
                        Thread.sleep(retrySleepTime);
                    } catch (InterruptedException e) {
                    }
                }
            }
        }
        return (updResult == 1);
    }
}
