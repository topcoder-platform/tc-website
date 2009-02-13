package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.SubmissionStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2007
 */
public class SubmissionStatusDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find active status",
                OpenAIMDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE) == null);
    }

    public void testGetSubmissionStatuses() {
        List l = OpenAIMDAOUtil.getFactory().getSubmissionStatusDAO().getSubmissionStatuses();
        assertFalse("couldn't find list of submission status", l == null || l.isEmpty());
    }

}
