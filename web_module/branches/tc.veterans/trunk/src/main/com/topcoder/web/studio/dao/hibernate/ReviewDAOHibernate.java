/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.ReviewDAO;
import com.topcoder.web.studio.dto.Review;

/**
 * <p>Review DAO implementation.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ReviewDAOHibernate extends Base implements ReviewDAO {

    /**
     * <p>Constructs new <code>ReviewDAOHibernate</code> instance. This implementation does nothing.</p>
     */
    public ReviewDAOHibernate() {
        super();
    }
    
    /**
     * Gets a <code>Review</code> using the review id.
     * 
     * @param id the review id
     * @return the <code>Review</code> instance with the specified id
     */
    public Review find(Long id) {
        return (Review) super.find(Review.class, id);
    }
}
