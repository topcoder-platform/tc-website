/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

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
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public class ScreeningLogger {

    /**
     * <strong>Purpose</strong>:
     * Identifier for the user that is performing the logging operation. This value is provided for audit purposes
     * and will be stored in the database along with the audit information.
     *
     * <strong>Valid Args</strong>:
     * A non-null String.
     */
    private long userId = 1;

    /**
     * <strong>Purpose</strong>:
     * Submission version id.
     */
    private long submissionVId = -1;

    /**
     * <strong>Purpose</strong>:
     * The id generator to generate the screening result ids.
     */
    private IdGen idGen;

    /**
     * <strong>Purpose</strong>:
     * Creates an instance of this class.
     */
    public ScreeningLogger() {
        initializeIdGen();
    }

    /**
     * <strong>Purpose</strong>:
     * Creates an instance of this class and initialises the attributes using the corresponding parameter values.
     *
     * <strong>Valid Args</strong>:
     * Two non-null strings and an integer.
     *
     * @param userId The user for audit purposes.
     * @param submissionVId The submission id to log.
     */
    public ScreeningLogger(long userId, long submissionVId) {
        this.userId = userId;
        setSubmissionVId(submissionVId);
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
            stmt = conn.prepareStatement("INSERT INTO screening_results" +
                "(screening_results_id, dynamic_response_text, screening_response_id, create_user, create_date, submission_v_id)" +
                " VALUES(?, ?, ?, ?, ?, ?)");
            stmt.setLong(1, idGen.nextId());
            stmt.setString(2, message.getResponseText());
            stmt.setLong(3, message.getResponseId());
            stmt.setLong(4, this.userId);
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            stmt.setLong(6, this.submissionVId);
            stmt.executeUpdate();
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
            stmt = conn.prepareStatement("UPDATE submission SET passed_auto_screening = ? WHERE submission_v_id = ?");
            stmt.setBoolean(1, message.isSuccess());
            stmt.setLong(2, this.submissionVId);
            stmt.executeUpdate();
        } catch (SQLException sqle) {
            throw new DatabaseException("Log result fails.", sqle);
        } finally {
            DbHelper.dispose(conn, stmt, null);
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Obtains the database identifier of the submission for which messages will be logged.
     *
     * <strong>Valid Return Values</strong>:
     * An integer.
     *
     * @return The database identifier of the submitter.
     */
    public long getSubmissionVId() {
        return this.submissionVId;
    }

    /**
     * <strong>Purpose</strong>:
     * Sets the database identifier for the submitter for which messages will be logged.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * @param submissionId The database identifier of the submitter.
     */
    public void setSubmissionVId(long submissionVId) {
/*        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DbHelper.getConnection();
            stmt = conn.prepareStatement("SELECT submission_v_id FROM submission WHERE submission_id = ? AND cur_version = 1");
            stmt.setLong(1, submissionId);
            rs = stmt.executeQuery();
            rs.next();
            this.submissionVId = rs.getLong(1);
        } catch (SQLException sqle) {
            throw new DatabaseException("Unable to get version id.", sqle);
        } finally {
            DbHelper.dispose(conn, stmt, rs);
        }
        this.submissionId = submissionId;*/
        this.submissionVId = submissionVId;
    }

}
