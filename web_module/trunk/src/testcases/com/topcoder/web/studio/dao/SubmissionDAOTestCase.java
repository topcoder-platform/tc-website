package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.model.SubmissionType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionDAOTestCase extends TCHibernateTestCase {
/*
    public void testSaveOrUpdate() {
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
        s.setRank(new Integer(1));

        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        ContestResult cr = new ContestResult();
        cr.setContest(c);
        cr.setSubmission(s);
        Prize pr = new Prize();
        pr.setAmount(new Float(100));
        pr.setPlace(new Integer(1));
        pr.setType(StudioDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));
        c.addPrize(pr);
        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        c = (Contest) StudioDAOUtil.getFactory().getContestDAO().getContests().get(0);
        cr.setPrize((Prize) c.getPrizes().iterator().next());
        s.setResult(cr);
        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        tearDown();
        setUp();

        Submission new1 = StudioDAOUtil.getFactory().getSubmissionDAO().find(s.getId());
        assertFalse("new submission entry not created", new1 == null);
        assertTrue("failed to associate result", new1.getResult() != null);


    }
*/



    public void testUpdateRank2() {

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
        s.setRank(new Integer(1));
        s.setType(StudioDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setStatus(StudioDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));

        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);


        tearDown();
        setUp();

        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission new1 = dao.find(s.getId());
        log.debug("in between");
//        dao.changeRank(new Integer(2), new1.getId(), new1.getSubmitter().getId());
        dao.changeRank(new Integer(2), new1);
        tearDown();
        setUp();
        dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission new2 = dao.find(s.getId());
        assertTrue("new rank not set", new2.getRank().intValue() == 2);
    }


}
