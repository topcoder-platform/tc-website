package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.SubmissionType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("could not find type " + SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE,
                CreativeDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE) == null);

    }
}
