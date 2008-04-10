package com.topcoder.web.openaim.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.openaim.dao.ReviewStatusDAO;
import com.topcoder.web.openaim.model.ReviewStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class ReviewStatusDAOHibernate extends Base implements ReviewStatusDAO {
    public ReviewStatus find(Integer id) {
        return (ReviewStatus) super.find(ReviewStatus.class, id);
    }

    public List getReviewStatuses() {
        return findAll(ReviewStatus.class);
    }
}
