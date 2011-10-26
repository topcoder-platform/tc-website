package com.topcoder.web.truveo.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.truveo.dao.SubmissionTypeDAO;
import com.topcoder.web.truveo.model.SubmissionType;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionTypeDAOHibernate extends Base implements SubmissionTypeDAO {

    public SubmissionType find(Integer id) {
        return (SubmissionType) super.find(SubmissionType.class, id);
    }
}
