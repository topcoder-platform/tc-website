package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.Prize;
import com.topcoder.web.studio.model.PrizeType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.model.SubmissionType;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class SubmissionDAOTestCase extends TCHibernateTestCase {

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public void setUp() {
        try {
            DBConnectionFactoryImpl connectionFactory
                    = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }

        super.setUp();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public void tearDown() {
        super.tearDown();
        try {
            DBConnectionFactoryImpl connectionFactory
                    = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
    }

    public void testSaveOrUpdate() {
        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find((long) 1);
        Contest c = (Contest) StudioDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setMimeType(StudioDAOUtil.getFactory().getMimeTypeDAO().find(1));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setType(StudioDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setRank(1);
        s.setStatus(StudioDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));

        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        ContestResult cr = new ContestResult(s);
        cr.setContest(c);
        cr.setSubmission(s);
        Prize pr = new Prize();
        pr.setAmount((float) 100);
        pr.setPlace(1);
        pr.setType(StudioDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));
        c.addPrize(pr);
        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        super.tearDown();
        super.setUp();
        cr.setPlaced(1);
        s.setResult(cr);
        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);

        super.tearDown();
        super.setUp();

        Submission new1 = StudioDAOUtil.getFactory().getSubmissionDAO().find(s.getId());
        assertFalse("new submission entry not created", new1 == null);
        assertTrue("failed to associate result", new1.getResult() != null);


    }



    public void testUpdateRank2() {

        Submission s = new Submission();

        User dok = DAOUtil.getFactory().getUserDAO().find((long) 1);
        Contest c = (Contest) StudioDAOUtil.getFactory().getContestDAO().getContests().get(0);
        s.setContest(c);
        s.setSubmitter(dok);
        s.setMimeType(StudioDAOUtil.getFactory().getMimeTypeDAO().find(1));
        s.setOriginalFileName("kickin");
        s.setSystemFileName("kicking it");
        FilePath p = new FilePath();
        p.setPath("stuff");
        s.setPath(p);
        s.setRank(1);
        s.setType(StudioDAOUtil.getFactory().getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
        s.setStatus(StudioDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));

        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);


        super.tearDown();
        super.setUp();

        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission new1 = dao.find(s.getId());
        log.debug("in between");
//        dao.changeRank(new Integer(2), new1.getId(), new1.getSubmitter().getId());
        dao.changeRank(2, new1);
        super.tearDown();
        super.setUp();
        dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission new2 = dao.find(s.getId());
        assertTrue("new rank not set", new2.getRank() == 2);
    }


}
