package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.dao.*;
import com.topcoder.web.reg.model.*;
import junit.framework.TestCase;

import java.util.Set;
import java.sql.Timestamp;


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


            HSAlgoRating hs = new HSAlgoRating();
            hs.setRating(new Integer(0));
            TCAlgoRating tc = new TCAlgoRating();
            tc.setRating(new Integer(0));
            ret.setHSRating(hs);
            ret.setTCRating(tc);


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

            log.debug("hs " + ret.getHSRating().getId().getRatingTypeId());
            log.debug("tc " + ret.getTCRating().getId().getRatingTypeId());

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
            log.debug("coder made");

            Coder u2 = new CoderDAO().find(u.getId());
            //Coder u2 = new CoderDAO().find(new Long(80762814));

            assertTrue("db does not contain our new user", u2.getHandle().equals(u.getHandle()));
            assertTrue("db does not contain our new address", !u2.getAddresses().isEmpty());
            assertTrue("db does not contain our new email address", !u2.getEmailAddresses().isEmpty());
            assertTrue("db does not contain our new phone", !u2.getPhoneNumbers().isEmpty());
            assertTrue("db does not contain our hs rating info", u2.getHSRating().getId().getCoderId()!=null);
            assertTrue("db does not contain our tc rating info", u2.getTCRating().getId().getCoderId()!=null);

        } finally {
            HibernateUtils.close();
        }
    }



}
