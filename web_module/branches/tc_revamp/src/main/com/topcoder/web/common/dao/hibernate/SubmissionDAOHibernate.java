package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.SubmissionDAO;
import com.topcoder.web.common.model.comp.Submission;

/**
 * @author dok
 * @version $Revision: 63243 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 23, 2007
 */
public class SubmissionDAOHibernate extends Base implements SubmissionDAO {
    public Submission find(Integer id) {
        return (Submission) super.find(Submission.class, id);
    }
}
