/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import java.sql.Connection;

/**
 * <strong>Purpose</strong>:
 * The interface that defines the contract to be met by classes used to obtain details about auto-screening
 * run for a particular submission, or a project.
 *
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public interface QueryInterface {

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
    ScreeningResponse[] getSubmissionDetails(long submissionVId);
    ScreeningResponse[] getCurrentSubmissionDetails(long submissionId);

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
    ScreeningResponse[] getSubmissionDetails(long submissionVId, Connection conn);
    ScreeningResponse[] getCurrentSubmissionDetails(long submissionId, Connection conn);
    
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
    ScreeningRecord[] getSubmissionStatus(long projectId, long submitterId);
    
    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening processes run for all submission by a given submitter to a given project.
     * Each response code and dynamic response text will be returned. This version of the method uses a specified connection.
     *
     * <strong>Valid Args</strong>:
     * An integer.
     *
     * <strong>Valid Return Values</strong>:
     * A String.
     *
     * @param projectId The id of the project to investigate.
     * @param submitterId the identifier for a submitter.
     * @param conn The connection to use.
     * @return An XML String containing the results of the query.
     * @throws InvalidProjectNameException if the 'project' parameter does not correspond to an existing project.
     * @throws InvalidSubmitterIdException if the 'submitterId' parameter does not correspond to an exisiting
     *                                     submitter.
     * @throws DatabaseException if an error occured at the database level while attempting to retrieve the results.
     */
    ScreeningRecord[] getSubmissionStatus(long projectId, long submitterId, Connection conn);

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
    ScreeningRecord[] getAllSubmissions(long projectId);

    /**
     * <strong>Purpose</strong>:
     * Obtains details about the screening processes run for all submissions to a particular project. Each response
     * code and dynamic response text will be returned. This version of the method uses a specified connection.
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
    ScreeningRecord[] getAllSubmissions(long projectId, Connection conn);
    
}
