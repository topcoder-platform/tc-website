package com.topcoder.web.winformula.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.winformula.dao.SubmissionTypeDAO;
import com.topcoder.web.winformula.model.SubmissionType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionTypeDAOHibernate extends Base implements SubmissionTypeDAO {

    public SubmissionType find(Integer id) {
        return (SubmissionType) super.find(SubmissionType.class, id);
    }
}
