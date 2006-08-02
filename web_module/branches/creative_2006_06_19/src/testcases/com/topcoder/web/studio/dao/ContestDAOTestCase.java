package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.FileType;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ContestDAOTestCase extends TCHibernateTestCase {

    public void testGetCountries() {
        List countries = StudioDAOUtil.getFactory().getContestDAO().getContests();
        assertTrue("could not find any contests in the db", countries != null && !countries.isEmpty());
    }

    public void testSave() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contst", c1 != null);
    }


    public void testUpdate() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        ContestConfig conf1 = new ContestConfig();
        conf1.setContest(c);
        conf1.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
        conf1.setValue("this is my contest description");
        conf1.getId().setContest(c);
        conf1.getId().setProperty(conf1.getProperty());

        ContestConfig conf2 = new ContestConfig();
        conf2.setContest(c);
        conf2.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
        conf2.setValue("this is my prize description");
        conf2.getId().setContest(c);
        conf2.getId().setProperty(conf2.getProperty());

        c.addConfig(conf1);
        c.addConfig(conf2);

        Prize cp1 = new Prize();
        cp1.setAmount(new Float("100"));
        cp1.setPlace(new Integer(1));
        cp1.setType(StudioDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));

        Prize cp2 = new Prize();
        cp2.setAmount(new Float("50"));
        cp2.setPlace(new Integer(2));
        cp2.setType(StudioDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));

        c.addPrize(cp1);
        c.addPrize(cp2);


        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());

        ContestConfig pConfig = c1.getPrizeDescription();
        pConfig.setValue("new desc");
        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c1);
        tearDown();
        setUp();
        Contest c2 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("update failed", "new desc".equals(c2.getPrizeDescription().getValue()));
    }

    public void testSaveWithDetails() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        ContestConfig conf1 = new ContestConfig();
        conf1.setContest(c);
        conf1.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
        conf1.setValue("this is my contest description");
        conf1.getId().setContest(c);
        conf1.getId().setProperty(conf1.getProperty());

        ContestConfig conf2 = new ContestConfig();
        conf2.setContest(c);
        conf2.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
        conf2.setValue("this is my prize description");
        conf2.getId().setContest(c);
        conf2.getId().setProperty(conf2.getProperty());

        c.addConfig(conf1);
        c.addConfig(conf2);

        Prize cp1 = new Prize();
        cp1.setAmount(new Float("100"));
        cp1.setPlace(new Integer(1));
        cp1.setType(StudioDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));

        Prize cp2 = new Prize();
        cp2.setAmount(new Float("50"));
        cp2.setPlace(new Integer(2));
        cp2.setType(StudioDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));

        c.addPrize(cp1);
        c.addPrize(cp2);


        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contst", c1 != null);
        assertFalse("did not create prizes", c1.getPrizes().isEmpty());
        assertFalse("did not create config", c1.getConfig().isEmpty());

    }

    public void testSaveWithDocuments() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Document d = new Document();
        d.setFileType(DAOUtil.getFactory().getFileTypeDAO().find(FileType.ADOBE_ACROBAT_TYPE_ID));
        d.setOriginalFileName("somecrap.pdf");
        FilePath p = new FilePath();
        p.setPath("stuff");
        d.setPath(p);
        d.setSystemFileName("systemcrap");
        d.setType(StudioDAOUtil.getFactory().getDocumentTypeDAO().find(DocumentType.SPECIFICTION));

        c.addDocument(d);

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        Document found = null;
        for (Iterator it = c1.getDocuments().iterator(); it.hasNext();) {
            found = (Document) it.next();
        }
        assertTrue("couldn't find the new document", "somecrap.pdf".equals(found.getOriginalFileName()));

    }


    public void testLoad() {
        List l = StudioDAOUtil.getFactory().getContestDAO().getContests();
        Contest c = StudioDAOUtil.getFactory().getContestDAO().find(((Contest) l.get(0)).getId());
        assertFalse("prizes was null", c.getPrizes() == null);
    }

}
