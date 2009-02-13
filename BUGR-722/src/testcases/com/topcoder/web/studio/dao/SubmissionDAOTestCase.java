package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.ImageDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Path;
import com.topcoder.web.common.model.Image;
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
import com.topcoder.web.studio.model.SubmissionImage;
import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import junit.framework.Assert;

import java.io.Serializable;
import java.util.Set;
import java.util.List;
import java.util.ArrayList;

/**
 * @author dok, isv
 * @version $Revision: 69932 $ Date: 2005/01/01 00:00:00
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

    /**
     * <p>Accuracy test. Test the {@link SubmissionDAO#find(Serializable)} method for accurate bahvior.</p>
     *
     * <p>Passes the ID of the existing submission and verifies that submission images data is loaded from
     * data store correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since Studio Submission Slideshow
     */
    public void testFind() throws Exception {
        long submissionId = 5;
        Submission submission = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);
        Assert.assertNotNull("Existing submission is not found", submission);
        Set<SubmissionImage> images = submission.getImages();
        Assert.assertEquals("Wrong number of submission images", 4, images.size());
        int cnt = 1;
        for (SubmissionImage image : images) {
            Assert.assertEquals("Wrong image assigned", submissionId, image.getSubmission().getId().longValue());
            Assert.assertEquals("Wrong sort order", cnt++, image.getSortIndex().intValue());
        }
    }

    /**
     * <p>Accuracy test. Test the {@link SubmissionDAO#saveOrUpdate(Object)} method for accurate bahvior.</p>
     *
     * <p>Passes a submission with images assigned and verifies that the submission images data is saved to database
     * correctly.</p>
     *
     * @since Studio Submission Slideshow
     */
    public void testSaveOrUpdate_SubmissionImages() {
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

        super.tearDown();
        super.setUp();

        // Generate image and save it to persistent data store
        Path imagePath = new Path();
        imagePath.setPath(p.getPath());
        DAOUtil.getFactory().getPathDAO().saveOrUpdate(imagePath);


        ImageDAO imageDAO = DAOUtil.getFactory().getImageDAO();
        int imageCnt = 10;

        List<Image> images = new ArrayList<Image>();
        for (int i = 1; i <= imageCnt; i++) {
            Image image2 = new Image();
            image2.setFileName("imagefile" + i + ".jpg");
            image2.setHeight(100 + i);
            image2.setImageTypeId(18 + i);
            image2.setNew(true);
            image2.setOriginalFileName("originalImageFile" + i + ".jpg");
            image2.setPath(imagePath);
            image2.setWidth(100 + i);
            imageDAO.saveOrUpdate(image2);
            images.add(image2);
        }

        // Map submission to generated image
        int i = 1;
        for (Image image2 : images) {
            SubmissionImage submissionImage = new SubmissionImage();
            submissionImage.setSubmission(s);
            submissionImage.setImage(image2);
            submissionImage.setSortIndex(i++);
            s.addImage(submissionImage);
        }

        StudioDAOUtil.getFactory().getSubmissionDAO().saveOrUpdate(s);
        super.tearDown();
        super.setUp();

        Submission submission = StudioDAOUtil.getFactory().getSubmissionDAO().find(s.getId());
        Assert.assertNotNull("Existing submission is not found", submission);
        Set<SubmissionImage> sImages = submission.getImages();
        Assert.assertEquals("Wrong number of submission images", imageCnt, sImages.size());
        int cnt = 1;
        for (SubmissionImage image : sImages) {
            Assert.assertEquals("Wrong image assigned", submission.getId(), image.getSubmission().getId());
            Assert.assertEquals("Wrong sort order", cnt++, image.getSortIndex().intValue());
        }
    }
}
