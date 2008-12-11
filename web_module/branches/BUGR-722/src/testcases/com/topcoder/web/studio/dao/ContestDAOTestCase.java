package com.topcoder.web.studio.dao;

import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.ContestConfig;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.model.Document;
import com.topcoder.web.studio.model.DocumentType;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.studio.model.Prize;
import com.topcoder.web.studio.model.PrizeType;
import junit.framework.Assert;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author dok, isv
 * @version $Revision: 69932 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ContestDAOTestCase extends TCHibernateTestCase {

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.3, 5.4)
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
     * @since TopCoder Studio Modifications Assembly (Req# 5.3, 5.4)
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

    public void testGetContests() {
        List contests = StudioDAOUtil.getFactory().getContestDAO().getContests();
        assertTrue("could not find any contests in the db", contests != null && !contests.isEmpty());
    }

    /**
     * <p>Accuracy test. Tests {@link ContestDAO#saveOrUpdate(Contest)} method for accurate behavior.</p>
     * <p/>
     * <p>Adds new contest to persistent data store and verifies that the contest is saved to persistent data store and
     * new attributes added since <code>TopCoder Studio Modifications Assembly</code> are saved correctly.</p>
     *
     * @since 1.0
     */
    public void testSave() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        c.setFileTypes(new HashSet(StudioDAOUtil.getFactory().getFileTypeDAO().getFileTypes()));
        c.setWinnerAnnouncementTime(new Timestamp(c.getEndTime().getTime() + 1000 * 60 * 60));

        ContestChannel channel
                = StudioDAOUtil.getFactory().getContestChannelDAO().find(ContestChannel.STUDIO_ADMINISTRATOR);
        c.setChannel(channel);

        ContestType type = StudioDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STORYBOARD);
        c.setType(type);

        MediumDAO mediumDAO = StudioDAOUtil.getFactory().getMediumDAO();
        List<Medium> allMediums = mediumDAO.findAll();
        Set<Medium> mediums = new HashSet<Medium>();
        mediums.add(allMediums.iterator().next());
        mediums.add(allMediums.iterator().next());
        mediums.add(allMediums.iterator().next());
        c.setMediums(mediums);

        Integer directProjectId = 493294;
        c.setDirectProjectId(directProjectId);

        Long createUserId = 5927478327L;
        c.setCreateUserId(createUserId);

        ContestProperty previewImageProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_IMAGE);
        ContestConfig previewImageConf = new ContestConfig();
        previewImageConf.setProperty(previewImageProperty);
        previewImageConf.setValue("t");
        c.addConfig(previewImageConf);

        ContestProperty previewFileProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_FILE);
        ContestConfig previewFileConf = new ContestConfig();
        previewFileConf.setProperty(previewFileProperty);
        previewFileConf.setValue("f");
        c.addConfig(previewFileConf);

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contest", c1 != null);

        // Since TopCoder Studio Modifications Assembly
        assertContestChannels(channel, c1.getChannel());
        assertContestTypes(type, c1.getType());
        Assert.assertEquals("The direct project ID is not set correctly", directProjectId, c1.getDirectProjectId());
        Assert.assertEquals("The create user ID is not set correctly", createUserId, c1.getCreateUserId());
        assertContestProperty(c1, previewImageProperty, "t");
        assertContestProperty(c1, previewFileProperty, "f");

        // Since TopCoder Studio Modifications v2 Assembly
        Assert.assertEquals("The winner announcement time is not set correctly",
                c.getWinnerAnnouncementTime(), c1.getWinnerAnnouncementTime());
        assertMediums(mediums, c1.getMediums());
    }

    /**
     * <p>Accuracy test. Tests {@link ContestDAO#saveOrUpdate(Contest)} method for accurate behavior.</p>
     * <p/>
     * <p>Updates the existing contest in persistent data store and verifies that the contest data is updated in
     * persistent data store correctly.</p>
     *
     * @since 1.0
     */
    public void testUpdate() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        c.setWinnerAnnouncementTime(new Timestamp(c.getEndTime().getTime() + 1000 * 60 * 60));

        ContestConfig conf1 = new ContestConfig();
        conf1.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
        conf1.setValue("this is my contest description");

        ContestConfig conf2 = new ContestConfig();
        conf2.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
        conf2.setValue("this is my prize description");

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

        ContestChannel currentChannel
                = StudioDAOUtil.getFactory().getContestChannelDAO().find(ContestChannel.STUDIO_ADMINISTRATOR);
        c.setChannel(currentChannel);

        ContestType type = StudioDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STORYBOARD);
        c.setType(type);

        Integer directProjectId = 493294;
        c.setDirectProjectId(directProjectId);

        Long createUserId = 5927478327L;
        c.setCreateUserId(createUserId);

        MediumDAO mediumDAO = StudioDAOUtil.getFactory().getMediumDAO();
        List<Medium> allMediums = mediumDAO.findAll();
        Set<Medium> mediums = new HashSet<Medium>();
        mediums.add(allMediums.iterator().next());
        mediums.add(allMediums.iterator().next());
        mediums.add(allMediums.iterator().next());
        c.setMediums(mediums);

        ContestProperty previewImageProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_IMAGE);
        ContestConfig previewImageConf = new ContestConfig();
        previewImageConf.setProperty(previewImageProperty);
        previewImageConf.setValue("t");
        c.addConfig(previewImageConf);

        ContestProperty previewFileProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_FILE);
        ContestConfig previewFileConf = new ContestConfig();
        previewFileConf.setProperty(previewFileProperty);
        previewFileConf.setValue("f");
        c.addConfig(previewFileConf);

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        super.tearDown();
        super.setUp();
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());

        ContestConfig pConfig = c1.getPrizeDescription();
        pConfig.setValue("new desc");

        ContestChannel newChannel
                = StudioDAOUtil.getFactory().getContestChannelDAO().find(ContestChannel.TOPCODER_DIRECT);
        c1.setChannel(newChannel);

        ContestType newType = StudioDAOUtil.getFactory().getContestTypeDAO().find(ContestType.PROTOTYPE);
        c1.setType(newType);

        Integer newDirectProjectId = 925377;
        c1.setDirectProjectId(newDirectProjectId);

        Long newCreateUserId = 947623848L;
        c1.setCreateUserId(newCreateUserId);

        mediumDAO = StudioDAOUtil.getFactory().getMediumDAO();
        Set<Medium> newMediums = new HashSet<Medium>();
        newMediums.add(allMediums.iterator().next());
        newMediums.add(allMediums.iterator().next());
        c1.setMediums(newMediums);


        previewImageConf = getConfig(c1, previewImageProperty);
        previewImageConf.setValue("f");

        previewFileConf = getConfig(c1, previewFileProperty);
        previewFileConf.setValue("t");

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c1);
        super.tearDown();
        super.setUp();
        Contest c2 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("update failed", "new desc".equals(c2.getPrizeDescription().getValue()));

        // Since TopCoder Studio Modifications Assembly
        assertContestChannels(newChannel, c2.getChannel());
        assertContestTypes(newType, c2.getType());
        Assert.assertEquals("The direct project ID is not set correctly", newDirectProjectId, c2.getDirectProjectId());
        Assert.assertEquals("The create user ID is not set correctly", newCreateUserId, c2.getCreateUserId());
        assertContestProperty(c2, previewImageProperty, "f");
        assertContestProperty(c2, previewFileProperty, "t");

        // Since TopCoder Studio Modifications v2 Assembly
        Assert.assertEquals("The winner announcement time is not set correctly",
                c.getWinnerAnnouncementTime(), c2.getWinnerAnnouncementTime());
        assertMediums(newMediums, c2.getMediums());
    }

    /**
     * <p>Accuracy test. Tests {@link ContestDAO#saveOrUpdate(Contest)} method for accurate behavior.</p>
     * <p/>
     * <p>Adds new contest to persistent data store and verifies that the basic contest data like prizes and
     * configuration are saved to persistent data store and new attributes added since <code>TopCoder Studio
     * Modifications Assembly</code> are saved correctly.</p>
     *
     * @since 1.0
     */
    public void testSaveWithDetails() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        c.setWinnerAnnouncementTime(new Timestamp(c.getEndTime().getTime() + 1000 * 60 * 60));

        ContestConfig conf1 = new ContestConfig();
        conf1.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
        conf1.setValue("this is my contest description");

        ContestConfig conf2 = new ContestConfig();
        conf2.setProperty(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
        conf2.setValue("this is my prize description");

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

        ContestChannel channel
                = StudioDAOUtil.getFactory().getContestChannelDAO().find(ContestChannel.STUDIO_ADMINISTRATOR);
        c.setChannel(channel);

        ContestType type = StudioDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STORYBOARD);
        c.setType(type);

        Integer directProjectId = 493294;
        c.setDirectProjectId(directProjectId);

        Long createUserId = 5927478327L;
        c.setCreateUserId(createUserId);

        MediumDAO mediumDAO = StudioDAOUtil.getFactory().getMediumDAO();
        List<Medium> allMediums = mediumDAO.findAll();
        Set<Medium> mediums = new HashSet<Medium>();
        mediums.add(allMediums.iterator().next());
        mediums.add(allMediums.iterator().next());
        mediums.add(allMediums.iterator().next());
        c.setMediums(mediums);

        ContestProperty previewImageProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_IMAGE);
        ContestConfig previewImageConf = new ContestConfig();
        previewImageConf.setProperty(previewImageProperty);
        previewImageConf.setValue("f");
        c.addConfig(previewImageConf);

        ContestProperty previewFileProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_FILE);
        ContestConfig previewFileConf = new ContestConfig();
        previewFileConf.setProperty(previewFileProperty);
        previewFileConf.setValue("t");
        c.addConfig(previewFileConf);

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contst", c1 != null);
        assertFalse("did not create prizes", c1.getPrizes().isEmpty());
        assertFalse("did not create config", c1.getConfig().isEmpty());

        // Since TopCoder Studio Modifications Assembly
        assertContestChannels(channel, c1.getChannel());
        assertContestTypes(type, c1.getType());
        Assert.assertEquals("The direct project ID is not set correctly", directProjectId, c1.getDirectProjectId());
        Assert.assertEquals("The create user ID is not set correctly", createUserId, c1.getCreateUserId());
        assertContestProperty(c1, previewImageProperty, "f");
        assertContestProperty(c1, previewFileProperty, "t");

        // Since TopCoder Studio Modifications v2 Assembly
        Assert.assertEquals("The winner announcement time is not set correctly",
                c.getWinnerAnnouncementTime(), c1.getWinnerAnnouncementTime());
        assertMediums(mediums, c1.getMediums());
    }

    /**
     * <p>Accuracy test. Tests {@link ContestDAO#saveOrUpdate(Contest)} method for accurate behavior.</p>
     * <p/>
     * <p>Adds new contest to persistent data store and verifies that the basic contest data like assignment documents
     * are saved to persistent data store and new attributes added since <code>TopCoder Studio Modifications Assembly
     * </code> are saved correctly.</p>
     *
     * @since 1.0
     */
    public void testSaveWithDocuments() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));
        c.setStatus(StudioDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        c.setWinnerAnnouncementTime(new Timestamp(c.getEndTime().getTime() + 1000 * 60 * 60));

        Document d = new Document();
        d.setMimeType(StudioDAOUtil.getFactory().getMimeTypeDAO().find(new Integer(1)));
        d.setOriginalFileName("somecrap.pdf");
        FilePath p = new FilePath();
        p.setPath("stuff");
        d.setPath(p);
        d.setSystemFileName("systemcrap");
        d.setType(StudioDAOUtil.getFactory().getDocumentTypeDAO().find(DocumentType.SPECIFICTION));

        c.addDocument(d);

        ContestChannel channel
                = StudioDAOUtil.getFactory().getContestChannelDAO().find(ContestChannel.STUDIO_ADMINISTRATOR);
        c.setChannel(channel);

        ContestType type = StudioDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STORYBOARD);
        c.setType(type);

        Integer directProjectId = null;
        c.setDirectProjectId(directProjectId);

        Long createUserId = null;
        c.setCreateUserId(createUserId);

        ContestProperty previewImageProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_IMAGE);
        ContestConfig previewImageConf = new ContestConfig();
        previewImageConf.setProperty(previewImageProperty);
        previewImageConf.setValue("f");
        c.addConfig(previewImageConf);

        ContestProperty previewFileProperty
                = StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.REQUIRE_PREVIEW_FILE);
        ContestConfig previewFileConf = new ContestConfig();
        previewFileConf.setProperty(previewFileProperty);
        previewFileConf.setValue("f");
        c.addConfig(previewFileConf);

        MediumDAO mediumDAO = StudioDAOUtil.getFactory().getMediumDAO();
        List<Medium> allMediums = mediumDAO.findAll();
        Set<Medium> mediums = new HashSet<Medium>();
        mediums.add(allMediums.iterator().next());
        c.setMediums(mediums);

        StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = StudioDAOUtil.getFactory().getContestDAO().find(c.getId());
        Document found = null;
        for (Iterator it = c1.getDocuments().iterator(); it.hasNext();) {
            found = (Document) it.next();
        }
        assertTrue("couldn't find the new document", "somecrap.pdf".equals(found.getOriginalFileName()));

        // Since TopCoder Studio Modifications Assembly
        assertContestChannels(channel, c1.getChannel());
        assertContestTypes(type, c1.getType());
        Assert.assertEquals("The direct project ID is not set correctly", directProjectId, c1.getDirectProjectId());
        Assert.assertEquals("The create user ID is not set correctly", createUserId, c1.getCreateUserId());
        assertContestProperty(c1, previewImageProperty, "f");
        assertContestProperty(c1, previewFileProperty, "f");

        // Since TopCoder Studio Modifications v2 Assembly
        Assert.assertEquals("The winner announcement time is not set correctly",
                c.getWinnerAnnouncementTime(), c1.getWinnerAnnouncementTime());
        assertMediums(mediums, c1.getMediums());
    }

    public void testLoad() {
        List l = StudioDAOUtil.getFactory().getContestDAO().getContests();
        Contest c = StudioDAOUtil.getFactory().getContestDAO().find(((Contest) l.get(0)).getId());
        assertFalse("prizes was null", c.getPrizes() == null);
    }

    /**
     * <p>Verifies that the specified channels are equal.</p>
     *
     * @param expected a <code>ContestChannel</code> providing the expected data for the channel.
     * @param actual   a <code>ContestChannel</code> providing the actual data for the channel.
     * @since TopCoder Studio Modifications Assembly
     */
    private void assertContestChannels(ContestChannel expected, ContestChannel actual) {
        Assert.assertNotNull("The contest channel is not set", actual);
        Assert.assertEquals("The contest channel is not set correctly", expected.getId(), actual.getId());
        Assert.assertEquals("The contest channel is not set correctly",
                expected.getDescription(), actual.getDescription());
    }

    /**
     * <p>Verifies that the specified contest types are equal.</p>
     *
     * @param expected a <code>ContestType</code> providing the expected data for the contest type.
     * @param actual   a <code>ContestType</code> providing the actual data for the contest type.
     * @since TopCoder Studio Modifications Assembly
     */
    private void assertContestTypes(ContestType expected, ContestType actual) {
        Assert.assertNotNull("The contest type is not set", actual);
        Assert.assertEquals("The contest type is not set correctly", expected.getId(), actual.getId());
        Assert.assertEquals("The contest type is not set correctly",
                expected.getDescription(), actual.getDescription());
        Assert.assertEquals("The contest type is not set correctly",
                expected.getPreviewImageRequired(), actual.getPreviewImageRequired());
        Assert.assertEquals("The contest type is not set correctly",
                expected.getPreviewFileRequired(), actual.getPreviewFileRequired());
    }

    /**
     * <p>Verifies that the specified contest has the specified property set.</p>
     *
     * @param contest          a <code>Contest</code> to verify.
     * @param expectedProperty a <code>ContestType</code> providing the expected data for the contest type.
     * @param expectedValue    a <code>String</code> providing the expected value of specified property.
     * @since TopCoder Studio Modifications Assembly
     */
    private void assertContestProperty(Contest contest, ContestProperty expectedProperty, String expectedValue) {
        Map<Integer, String> config = contest.getConfigMap();
        Assert.assertTrue("The [" + expectedProperty.getDescription() + "] property is not set",
                config.containsKey(expectedProperty.getId()));
        Assert.assertEquals("The [" + expectedProperty.getDescription() + "] property is not set correctly",
                expectedValue, config.get(expectedProperty.getId()));
    }

    /**
     * <p>Gets the configured value for specified property from the specified contest.</p>
     *
     * @param contest  a <code>Contest</code> representing the contest to get the value from.
     * @param property a <code>ContestProperty</code> representing the property to get value for.
     * @return a <code>ContestConfig</code> matching the specified property in specified contest or <code>null</code> if
     *         such a configuration is not found.
     * @since TopCoder Studio Modifications Assembly
     */
    private ContestConfig getConfig(Contest contest, ContestProperty property) {
        Set<ContestConfig> config = contest.getConfig();
        for (ContestConfig conf : config) {
            if (conf.getProperty().getId().equals(property.getId())) {
                return conf;
            }
        }
        return null;
    }

    /**
     * <p>Verifies that the specified contest submission medium types are equal.</p>
     *
     * @param expected a <code>Set</code> providing the expected data for the medium types.
     * @param actual   a <code>Set</code> providing the actual data for the medium types.
     * @since TopCoder Studio Modifications Assembly v2
     */
    private void assertMediums(Set<Medium> expected, Set<Medium> actual) {
        Assert.assertNotNull("The medium types are not set", actual);
        Assert.assertEquals("The medium types are not set correctly", expected.size(), actual.size());
        for (Medium expectedMedium : expected) {
            boolean found = false;
            for (Medium actualMedium : actual) {
                if (expectedMedium.getId().equals(actualMedium.getId())) {
                    found = true;
                    Assert.assertEquals("The medium type is not set correctly",
                            expectedMedium.getDescription(), actualMedium.getDescription());
                }
            }
            Assert.assertTrue("The specific medium is not set", found);
        }
    }
}
