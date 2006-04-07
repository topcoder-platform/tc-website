package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.model.*;
import junit.framework.TestCase;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.sql.Timestamp;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 30, 2006
 */
public class BasicHibernateTestCase extends TestCase {
    private static final Logger log = Logger.getLogger(BasicHibernateTestCase.class);

    public void testCreateUser() {
        Configuration conf = new Configuration();
        conf.configure();
        SessionFactory factory = conf.buildSessionFactory();
        Session session = factory.openSession(new TCInterceptor());

        Long userId = null;

        String handle = "f" + System.currentTimeMillis();
        Transaction t =null;
        try {

            User u = new User();
            u.setActivationCode("active");
            u.setFirstName("first name");
            u.setLastName("last_name");
            u.setHandle(handle);
            u.setMiddleName("middle name");
            u.setPassword("password");
            u.setStatus(new Character('A'));

            Address a = new Address();
            a.setAddress1("address1");
            a.setAddress2("address2");
            a.setAddress3("address3");
            a.setAddressTypeId(Address.HOME_TYPE_ID);
            a.setCity("city");
            //a.setStateCode("CO");
            a.setCountryCode("840");
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

            t = session.beginTransaction();
            session.save(u);
            userId = u.getId();

            t.commit();
            session.clear();


        } catch (Throwable e) {
            if (t!=null&&t.isActive()) {
                t.rollback();
            }
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            session.close();
            factory.close();
        }
        SessionFactory factory1 = conf.buildSessionFactory();
        Session session1 = factory1.openSession(new TCInterceptor());
        User u2 = (User) session1.load(User.class, userId);
        assertTrue("db does not contain our new user", u2.getHandle().equals(handle));
        assertTrue("db does not contain our new address", !u2.getAddresses().isEmpty());
        assertTrue("db does not contain our new email address", !u2.getEmailAddresses().isEmpty());
        assertTrue("db does not contain our new phone", !u2.getPhoneNumbers().isEmpty());
        session1.close();
        factory1.close();

    }

    public void testCreateCoder() {
        Configuration conf = new Configuration();
        conf.configure();
        SessionFactory factory = conf.buildSessionFactory();
        Session session = factory.openSession(new TCInterceptor());

        Long userId = null;

        String handle = "f" + System.currentTimeMillis();
        Transaction t = null;
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
            a.setStateCode("CO");
            a.setCountryCode("840");
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

            t = session.beginTransaction();
            session.save(u);
            userId = u.getId();

            t.commit();
            session.clear();


        } catch (Throwable e) {
            if (t!=null&&t.isActive()) {
               t.rollback();
            }
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            session.close();
            factory.close();
        }
        SessionFactory factory1 = conf.buildSessionFactory();
        Session session1 = factory1.openSession(new TCInterceptor());
        Coder u2 = (Coder) session1.load(Coder.class, userId);
        assertTrue("db does not contain our new user", u2.getHandle().equals(handle));
        assertTrue("db does not contain our new address", !u2.getAddresses().isEmpty());
        assertTrue("db does not contain our new email address", !u2.getEmailAddresses().isEmpty());
        assertTrue("db does not contain our new phone", !u2.getPhoneNumbers().isEmpty());
        assertTrue("db does not contain our rating info", !u2.getAlgoRatings().isEmpty());
        session1.close();
        factory1.close();

    }



}
