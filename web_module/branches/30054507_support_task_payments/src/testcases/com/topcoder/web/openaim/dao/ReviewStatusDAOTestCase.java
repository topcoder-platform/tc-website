package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.ReviewStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class ReviewStatusDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find passed status",
                OpenAIMDAOUtil.getFactory().getReviewStatusDAO().find(ReviewStatus.PASSED) == null);
    }

    public void testGetReviewStatuses() {
        List l = OpenAIMDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses();
        assertFalse("couldn't find list of review status", l == null || l.isEmpty());
    }

}
