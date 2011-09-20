package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.csf.model.SubmissionReview;
import com.topcoder.web.csf.dao.SubmissionReviewDAO;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class SubmissionReviewDAOHibernate extends Base implements SubmissionReviewDAO {
    public SubmissionReview find(Long id) {
        return (SubmissionReview) super.find(SubmissionReview.class, id);
    }

    public void saveOrUpdate(SubmissionReview s) {
        super.saveOrUpdate(s);
    }
}
