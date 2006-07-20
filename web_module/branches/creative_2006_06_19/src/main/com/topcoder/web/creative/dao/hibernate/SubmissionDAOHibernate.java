package com.topcoder.web.creative.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.creative.dao.SubmissionDAO;
import com.topcoder.web.creative.model.Submission;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class SubmissionDAOHibernate extends Base implements SubmissionDAO {
    public void saveOrUpdate(Submission s) {
        super.saveOrUpdate(s);
    }
}
