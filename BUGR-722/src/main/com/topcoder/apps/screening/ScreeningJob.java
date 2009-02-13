/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

import com.topcoder.shared.util.logging.Logger;
import java.util.Timer;
import java.util.TimerTask;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <strong>Purpose</strong>:
 * This is the command line utility that runs the screening. It is a TimerTask which is run once every second.
 * The command line could accept a single argument which is the number of threads to spawn.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Added "maxScreeningAttempts" property to CM.
 * </li>
 * <li>
 * fetchRequest, pullRequests, placeRequest were modified to add the new screening attempts treatment.
 * </li>
 * <li>
 * rollbackRequest added to prepare the request to be reprocessed.
 * </li>
 * <li>
 * run() was changed to test Screening for success or failure and completeRequest or rollbackRequest as needed.
 * </li>
 * </ol>
 *
 * @author WishingBone, pulky
 * @version 1.0.2
 */
public class ScreeningJob extends TimerTask {

    /**
     * The namespace for the configuration.
     */
    private static final String NAMESPACE = "com.topcoder.apps.screening.ScreeningJob";

    /**
     * The name of the property in the configuration file that contains the number of threads.
     */
    private static final String THREAD_NUMBER_PROPERTY_NAME = "thread_number";

    /**
     * The name of the property in the configuration file that contains the run interval.
     */
    private static final String RUN_INTERVAL_PROPERTY_NAME = "run_interval";

    /**
     * The name of the property in the configuration file that contains the screener id.
     */
    private static final String SCREENER_ID_PROPERTY_NAME = "screener_id";

    /**
     * The name of the property in the configuration file that contains the maximum screening attempts.
     *
     * @since 1.0.1
     */
    private static final String MAX_SCREENING_ATTEMPTS_PROPERTY_NAME = "max_screening_attempts";

    /**
     * The maximum number of screening attempts permitted.
     *
     * @since 1.0.1
     */
    private static final int MAX_SCREENING_ATTEMPTS_PERMITTED = 99;

    /**
     * The default number of screening attempts.
     *
     * @since 1.0.1
     */
    private static final int DEFAULT_SCREENING_ATTEMPTS = 3;

    /**
     * One ScreeningTool is used among threads since the screen() method is stateless.
     */
    private ScreeningTool tool = null;

    /**
     * The number of screening threads.
     */
    private int num = 1;

    /**
     * The screener id.
     */
    private int screener = 1;

    /**
     * The threads used to screening. They are ScreeningThread instances.
     */
    private Thread[] threads = null;

    /**
     * Whether the job is running.
     */
    private boolean isRunning = false;

    /**
     * A map of last screening timestamps mapped from submitter ids to implement the round robin dispatch.
     */
    private Map history = new HashMap();

    /**
     * The log to use.
     */
    private Logger log = null;

    /**
     * The max screening attempts for a screening task.
     *
     * @since 1.0.1
     */
    private int maxScreeningAttempts;

    /**
     * Creates a ScreeningJob. It initializes all the fields and could propagate exception to command line.
     *
     * @param num the number of threads to use.
     * @param screener the screener number to use.
     * @param maxScreeningAttempts the number of screening attempts to use.
     *
     * @throws Exception to command line.
     */
    private ScreeningJob(int num, int screener, int maxScreeningAttempts) throws Exception {
        this.tool = new ScreeningTool();
        this.num = num;
        this.screener = screener;
        this.maxScreeningAttempts = maxScreeningAttempts;
        this.threads = new Thread[num];
        log = Logger.getLogger(ScreeningJob.class);
        cleanOldResults();
        resetPendingTasks();
    }

    /**
     * The task body.
     */
    public void run() {
        // This prevents running with the last invocation.
        if (isRunning) {
            return;
        }
        isRunning = true;

        try {
            log.info("Running at " + new Date() + ".");
            // If all the threads are running, just quite this iteration.
            if (getCurrentLoad() == this.num) {
                log.info("All jobs are loaded.");
                return;
            }

            // Pull all the pending request from database queue.
            List requests = pullRequests();
            log.info("Pulled " + requests.size() + " tasks.");

            // Tries to dispatch tasks for the threads.
            for (int i = 0; i < this.num; ++i) {
                if (this.threads[i] == null || !this.threads[i].isAlive()) {
                    // Pick a request.
                    IScreeningRequest request = fetchRequest(requests);
                    if (request == null) {
                        return;
                    }

                    // Spawn a new thread to run it.
                    this.threads[i] = new ScreeningThread(request, i + 1);
                    this.threads[i].start();
                }
            }
        } finally {
            isRunning = false;
        }
    }

    /**
     * Get current load.
     *
     * @return current load.
     */
    private int getCurrentLoad() {
        int load = 0;
        for (int i = 0; i < this.num; ++i) {
            if (this.threads[i] != null && this.threads[i].isAlive()) {
                ++load;
            }
        }
        return load;
    }

