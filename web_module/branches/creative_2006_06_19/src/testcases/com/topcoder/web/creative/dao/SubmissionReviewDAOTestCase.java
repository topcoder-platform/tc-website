package com.topcoder.web.creative.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.FileType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class SubmissionReviewDAOTestCase extends TCHibernateTestCase {
    public void testFind() {

        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        Contest c = (Contest) CreativeDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setFileType(DAOUtil.getFactory().getFileTypeDAO().find(FileType.ADOBE_ACROBAT_TYPE_ID));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setType(CreativeDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        CreativeDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        SubmissionReview sr = new SubmissionReview();
        sr.setSubmission(s);
        sr.setReviewer(dok);
        sr.setStatus(CreativeDAOUtil.getFactory().getReviewStatusDAO().find(ReviewStatus.PASSED));
        sr.setText("you suck at this, please do everyone a favor and quit!");
        CreativeDAOUtil.getFactory().getSubmissionReviewDAO().saveOrUpdate(sr);

        tearDown();
        setUp();

        SubmissionReview new1 = CreativeDAOUtil.getFactory().getSubmissionReviewDAO().find(s.getId());
        assertFalse("new submission review entry not created", new1 == null);


    }

}
