/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.shared.util.logging.Logger;
import java.util.Timer;
import java.util.TimerTask;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Date;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <strong>Purpose</strong>:
 * This is the command line utility that runs the screening. It is a TimerTask which is run once every second.
 * The command line could accept a single argument which is the number of threads to spawn.
 *
 * @author WishingBone
 * @version 1.0
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
     * The log name.
     */
    private final static String LOG_NAME = "Automated_Screening";

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
     * Creates a ScreeningJob. It initializes all the fields and could propagate exception to command line.
     *
     * @param num the number of threads to use.
     *
     * @throws Exception to command line.
     */
    private ScreeningJob(int num, int screener) throws Exception {
        this.tool = new ScreeningTool();
        this.num = num;
        this.screener = screener;
        this.threads = new Thread[num];
        resetPendingTasks();
        log = Logger.getLogger(ScreeningJob.class);
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
                    ScreeningRequest request = fetchRequest(requests);
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
    private void resetPendingTasks() {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement(
                    "DELETE FROM screening_results " +
                    "WHERE submission_v_id IN " +
                    "(SELECT submission_v_id FROM screening_task WHERE screener_id = ?)");
            stmt.setLong(1, screener);
            stmt.executeUpdate();
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
     * Pull all the screening requests from database queue.
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
                    "SELECT submitter_id, screening_task.submission_v_id, submission_path, screening_project_type_id " +
                    "FROM submission, screening_task " +
                    "WHERE submission.submission_v_id = screening_task.submission_v_id AND screener_id IS NULL");
            rs = stmt.executeQuery();

            while (rs.next()) {
                long submitterId = rs.getLong(1);
                long submissionVId = rs.getLong(2);
                String submissionPath = rs.getString(3);
                ProjectType projectType = ProjectType.getProjectType(rs.getLong(4));

                requests.add(new ScreeningRequest(submitterId, submissionVId, submissionPath, projectType));
            }
        } catch (SQLException sqle) {
            log.error(sqle.toString());
        } finally {
            DbHelper.dispose(conn, stmt, rs);
        }

        return requests;
    }

    /**
     * Fetch a request from the list of requests.
     *
     * @param requests a list of requests to select from.
     *
     * @return the request for screening or null if non is selected.
     */
    private ScreeningRequest fetchRequest(List requests) {
        while (requests.size() > 0) {
            ScreeningRequest request = pickRequest(requests);
            put(request);

            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = DbHelper.getConnection();
                stmt = conn.prepareStatement("UPDATE screening_task SET screener_id = ? WHERE submission_v_id = ? AND screener_id IS NULL");
                stmt.setLong(1, this.screener);
                stmt.setLong(2, request.getSubmissionVId());

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
     * @param submissionVId the submission version id.
     */
    private void completeRequest(long submissionVId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement("DELETE FROM screening_task WHERE submission_v_id = ?");
            stmt.setLong(1, submissionVId);
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
    private ScreeningRequest pickRequest(List requests) {
        if (requests.size() == 0) {
            return null;
        }
        ScreeningRequest chosen = null;
        for (int i = 0; i < requests.size(); ++i) {
            ScreeningRequest request = (ScreeningRequest) requests.get(i);
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
    private long get(ScreeningRequest request) {
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
    private void put(ScreeningRequest request) {
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
            stmt = conn.prepareStatement("SELECT submission_v_id FROM submission WHERE submission_id = ? AND cur_version = 1");
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
    public static void placeRequest(ScreeningRequest request) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            placeRequest(request, conn);
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }
    
    /**
     * Place a request in the database queue, using a specific connection.
     *
     * @param request the request to place.
     * @param conn the connection to use.
     */
    public static void placeRequest(ScreeningRequest request, Connection conn) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement(
                    "INSERT INTO screening_task(submission_v_id, submission_path, screening_project_type_id) VALUES(?, ?, ?)");
            stmt.setLong(1, request.getSubmissionVId());
            stmt.setString(2, request.getSubmissionPath());
            stmt.setLong(3, request.getProjectType().getId());
            stmt.executeUpdate();
        } catch (SQLException sqle) {
            throw new DatabaseException("placeRequest() fails.", sqle);
        } finally {
            DbHelper.dispose(null, stmt, null);
        }
    }

    /**
     * Worker thread to perform the screening.
     */
    class ScreeningThread extends Thread {

        /**
         * The request to screen.
         */
        private ScreeningRequest request = null;

        /**
         * The thread id.
         */
        private int id = 0;

        /**
         * Create instance with the request to screen.
         *
         * @param request the request to screen.
         */
        ScreeningThread(ScreeningRequest request, int id) {
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
            buffer.append(request.getSubmissionVId());
            buffer.append(" of type ");
            buffer.append(request.getProjectType().getName());
            buffer.append(" from ");
            buffer.append(request.getSubmissionPath());
            buffer.append(" at ");

            log.info("Thread " + id + ": start " + buffer.toString() + new Date());
            log.info("Current load " + getCurrentLoad() + "/" + num);

            tool.screen(log, new File(request.getSubmissionPath()), request.getProjectType(), request.getSubmissionVId());
            completeRequest(request.getSubmissionVId());

            log.info("Thread " + id + ": end " + buffer.toString() + new Date());
            log.info("Current load " + (getCurrentLoad() - 1) + "/" + num);
        }

    }

    /**
     * Command line entry. Contains a single argument - the number of threads to use. Could be absent which means to run single thread.
     *
     * @param args the arguments.
     *
     * @throws Exception to command line.
     */
    public static void main(String[] args) throws Exception {
        ConfigManager cm = ConfigManager.getInstance();
        int num = 1;
        if (args.length > 0) {
            num = Integer.parseInt(args[0]);
        } else if (cm.existsNamespace(NAMESPACE)) {
            String value = cm.getString(NAMESPACE, THREAD_NUMBER_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                num = Integer.parseInt(value);
            }
        }
        int interval = 30;
        if (args.length > 1) {
            interval = Integer.parseInt(args[1]);
        } else if (cm.existsNamespace(NAMESPACE)) {
            String value = cm.getString(NAMESPACE, RUN_INTERVAL_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                interval = Integer.parseInt(value);
            }
        }
        int screener = 1;
        if (args.length > 2) {
            screener = Integer.parseInt(args[2]);
        } else if (cm.existsNamespace(NAMESPACE)) {
            String value = cm.getString(NAMESPACE, SCREENER_ID_PROPERTY_NAME);
            if (value != null && value.trim().length() > 0) {
                screener = Integer.parseInt(value);
            }
        }

        System.out.println("Number of threads = " + num);
        System.out.println("Interval = " + interval);
        System.out.println("Screener ID = " + screener);

        // Schedule it immediate and run per second.
        new Timer(false).schedule(new ScreeningJob(num, screener), 0, interval * 1000);
    }

}
