package com.topcoder.web.reg;

import com.topcoder.web.reg.model.*;
import com.topcoder.web.reg.dao.*;

import java.sql.Timestamp;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class TestUtils {
    public static Coder makeCoder() {
        Coder ret = null;
        String handle = "f" + System.currentTimeMillis();

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
        ret.setCoderType(new CoderTypeDAO(HibernateUtils.getLocalSession()).find(CoderType.STUDENT));


        Address a = new Address();
        a.setAddress1("address1");
        a.setAddress2("address2");
        a.setAddress3("address3");
        a.setAddressTypeId(Address.HOME_TYPE_ID);
        a.setCity("city");
        a.setState(new StateDAO(HibernateUtils.getLocalSession()).find("CO"));
        a.setCountry(new CountryDAO(HibernateUtils.getLocalSession()).find("840"));
        a.setProvince("province");
        a.setPostalCode("zip");
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

        School s = new SchoolDAO(HibernateUtils.getLocalSession()).find(new Long(775));//MIT
        CurrentSchool cs = new CurrentSchool();
        cs.setCoder(ret);
        cs.setGPA(new Float(3));
        cs.setGPAScale(new Float(5));
        cs.setSchool(s);
        cs.setViewable(Boolean.TRUE);
        ret.setCurrentSchool(cs);

        for (Iterator it = new NotificationDAO(HibernateUtils.getLocalSession()).getNotifications().iterator(); it.hasNext();) {
            ret.addNotification((Notification) it.next());
        }

        ret.setTimeZone(new TimeZoneDAO(HibernateUtils.getLocalSession()).find(java.util.TimeZone.getDefault()));

        return ret;
    }


    public static User makeUser() {
        User ret = null;
        String handle = "f" + System.currentTimeMillis();

        ret = new User();
        ret.setActivationCode("active");
        ret.setFirstName("first name");
        ret.setLastName("last_name");
        ret.setHandle(handle);
        ret.setMiddleName("middle name");
        ret.setPassword("password");
        ret.setStatus(new Character('A'));

        Address a = new Address();
        a.setAddress1("address1");
        a.setAddress2("address2");
        a.setAddress3("address3");
        a.setAddressTypeId(Address.HOME_TYPE_ID);
        a.setCity("city");
        a.setState(new StateDAO(HibernateUtils.getLocalSession()).find("CO"));
        a.setCountry(new CountryDAO(HibernateUtils.getLocalSession()).find("840"));
        a.setProvince("province");
        a.setPostalCode("zip");
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

        for (Iterator it = new NotificationDAO(HibernateUtils.getLocalSession()).getNotifications().iterator(); it.hasNext();) {
            ret.addNotification((Notification) it.next());
        }

        ret.setTimeZone(new TimeZoneDAO(HibernateUtils.getLocalSession()).find(java.util.TimeZone.getDefault()));

        return ret;
    }

    public static User makeUser(String handle) {
        User ret = makeUser();
        ret.setHandle(handle);
        return ret;
    }


}
