/*
 * Copyright (C) 2011-2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.dto.Review;

/**
 * <p>Review DAO.</p>
 * 
 * <p>
 * Version 1.1 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #getReviewByPhase(long)} method.</li>
 *   </ol>
 * </p>
 * 
 * @author isv
 * @version 1.1
 * @since Replatforming Studio Release 5
 */
public interface ReviewDAO {
    /**
     * Gets a <code>Review</code> using the review id.
     * 
     * @param id the review id
     * @return the <code>Review</code> instance with the specified id
     */
    public Review find(Long id);

    /**
     * <p>Gets the review matching the specified project phase.</p>
     * 
     * @param projectPhaseId a <code>long</code> providing the ID of a project phase to get review for.
     * @return a <code>Review</code> matching the specified project phase or <code>null</code> if there is no such 
     *         review. 
     * @since 1.1        
     */
    public Review getReviewByPhase(long projectPhaseId);
}
