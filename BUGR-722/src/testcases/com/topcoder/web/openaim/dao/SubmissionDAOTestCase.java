package com.topcoder.web.openaim.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.ContestResult;
import com.topcoder.web.openaim.model.FilePath;
import com.topcoder.web.openaim.model.Prize;
import com.topcoder.web.openaim.model.PrizeType;
import com.topcoder.web.openaim.model.Submission;
import com.topcoder.web.openaim.model.SubmissionStatus;
import com.topcoder.web.openaim.model.SubmissionType;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionDAOTestCase extends TCHibernateTestCase {

    public void testSaveOrUpdate() {
        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find((long) 132456);
        Contest c = (Contest) OpenAIMDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setMimeType(OpenAIMDAOUtil.getFactory().getMimeTypeDAO().find(1));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setType(OpenAIMDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setRank(1);
        s.setStatus(OpenAIMDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));

        OpenAIMDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        ContestResult cr = new ContestResult(s);
        cr.setContest(c);
        cr.setSubmission(s);
        Prize pr = new Prize();
        pr.setAmount((float) 100);
        pr.setPlace(1);
        pr.setType(OpenAIMDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));
        c.addPrize(pr);
        OpenAIMDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        cr.setPlaced(1);
        s.setResult(cr);
        OpenAIMDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        tearDown();
        setUp();

        Submission new1 = OpenAIMDAOUtil.getFactory().getSubmissionDAO().find(s.getId());
        assertFalse("new submission entry not created", new1 == null);
        assertTrue("failed to associate result", new1.getResult() != null);


    }



    public void testUpdateRank2() {

        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find((long) 132456);
        Contest c = (Contest) OpenAIMDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setMimeType(OpenAIMDAOUtil.getFactory().getMimeTypeDAO().find(1));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setRank(1);
        s.setType(OpenAIMDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setStatus(OpenAIMDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));

        OpenAIMDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);


        tearDown();
        setUp();

        SubmissionDAO dao = OpenAIMDAOUtil.getFactory().getSubmissionDAO();
        Submission new1 = dao.find(s.getId());
        log.debug("in between");
//        dao.changeRank(new Integer(2), new1.getId(), new1.getSubmitter().getId());
        dao.changeRank(2, new1);
        tearDown();
        setUp();
        dao = OpenAIMDAOUtil.getFactory().getSubmissionDAO();
        Submission new2 = dao.find(s.getId());
        assertTrue("new rank not set", new2.getRank() == 2);
    }


}