    /**
     * Reset all screenings not finished by this screener.
     */
    private void cleanOldResults() {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement(
                    "DELETE FROM screening_result " +
                    "WHERE (DATE(current) - DATE(create_date)) > 180");
            int cnt = stmt.executeUpdate();
            log.info(cnt + " old results cleaned.");
        } catch (SQLException sqle) {
            log.error("Could not clean old results: " + sqle.toString());
        } finally {
            DbHelper.dispose(conn, stmt, null);
        }
    }

    /**
     * Reset all screenings not finished by this screener.
     */
    private void resetPendingTasks() {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement(
                    "DELETE FROM screening_result " +
                    "WHERE screening_task_id IN " +
                    "(SELECT screening_task_id FROM screening_task " +
                    " WHERE screened_ind = 0 and screener_id = ?)");
            stmt.setLong(1, screener);
            stmt.executeUpdate();
            stmt = null;

            stmt = conn.prepareStatement(
                    "UPDATE screening_task " +
                    "SET screener_id = NULL " +
                    "WHERE screened_ind = 0 and screener_id = ?");
            stmt.setLong(1, screener);
            stmt.executeUpdate();
        } catch (SQLException sqle) {
            log.error(sqle.toString());
        } finally {
            DbHelper.dispose(conn, stmt, null);
        }
    }

    /**
     * Pull all the screening requests from database queue.
     * Only pulls the request that have been processed less than "maxScreeningAttempts" times
     *
     * @return a list of ScreeningRequest instances.
     */
    private List pullRequests() {
        List requests = new ArrayList();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement(
                "SELECT st.screening_task_id, su.submitter_id, st.submission_v_id, st.submission_path, st.screening_project_type_id " +
                "FROM submission su, screening_task st " +
                "WHERE su.submission_v_id = st.submission_v_id AND st.screener_id IS NULL " +
                "AND st.screened_ind = 0 AND st.screening_attempts < ?");

            stmt.setLong(1, maxScreeningAttempts);
            rs = stmt.executeQuery();

            while (rs.next()) {
                long taskId = rs.getLong(1);
                long submitterId = rs.getLong(2);
                long submissionVId = rs.getLong(3);
                String submissionPath = rs.getString(4);
                ProjectType projectType = ProjectType.getProjectType(rs.getLong(5));

                requests.add(new SubmissionScreeningRequest(taskId, submitterId, submissionVId, submissionPath, projectType));
            }

            rs.close();
            stmt.close();

            stmt = conn.prepareStatement(
                    "SELECT st.screening_task_id, sp.specification_uploader_id, sp.specification_id, st.submission_path, st.screening_project_type_id " +
                    "FROM specification sp, screening_task st " +
                    "WHERE sp.specification_id = st.specification_id AND st.screener_id IS NULL " +
                    "AND st.screened_ind = 0 AND st.screening_attempts < ?");

            stmt.setLong(1, maxScreeningAttempts);
            rs = stmt.executeQuery();

            while (rs.next()) {
                long taskId = rs.getLong(1);
                long submitterId = rs.getLong(2);
                long specificationId = rs.getLong(3);
                String specificationPath = rs.getString(4);
                ProjectType projectType = ProjectType.getProjectType(rs.getLong(5));

                requests.add(new SpecificationScreeningRequest(taskId, submitterId, specificationId, specificationPath, projectType));
            }

            rs.close();
            stmt.close();

        } catch (SQLException sqle) {
            log.error(sqle.toString());
        } finally {
            DbHelper.dispose(conn, stmt, rs);
        }

        return requests;
    }

    /**
     * Fetch a request from the list of requests.
     * Also updates the screening_atempts counter.
     *
     * @param requests a list of requests to select from.
     *
     * @return the request for screening or null if non is selected.
     */
    private IScreeningRequest fetchRequest(List requests) {
        while (requests.size() > 0) {
            IScreeningRequest request = pickRequest(requests);
            put(request);

            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = DbHelper.getConnection();
                stmt = conn.prepareStatement("UPDATE screening_task SET screener_id = ?, " +
                    "screening_attempts = screening_attempts + 1 WHERE screening_task_id = ? AND screener_id IS NULL");
                stmt.setLong(1, this.screener);
                stmt.setLong(2, request.getTaskId());

                // This ensures that multiple instances will not extract the same request.
                if (stmt.executeUpdate() == 1) {
                    return request;
                }
            } catch (SQLException sqle) {
            log.error(sqle.toString());
            } finally {
                DbHelper.dispose(conn, stmt, null);
            }
        }
        return null;
    }

    /**
     * Remove a request from task table.
     *
     * @param taskId the task id.
     */
    private void completeRequest(long taskId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement("UPDATE screening_task SET screened_ind = 1 WHERE screening_task_id = ?");
            stmt.setLong(1, taskId);
            stmt.executeUpdate();
        } catch (SQLException sqle) {
            log.error(sqle.toString());
        } finally {
            DbHelper.dispose(conn, stmt, null);
        }
    }

    /**
     * Rolls back a request so it can be reprocessed.
     *
     * @param taskId the task id.
     *
     * @since 1.0.1
     */
    private void rollbackRequest(long taskId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement(
                    "DELETE FROM screening_result " +
                    "WHERE screening_task_id = ?");
            stmt.setLong(1, taskId);
            try {
                stmt.executeUpdate();
            } catch (SQLException sqle) {
                log.error("Could not rollback screening_results: " + sqle.toString());
            }
            stmt = null;

            stmt = conn.prepareStatement(
                    "UPDATE screening_task " +
                    "SET screener_id = NULL " +
                    "WHERE screener_id = ?");
            stmt.setLong(1, screener);
            stmt.executeUpdate();
        } catch (SQLException sqle) {
            log.error(sqle.toString());
        } finally {
            DbHelper.dispose(conn, stmt, null);
        }
    }

    /**
     * Pick a request from a list of requests.
     *
     * @param requests a list of requests to select from.
     *
     * @return the request chosen.
     */
    private IScreeningRequest pickRequest(List requests) {
        if (requests.size() == 0) {
            return null;
        }
        IScreeningRequest chosen = null;
        for (int i = 0; i < requests.size(); ++i) {
            IScreeningRequest request = (IScreeningRequest) requests.get(i);
            long time = get(request);
            if (time == -1) {
                chosen = request;
                break;
            }
            if (chosen == null || time < get(chosen)) {
                chosen = request;
            }
        }
        requests.remove(chosen);
        return chosen;
    }

    /**
     * Get the last millisecond timestamp the submitter is screened.
     *
     * @param request the request for the submitter.
     *
     * @return a millisecond timestamp, or -1 if no record exists.
     */
    private long get(IScreeningRequest request) {
        Long value = (Long) this.history.get(new Long(request.getSubmitterId()));
        if (value == null) {
            return -1;
        }
        return value.longValue();
    }

    /**
     * Place a record for the submitter with the current time.
     *
     * @param request the request for the submitter.
     */
    private void put(IScreeningRequest request) {
        this.history.put(new Long(request.getSubmitterId()), new Long(System.currentTimeMillis()));
    }

    /**
     * Get the version id for the current submission.
     *
     * @param submissionId the submission id.
     *
     * @return the submission version id.
     *
     */
    public static long getVersionId(long submissionId) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            return getVersionId(submissionId, conn);
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }

    /**
     * Get the version id for the current submission, using a specified connection.
     *
     * @param submissionId the submission id.
     * @param conn the connection to use.
     *
     * @return the submission version id.
     */
    public static long getVersionId(long submissionId, Connection conn) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement("SELECT submission_v_id FROM submission WHERE submission_id = ? " +
                "AND cur_version = 1");
            stmt.setLong(1, submissionId);
            rs = stmt.executeQuery();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException sqle) {
            throw new DatabaseException("getVersionId() fails.", sqle);
        } finally {
            DbHelper.dispose(null, stmt, rs);
        }
    }

    /**
     * Place a request in the database queue.
     *
     * @param request the request to place.
     */
    public static void placeRequest(IScreeningRequest request) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            if (request instanceof SubmissionScreeningRequest) {
                placeRequest((SubmissionScreeningRequest) request, conn);
            } else if (request instanceof SpecificationScreeningRequest) {
                placeRequest((SpecificationScreeningRequest) request, conn);
            }
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }

    /**
     * Place a request in the database queue, using a specific connection. Initializes screening_attempts with 0.
     *
     * @param request the request to place.
     * @param conn the connection to use.
     */
    public static void placeRequest(IScreeningRequest request, Connection conn) {
        PreparedStatement stmt = null;
        try {
            if (request instanceof SubmissionScreeningRequest) {
                stmt = conn.prepareStatement("INSERT INTO screening_task(screening_task_id, submission_path, " +
                "screening_project_type_id, screening_attempts, submission_v_id, screened_ind) VALUES(?, ?, ?, ?, ?, ?)");
            } else if (request instanceof SpecificationScreeningRequest){
                stmt = conn.prepareStatement("INSERT INTO screening_task(screening_task_id, submission_path, " +
                "screening_project_type_id, screening_attempts, specification_id, screened_ind) VALUES(?, ?, ?, ?, ?, ?)");
            }

            if (request.getTaskId() == -1) {
                request.setTaskId(generateNewTaskID());
            }

            stmt.setLong(1, request.getTaskId());
            stmt.setString(2, request.getArtifactPath());
            stmt.setLong(3, request.getProjectType().getId());
            stmt.setLong(4, 0);
            stmt.setLong(5, request.getArtifactId());
            stmt.setLong(6, 0);
            stmt.executeUpdate();
        } catch (SQLException sqle) {
            throw new DatabaseException("placeRequest() fails.", sqle);
        } catch (IDGenerationException e) {
            throw new DatabaseException("Unable to generate ID.", e);
        } finally {
            DbHelper.dispose(null, stmt, null);
        }
    }

    /**
     * Generates tasks Ids
     *
     * @return the next Id
     */
    private static long generateNewTaskID() throws IDGenerationException {
        IDGenerator gen = IDGeneratorFactory.getIDGenerator("SCREENING_TASK_SEQ");
        return gen.getNextID();
    }

    /**
     * Worker thread to perform the screening.
     */
    class ScreeningThread extends Thread {

        /**
         * The request to screen.
         */
        private IScreeningRequest request = null;

        /**
         * The thread id.
         */
        private int id = 0;

        /**
         * Create instance with the request to screen.
         *
         * @param request the request to screen.
         */
        ScreeningThread(IScreeningRequest request, int id) {
            this.request = request;
            this.id = id;
        }

        /**
         * Thread body. Simply perform the screen.
         */
        public void run() {
            StringBuffer buffer = new StringBuffer();
            buffer.append("screening submitter ");
            buffer.append(request.getSubmitterId());
            buffer.append(" submission ");
            buffer.append(request.getArtifactId());
            buffer.append(" of type ");
            buffer.append(request.getProjectType().getName());
            buffer.append(" from ");
            buffer.append(request.getArtifactPath());
            buffer.append(" at ");

            log.info("Thread " + id + ": start " + buffer.toString() + new Date());
            log.info("Current load " + getCurrentLoad() + "/" + num);

            // runs screening, if succeded, completes the request, otherwise, rolbacks it to be reprocessed.
            boolean successfullScreen = tool.screen(request, log);
            if (successfullScreen) {
                log.info("tool.screen completed successfully.");
                completeRequest(request.getTaskId());
            } else {
                log.info("tool.screen unsuccessfully.");
                rollbackRequest(request.getTaskId());
            }

            log.info("Thread " + id + ": end " + buffer.toString() + new Date());
            log.info("Current load " + (getCurrentLoad() - 1) + "/" + num);
        }
    }

    /**
     * Command line entry. Contains a single argument - the number of threads to use. Could be absent which means
     * to run single thread.
     *
     * @param args the arguments.
     *
     * @throws Exception to command line.
     */
    public static void main(String[] args) throws Exception {
        ConfigManager cm = ConfigManager.getInstance();
        boolean namespaceExists = cm.existsNamespace(NAMESPACE);
        int num = 1;
        if (args.length > 0) {
            num = Integer.parseInt(args[0]);
        } else if (namespaceExists) {
            String value = cm.getString(NAMESPACE, THREAD_NUMBER_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                num = Integer.parseInt(value);
            }
        }
        int interval = 30;
        if (args.length > 1) {
            interval = Integer.parseInt(args[1]);
        } else if (namespaceExists) {
            String value = cm.getString(NAMESPACE, RUN_INTERVAL_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                interval = Integer.parseInt(value);
            }
        }
        int screener = 1;
        if (args.length > 2) {
            screener = Integer.parseInt(args[2]);
        } else if (namespaceExists) {
            String value = cm.getString(NAMESPACE, SCREENER_ID_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                screener = Integer.parseInt(value);
            }
        }

        int maxScreeningAttempts = DEFAULT_SCREENING_ATTEMPTS;
        if (namespaceExists) {
            String value = cm.getString(NAMESPACE, MAX_SCREENING_ATTEMPTS_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                maxScreeningAttempts = Integer.parseInt(value);
                if (maxScreeningAttempts > MAX_SCREENING_ATTEMPTS_PERMITTED) {
                    System.out.println("Screening attempts = " + maxScreeningAttempts +
                        " exceeds maximum permitted (" + MAX_SCREENING_ATTEMPTS_PERMITTED +
                            "), the maximum value will be used.");
                    maxScreeningAttempts = MAX_SCREENING_ATTEMPTS_PERMITTED;
                }
            }
        }

        System.out.println("Number of threads = " + num);
        System.out.println("Interval = " + interval);
        System.out.println("Screener ID = " + screener);
        System.out.println("Max screening attempts = " + maxScreeningAttempts);

        // Schedule it immediate and run per second.
        new Timer(false).schedule(new ScreeningJob(num, screener, maxScreeningAttempts), 0, interval * 1000);
    }
}
