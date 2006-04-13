package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.dao.*;
import com.topcoder.web.reg.model.*;
import junit.framework.TestCase;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 30, 2006
 */
public class BasicHibernateTestCase extends TestCase {
    private static final Logger log = Logger.getLogger(BasicHibernateTestCase.class);

    private List notifications;
    public void setUp() {
        notifications = new NotificationDAO().getNotifications();
    }

    private Coder makeCoder() {
        Coder ret = null;
        String handle = "f" + System.currentTimeMillis();
        try {

            ret = new Coder();
            ret.setActivationCode("active");
            ret.setFirstName("first name");
            ret.setLastName("last_name");
            ret.setHandle(handle);
            ret.setMiddleName("middle name");
            ret.setPassword("password");
            ret.setStatus(new Character('A'));
            ret.setCompCountryCode("840");
            ret.setMemberSince(new Timestamp(System.currentTimeMillis()));
            ret.setCoderTypeId(Coder.TYPE_STUDENT);


            Address a = new Address();
            a.setAddress1("address1");
            a.setAddress2("address2");
            a.setAddress3("address3");
            a.setAddressTypeId(Address.HOME_TYPE_ID);
            a.setCity("city");
            a.setState(new StateDAO().find("CO"));
            a.setCountry(new CountryDAO().find("840"));
            a.setProvince("province");
            a.setZip("zip");
            ret.addAddress(a);

            Email e = new Email();
            e.setAddress("dok@topcoder.com");
            e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
            e.setPrimary(Boolean.TRUE);
            e.setStatusId(Email.STATUS_ID_UNACTIVE);
            ret.addEmailAddress(e);

            Phone p = new Phone();
            p.setNumber("6666666666");
            p.setPhoneTypeId(Phone.PHONE_TYPE_HOME);
            p.setPrimary(Boolean.TRUE);
            ret.addPhoneNumber(p);

            School s = new SchoolDAO().find(new Long(775));//MIT
            CurrentSchool cs = new CurrentSchool();
            cs.setCoder(ret);
            cs.setGPA(new Float(3));
            cs.setGPAScale(new Float(5));
            cs.setSchool(s);
            cs.setViewable(Boolean.TRUE);
            ret.setCurrentSchool(cs);

            for (Iterator it = notifications.iterator(); it.hasNext();) {
                ret.addNotification((Notification)it.next());
            }

            ret.setTimeZone(new TimeZoneDAO().find(java.util.TimeZone.getDefault()));

            CoderDAO dao = new CoderDAO();
            dao.saveOrUpdate(ret);
            return ret;

        } finally {
            HibernateUtils.close();
        }
    }

    public void testCreateCoder() {
        try {

            Coder u = makeCoder();
            Coder u2 = new CoderDAO().find(u.getId());

            assertTrue("db does not contain our new user", u2.getHandle().equals(u.getHandle()));
            assertTrue("db does not contain our new address", !u2.getAddresses().isEmpty());
            assertTrue("db does not contain our new email address", !u2.getEmailAddresses().isEmpty());
            assertTrue("db does not contain our new phone", !u2.getPhoneNumbers().isEmpty());
            assertTrue("db does not contain our notifications", u2.getNotifications().size()==notifications.size());
            assertTrue("db does not contain our current school", u2.getCurrentSchool()!=null);
/*
            assertTrue("db does not contain our hs rating info", u2.getHSRating()!=null);
            assertTrue("db does not contain our tc rating info", u2.getTCRating()!=null);
*/
        } finally {
            HibernateUtils.close();
        }
    }



}
