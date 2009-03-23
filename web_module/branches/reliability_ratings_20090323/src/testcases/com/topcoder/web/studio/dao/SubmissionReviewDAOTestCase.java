package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionReview;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.model.SubmissionType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class SubmissionReviewDAOTestCase extends TCHibernateTestCase {
    public void testFind() {

        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        Contest c = (Contest) StudioDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setMimeType(StudioDAOUtil.getFactory().getMimeTypeDAO().find(new Integer(1)));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setType(StudioDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setStatus(StudioDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));
        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        SubmissionReview sr = new SubmissionReview();
        sr.setSubmission(s);
        sr.setReviewer(dok);
        sr.setStatus(StudioDAOUtil.getFactory().getReviewStatusDAO().find(ReviewStatus.PASSED));
        sr.setText("you suck at this, please do everyone a favor and quit!");
        StudioDAOUtil.getFactory().getSubmissionReviewDAO().saveOrUpdate(sr);

        tearDown();
        setUp();

        SubmissionReview new1 = StudioDAOUtil.getFactory().getSubmissionReviewDAO().find(s.getId());
        assertFalse("new submission review entry not created", new1 == null);


    }

}
