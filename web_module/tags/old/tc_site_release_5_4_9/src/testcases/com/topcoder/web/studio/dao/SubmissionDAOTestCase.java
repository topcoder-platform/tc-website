package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.FileType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionDAOTestCase extends TCHibernateTestCase {
    public void testSaveOrUpdate() {
        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        Contest c = (Contest) StudioDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setFileType(DAOUtil.getFactory().getFileTypeDAO().find(FileType.ADOBE_ACROBAT_TYPE_ID));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setType(StudioDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        tearDown();
        setUp();

        Submission new1 = StudioDAOUtil.getFactory().getSubmissionDAO().find(s.getId());
        assertFalse("new submission entry not created", new1 == null);


    }
}
