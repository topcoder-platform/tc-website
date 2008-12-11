package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.SubmissionType;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("could not find type " + SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE,
                OpenAIMDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE) == null);

    }
}
