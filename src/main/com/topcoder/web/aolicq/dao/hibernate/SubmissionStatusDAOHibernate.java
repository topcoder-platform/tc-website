package com.topcoder.web.aolicq.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.aolicq.dao.SubmissionStatusDAO;
import com.topcoder.web.aolicq.model.SubmissionStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2007
 */
public class SubmissionStatusDAOHibernate extends Base implements SubmissionStatusDAO {
    public SubmissionStatus find(Integer id) {
        return (SubmissionStatus) super.find(SubmissionStatus.class, id);
    }

    public List getSubmissionStatuses() {
        return super.findAll(SubmissionStatus.class);
    }
}
