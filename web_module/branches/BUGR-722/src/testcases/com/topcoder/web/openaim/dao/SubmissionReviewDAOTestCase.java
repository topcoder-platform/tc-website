package com.topcoder.web.openaim.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.FilePath;
import com.topcoder.web.openaim.model.ReviewStatus;
import com.topcoder.web.openaim.model.Submission;
import com.topcoder.web.openaim.model.SubmissionReview;
import com.topcoder.web.openaim.model.SubmissionStatus;
import com.topcoder.web.openaim.model.SubmissionType;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class SubmissionReviewDAOTestCase extends TCHibernateTestCase {
    public void testFind() {

        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        Contest c = (Contest) OpenAIMDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setMimeType(OpenAIMDAOUtil.getFactory().getMimeTypeDAO().find(new Integer(1)));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setType(OpenAIMDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setStatus(OpenAIMDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));
        OpenAIMDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        SubmissionReview sr = new SubmissionReview();
        sr.setSubmission(s);
        sr.setReviewer(dok);
        sr.setStatus(OpenAIMDAOUtil.getFactory().getReviewStatusDAO().find(ReviewStatus.PASSED));
        sr.setText("you suck at this, please do everyone a favor and quit!");
        OpenAIMDAOUtil.getFactory().getSubmissionReviewDAO().saveOrUpdate(sr);

        tearDown();
        setUp();

        SubmissionReview new1 = OpenAIMDAOUtil.getFactory().getSubmissionReviewDAO().find(s.getId());
        assertFalse("new submission review entry not created", new1 == null);


    }

}
