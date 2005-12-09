/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

/**
 * <strong>Purpose</strong>:
 * Implementation of the query interface.
 *
 * @author WishingBone
 * @version 1.0
 */
public class XmlQuery implements QueryInterface {

    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening process that was run for a particular submission. Each response code
     * and dynamic response text will be returned.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param submissionVId The database identifier of the submission.
     * @return An XML String containing the results of the query.
     * @throws InvalidSubmissionIdException if the parameter does not correspond to any submission.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    public ScreeningResponse[] getSubmissionDetails(long submissionVId) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            return getSubmissionDetails(submissionVId, conn);
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }
    
    public ScreeningResponse[] getCurrentSubmissionDetails(long submissionId) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            return getCurrentSubmissionDetails(submissionId, conn);
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }
    
    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening process that was run for a particular submission. Each response code
     * and dynamic response text will be returned. This version of the method uses a specified connection.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param submissionVId The database identifier of the submission.
     * @param conn The connection to use.
     * @return An XML String containing the results of the query.
     * @throws InvalidSubmissionIdException if the parameter does not correspond to any submission.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    public ScreeningResponse[] getSubmissionDetails(long submissionVId, Connection conn) {
        List responses = null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement(
                    "SELECT severity_text, response_code, response_text, dynamic_response_text, screening_results_id " +
                    "FROM response_severity_lu, screening_response_lu, screening_results, submission " +
                    "WHERE response_severity_lu.response_severity_id = screening_response_lu.response_severity_id " +
                    "AND screening_response_lu.screening_response_id = screening_results.screening_response_id " +
                    "AND screening_results.submission_v_id = ? " +
                    "AND submission.submission_v_id = screening_results.submission_v_id " +
                    "AND (passed_auto_screening = 0 OR passed_auto_screening = 1) " +
                    "ORDER BY response_code ASC, screening_results_id ASC");
            stmt.setLong(1, submissionVId);
            rs = stmt.executeQuery();
            responses = buildResult(rs);
        } catch (SQLException sqle) {
            throw new DatabaseException("getSubmissionDetails() fails.", sqle);
        } finally {
            DbHelper.dispose(null, stmt, rs);
        }

        return (ScreeningResponse[]) responses.toArray(new ScreeningResponse[responses.size()]);
    }

    public ScreeningResponse[] getCurrentSubmissionDetails(long submissionId, Connection conn) {
        List responses = null;

        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement(
                    "SELECT severity_text, response_code, response_text, dynamic_response_text, screening_results_id " +
                    "FROM response_severity_lu, screening_response_lu, screening_results, submission " +
                    "WHERE response_severity_lu.response_severity_id = screening_response_lu.response_severity_id " +
                    "AND screening_response_lu.screening_response_id = screening_results.screening_response_id " +
                    "AND screening_results.submission_v_id = submission.submission_v_id " +
                    "AND submission.submission_id = ? " +
                    "AND cur_version = 1 " +
                    "AND (passed_auto_screening = 0 OR passed_auto_screening = 1) " +
                    "ORDER BY response_code ASC, screening_results_id ASC");
            stmt.setLong(1, submissionId);
            rs = stmt.executeQuery();
            responses = buildResult(rs);
        } catch (SQLException sqle) {
            throw new DatabaseException("getCurrentSubmissionDetails() fails.", sqle);
        } finally {
            DbHelper.dispose(null, stmt, rs);
        }

        return (ScreeningResponse[]) responses.toArray(new ScreeningResponse[responses.size()]);
    }

    private List buildResult(ResultSet rs) throws SQLException {
        List responses = new ArrayList();
        ScreeningResponse response = null;
        List text = new ArrayList();
        while (rs.next()) {
            String code = null;
            if (rs.getLong(2) < 10) {
                code = "TCS-00" + String.valueOf(rs.getLong(2));
            } else if (rs.getLong(2) < 100) {
                code = "TCS-0" + String.valueOf(rs.getLong(2));
            } else {
                code = "TCS-" + String.valueOf(rs.getLong(2));
            }
            if (response == null || !code.equals(response.getCode())) {
                if (response != null) {
                    response.setText((String[]) text.toArray(new String[text.size()]));
                    text.clear();
                }
                response = new ScreeningResponse();
                responses.add(response);
                response.setSeverity(rs.getString(1));
                response.setCode(code);
                response.setResponse(rs.getString(3));
            }
            if (rs.getString(4) != null && rs.getString(4).length() > 0) {
                text.add(rs.getString(4));
            }
        }
        if (response != null) {
            response.setText((String[]) text.toArray(new String[text.size()]));
        }
        return responses;
    }

    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening processes run for all submission by a given submitter to a given project.
     * Each response code and dynamic response text will be returned.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param projectId The id of the project to investigate.
     * @param submitterId the identifier for a submitter.
     * @return An XML String containing the results of the query.
     * @throws InvalidProjectNameException if the 'project' parameter does not correspond to an existing project.
     * @throws InvalidSubmitterIdException if the 'submitterId' parameter does not correspond to an exisiting
     *                                     submitter.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    public ScreeningRecord[] getSubmissionStatus(long projectId, long submitterId) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            return getSubmissionStatus(projectId, submitterId, conn);
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }
    
    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening processes run for all submission by a given submitter to a given project.
     * Each response code and dynamic response text will be returned.  This version of the method uses a specified connection.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param projectId The id of the project to investigate.
     * @param submitterId The identifier for a submitter.
     * @param conn The connection to use.
     * @return An XML String containing the results of the query.
     * @throws InvalidProjectNameException if the 'project' parameter does not correspond to an existing project.
     * @throws InvalidSubmitterIdException if the 'submitterId' parameter does not correspond to an exisiting
     *                                     submitter.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    public ScreeningRecord[] getSubmissionStatus(long projectId, long submitterId, Connection conn) {
        List submissions = new ArrayList();

        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            List warnings = new ArrayList();
            stmt = conn.prepareStatement(
                    "SELECT UNIQUE submission.submission_v_id " +
                    "FROM submission, screening_results, screening_response_lu, response_severity_lu " +
                    "WHERE passed_auto_screening = 1 " +
                    "AND project_id = ? AND submitter_id = ? " +
                    "AND submission.submission_v_id = screening_results.submission_v_id " +
                    "AND is_removed = 0 " +
                    "AND screening_results.screening_response_id = screening_response_lu.screening_response_id " +
                    "AND screening_response_lu.response_severity_id = response_severity_lu.response_severity_id " +
                    "AND (response_severity_lu.severity_text = 'Warning' OR response_severity_lu.severity_text = 'Fatal Error')");
            stmt.setLong(1, projectId);
            stmt.setLong(2, submitterId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                warnings.add(new Long(rs.getLong(1)));
            }
            rs.close();
            stmt.close();

            stmt = conn.prepareStatement(
                    "SELECT submission_v_id, submission_date, cur_version, passed_auto_screening " +
                    "FROM submission " +
                    "WHERE project_id = ? AND submitter_id = ? " +
                    "AND is_removed = 0 " +
                    "ORDER BY submission_date DESC");
            stmt.setLong(1, projectId);
            stmt.setLong(2, submitterId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                ScreeningRecord record = new ScreeningRecord();
                record.setSubmission(rs.getLong(1));
                record.setDate(rs.getDate(2));
                record.setCurrent(rs.getBoolean(3));
                if (rs.getObject(4) == null) {
                    record.setStatus("N/A");
                } else if (!rs.getBoolean(4)) {
                    record.setStatus("Fatal Error");
                } else if (warnings.contains(new Long(record.getSubmission()))) {
                    record.setStatus("Warning");
                } else {
                    record.setStatus("Success");
                }
                submissions.add(record);
            }
            rs.close();
            stmt.close();

        } catch (SQLException sqle) {
            throw new DatabaseException("getSubmissionStatus() fails.", sqle);
        } finally {
            DbHelper.dispose(null, stmt, rs);
        }

        return (ScreeningRecord[]) submissions.toArray(new ScreeningRecord[submissions.size()]);
    }

    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening processes run for all submissions to a particular project. Each response
     * code and dynamic response text will be returned.
     *
     * <strong>Valid Args</strong>:
     * A non-null string.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param project The id of the project to investigate.
     * @return An XML String containing the results of the query.
     * @throws InvalidProjectNameException if the 'project' parameter does not correspond to an existing project.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    public ScreeningRecord[] getAllSubmissions(long projectId) {
        Connection conn = null;
        try {
            conn = DbHelper.getConnection();
            return getAllSubmissions(projectId, conn);
        } finally {
            DbHelper.dispose(conn, null, null);
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening processes run for all submissions to a particular project. Each response
     * code and dynamic response text will be returned.  This version of the method uses a specified connection.
     *
     * <strong>Valid Args</strong>:
     * A non-null string.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param project The id of the project to investigate.
     * @param conn The connection to use.
     * @return An XML String containing the results of the query.
     * @throws InvalidProjectNameException if the 'project' parameter does not correspond to an existing project.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    public ScreeningRecord[] getAllSubmissions(long projectId, Connection conn) {
        List submissions = new ArrayList();

        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            List warnings = new ArrayList();
            stmt = conn.prepareStatement(
                    "SELECT UNIQUE submission.submission_v_id " +
                    "FROM submission, screening_results, screening_response_lu, response_severity_lu " +
                    "WHERE passed_auto_screening = 1 " +
                    "AND project_id = ? " +
                    "AND submission.submission_v_id = screening_results.submission_v_id " +
                    "AND is_removed = 0 " +
                    "AND screening_results.screening_response_id = screening_response_lu.screening_response_id " +
                    "AND screening_response_lu.response_severity_id = response_severity_lu.response_severity_id " +
                    "AND (response_severity_lu.severity_text = 'Warning' OR response_severity_lu.severity_text = 'Fatal Error')");
            stmt.setLong(1, projectId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                warnings.add(new Long(rs.getLong(1)));
            }
            rs.close();
            stmt.close();

            stmt = conn.prepareStatement(
                    "SELECT submission_v_id, submission_date, cur_version, passed_auto_screening, submitter_id, handle " +
                    "FROM submission, user " +
                    "WHERE project_id = ? " +
                    "AND submission.submitter_id = user.user_id " +
                    "AND is_removed = 0 " +
                    "ORDER BY submission_date DESC");
            stmt.setLong(1, projectId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                ScreeningRecord record = new ScreeningRecord();
                record.setSubmission(rs.getLong(1));
                record.setDate(rs.getDate(2));
                record.setCurrent(rs.getBoolean(3));
                if (rs.getObject(4) == null) {
                    record.setStatus("N/A");
                } else if (!rs.getBoolean(4)) {
                    record.setStatus("Fatal Error");
                } else if (warnings.contains(new Long(record.getSubmission()))) {
                    record.setStatus("Warning");
                } else {
                    record.setStatus("Success");
                }
                record.setSubmitter(rs.getLong(5));
                record.setHandle(rs.getString(6));
                submissions.add(record);
            }
            rs.close();
            stmt.close();

        } catch (SQLException sqle) {
            throw new DatabaseException("getSubmissionStatus() fails.", sqle);
        } finally {
            DbHelper.dispose(null, stmt, rs);
        }

        return (ScreeningRecord[]) submissions.toArray(new ScreeningRecord[submissions.size()]);
    }

}
