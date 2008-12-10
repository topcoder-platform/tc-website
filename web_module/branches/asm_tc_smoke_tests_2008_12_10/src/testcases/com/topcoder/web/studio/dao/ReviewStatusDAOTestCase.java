package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.ReviewStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class ReviewStatusDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find passed status",
                StudioDAOUtil.getFactory().getReviewStatusDAO().find(ReviewStatus.PASSED) == null);
    }

    public void testGetReviewStatuses() {
        List l = StudioDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses();
        assertFalse("couldn't find list of review status", l == null || l.isEmpty());
    }

}
