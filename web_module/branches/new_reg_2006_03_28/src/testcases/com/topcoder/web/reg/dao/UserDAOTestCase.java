package com.topcoder.web.reg.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.TestUtils;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.Coder;
import com.topcoder.web.reg.model.CoderType;
import com.topcoder.web.reg.model.Contact;

import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class UserDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(UserDAOTestCase.class);


    public void testFind() {
        User tomek = Util.getFactory().getUserDAO().find(new Long(144400));
        assertTrue("could not load tomek", tomek != null && "tomek".equals(tomek.getHandle()));
    }

    public void testSaveOrUpdate() {
        User u = TestUtils.makeUser();
        Util.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = Util.getFactory().getUserDAO().find(u.getId());
        assertTrue("new coder does not exist", u1 != null);

    }

    public void testSecurityGroupsLoaded() {
        User dok = Util.getFactory().getUserDAO().find(new Long(132456));
        assertTrue("did not load groups for dok", !dok.getSecurityGroups().isEmpty());
    }

    public void testAddressesLoaded() {
        User dok = Util.getFactory().getUserDAO().find(new Long(132456));
        assertTrue("did not load addresses for dok", !dok.getAddresses().isEmpty());
    }

    public void testNotificationsLoaded() {
        User dok = Util.getFactory().getUserDAO().find(new Long(132456));
        assertTrue("did not load notifications for dok", !dok.getNotifications().isEmpty());
    }

    public void testFindByUserName() {
        User dok = Util.getFactory().getUserDAO().find("dok");
        assertTrue("did not load dok", dok != null);
    }

    public void testFailureFindByUserName() {
        User dok = Util.getFactory().getUserDAO().find("dokd9d898df333");
        assertTrue("loaded dokd9d898df333", dok == null);
    }

    public void testSaveUpdateWithCoder() {
        User u = TestUtils.makeUser();
        Coder c = new Coder();
        c.setCompCountry(Util.getFactory().getCountryDAO().find("840"));
        c.setMemberSince(new Timestamp(System.currentTimeMillis()));
        c.setCoderType(Util.getFactory().getCoderTypeDAO().find(CoderType.STUDENT));

        u.setCoder(c);
        c.setUser(u);
        Util.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = Util.getFactory().getUserDAO().find(u.getId());
        assertTrue("new coder does not exist", u1 != null);
    }

    public void testSaveUpdateWithOutCoder() {
        User u = TestUtils.makeUser();
        Util.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = Util.getFactory().getUserDAO().find(u.getId());
        assertTrue("coder exists and should not", u1.getCoder() == null);
    }

    public void testSaveUpdateWithOutContact() {
        User u = TestUtils.makeUser();
        Util.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = Util.getFactory().getUserDAO().find(u.getId());
        assertTrue("contactexists and should not", u1.getContact() == null);
    }

    public void testSaveUpdateWithContact() {
        User u = TestUtils.makeUser();
        Contact c = new Contact();
        c.setCompany(Util.getFactory().getCompanyDAO().find(new Long(1)));
        c.setTitle("the man!");
        u.setContact(c);
        c.setUser(u);
        Util.getFactory().getUserDAO().saveOrUpdate(u);
        User u1 = Util.getFactory().getUserDAO().find(u.getId());
        assertTrue("new coder does not exist", u1 != null);

    }

    public void testFindWithContactAndCoder() {
        User dok = Util.getFactory().getUserDAO().find("dok");
        assertTrue("couldn't find dok's contact information", dok.getContact() != null);
        assertTrue("couldn't find dok's coder information", dok.getCoder() != null);
    }

    public void testFindWithDemographicInfo() {
        User dok = Util.getFactory().getUserDAO().find("dok");
        assertFalse("couldn't find demographic responses", dok.getDemographicResponses().isEmpty());
    }


}
