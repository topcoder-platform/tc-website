package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.ReviewStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class ReviewStatusDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find passed status",
                CreativeDAOUtil.getFactory().getReviewStatusDAO().find(ReviewStatus.PASSED) == null);
    }

    public void testGetReviewStatuses() {
        List l = CreativeDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses();
        assertFalse("couldn't find list of review status", l == null || l.isEmpty());
    }

}
