/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import java.util.List;

import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;

/**
 * <p>The Java Data Access Object interface responsible for handling the <code>Submission</code>
 * class.</p>
 *
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Changes notes:
 *   <ol>
 *     <li>Logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pvmagacho
 * version 1.1
 */
public interface SubmissionDAO {
    /**
     * <p>Find by ID the <code>Submission</code> instance from persistence.</p>
     *
     * @param id the unique identifier for the <code>Submission</code> instance
     * @return the found <code>Submission</code> instance. <code>null</code> if not found.
     */
    public Submission find(Integer id);
    
    /**
     * <p>Creates or updates the <code>Submission</code> instance in the persistence.</p>
     *
     * <p>When creating, an unique identifier is created by the database.</p>
     *
     * @param submission the <code>Submission</code> instance to be saved or updated
     * @since 1.1
     */    
    public void saveOrUpdate(Submission submission);
    
    /**
     * <p>Gets the maximum user rank for all submission uploads.</p>
     *
     * @param uploads the list of submission uploads used to find the maximum rank
     * @return the maximum submission's user rank
     * @since 1.1
     */    
    public Integer getMaxRank(List<Upload> uploads);
    
    /**
     * <p>Changes the user rank for a given submission.</p>
     *
     * <p>Affects all submissions above or below, depending if the new rank is increasing or decreasing.</p>
     *
     * @param newRank the new user rank
     * @param s the <code>Submission</code> instance to be updated
     * @param uploads the list of submission uploads to use to find submission will be reordered
     * @since 1.1
     */    
    public void changeRank(Integer newRank, Submission s, List<Upload> uploads);
    
    /**
     * <p>Finds a list of <code>Submission</code> instances from persistence.</p>
     *
     * @param uploads the list of submission uploads used to find the submission
     * @param submissionTypeId the submission type identifier
     * @param submissionStatusId the submission status identifier
     * @return a list with <code>Submission</code> instance or <code>null</code> if none is found.
     */
    public List<Submission> getSubmissions(List<Upload> uploads, Integer submissionTypeId, Integer submissionStatusId);

     /**
     * <p>Finds a list of <code>Submission</code> instances from persistence.</p>
     *
     * @param uploads the list of submission uploads used to find the submission
     * @param submissionTypeIds the submission type ids
     * @param submissionStatusIds the submission status ids
     * @return a list with <code>Submission</code> instance or <code>null</code> if none is found.
     */
    public List<Submission> getSubmissions(List<Upload> uploads, List<Integer> submissionTypeIds, List<Integer> submissionStatusIds);
}

