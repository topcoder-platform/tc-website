package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.csf.model.ReviewStatus;
import com.topcoder.web.csf.dao.ReviewStatusDAO;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
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
