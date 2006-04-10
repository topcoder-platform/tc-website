package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.dao.CountryDAO;
import com.topcoder.web.reg.dao.NotificationDAO;
import com.topcoder.web.reg.dao.StateDAO;
import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.model.*;
import junit.framework.TestCase;

import java.util.Iterator;
import java.util.Set;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 30, 2006
 */
public class BasicHibernateTestCase extends TestCase {
    private static final Logger log = Logger.getLogger(BasicHibernateTestCase.class);

    private Set  notifications;
    public void setUp() {
        log.debug("start setup");
        notifications = new NotificationDAO().getNotifications();
        log.debug("end setup");
    }

    public void testCreateUser() {
        Long userId = null;
        String handle = "f" + System.currentTimeMillis();
        try {

            log.debug("before user creation");
            User u = new User();
            u.setActivationCode("active");
            u.setFirstName("first name");
            u.setLastName("last_name");
            u.setHandle(handle);
            u.setMiddleName("middle name");
            u.setPassword("password");
            u.setStatus(new Character('A'));
            log.debug("after user creation");

            log.debug("before address creation");
            Address a = new Address();
            a.setAddress1("address1");
            a.setAddress2("address2");
            a.setAddress3("address3");
            a.setAddressTypeId(Address.HOME_TYPE_ID);
            a.setCity("city");
            a.setState(new StateDAO().getState("CO"));
            a.setCountry(new CountryDAO().getCountry("840"));
            a.setProvince("province");
            a.setZip("zip");

            u.addAddress(a);
            log.debug("after address addition");

            Email e = new Email();
            e.setAddress("dok@topcoder.com");
            e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
            e.setPrimary(Boolean.TRUE);
            e.setStatusId(Email.STATUS_ID_UNACTIVE);

            u.addEmailAddress(e);
            log.debug("after email addition");

            Phone p = new Phone();
            p.setNumber("6666666666");
            p.setPhoneTypeId(Phone.PHONE_TYPE_HOME);
            p.setPrimary(Boolean.TRUE);

            u.addPhoneNumber(p);

            log.debug("before iterate");
            for (Iterator it= notifications.iterator(); it.hasNext();) {
                u.addNotification((Notification)it.next());
            }
            log.debug("after iterate");


            new UserDAO().saveOrUpdate(u);
            userId = u.getId();

            HibernateUtils.closeSession();
            User u2 = new UserDAO().find(userId);
            assertTrue("db does not contain our new user", u2.getHandle().equals(handle));
            assertTrue("db does not contain our new address", !u2.getAddresses().isEmpty());
            assertTrue("db does not contain our new email address", !u2.getEmailAddresses().isEmpty());
            assertTrue("db does not contain our new phone", !u2.getPhoneNumbers().isEmpty());
            assertTrue("db does not contain our notifications", u2.getNotifications().size()==notifications.size());
        } finally {
            HibernateUtils.close();
        }

    }

/*
    public void testCreateCoder() {
        Long userId = null;
        String handle = "f" + System.currentTimeMillis();
        try {

            Coder u = new Coder();
            u.setActivationCode("active");
            u.setFirstName("first name");
            u.setLastName("last_name");
            u.setHandle(handle);
            u.setMiddleName("middle name");
            u.setPassword("password");
            u.setStatus(new Character('A'));
            u.setCompCountryCode("840");
            u.setMemberSince(new Timestamp(System.currentTimeMillis()));
            u.setCoderTypeId(Coder.TYPE_STUDENT);


            HSAlgoRating hs = new HSAlgoRating();
            hs.setRating(new Integer(0));
            TCAlgoRating tc = new TCAlgoRating();
            tc.setRating(new Integer(0));
            u.addRating(tc);
            u.addRating(hs);




            Address a = new Address();
            a.setAddress1("address1");
            a.setAddress2("address2");
            a.setAddress3("address3");
            a.setAddressTypeId(Address.HOME_TYPE_ID);
            a.setCity("city");
            a.setState(new StateDAO().getState("CO"));
            a.setCountry(new CountryDAO().getCountry("840"));
            a.setProvince("province");
            a.setZip("zip");

            u.addAddress(a);

            Email e = new Email();
            e.setAddress("dok@topcoder.com");
            e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
            e.setPrimary(Boolean.TRUE);
            e.setStatusId(Email.STATUS_ID_UNACTIVE);

            u.addEmailAddress(e);

            Phone p = new Phone();
            p.setNumber("6666666666");
            p.setPhoneTypeId(Phone.PHONE_TYPE_HOME);
            p.setPrimary(Boolean.TRUE);

            u.addPhoneNumber(p);

            CoderDAO dao = new CoderDAO();
            dao.saveOrUpdate(u);
            userId = u.getId();

            Coder u2 = dao.find(userId);
            assertTrue("db does not contain our new user", u2.getHandle().equals(handle));
            assertTrue("db does not contain our new address", !u2.getAddresses().isEmpty());
            assertTrue("db does not contain our new email address", !u2.getEmailAddresses().isEmpty());
            assertTrue("db does not contain our new phone", !u2.getPhoneNumbers().isEmpty());
            assertTrue("db does not contain our rating info", !u2.getAlgoRatings().isEmpty());

        } finally {
            HibernateUtils.close();
        }
    }


*/

}
