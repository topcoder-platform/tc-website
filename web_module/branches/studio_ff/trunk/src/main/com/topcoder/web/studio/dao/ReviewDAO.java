/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.dto.Review;

/**
 * <p>Review DAO.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
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
}
