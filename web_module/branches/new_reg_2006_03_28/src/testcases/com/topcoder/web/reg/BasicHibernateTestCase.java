package com.topcoder.web.reg;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.Address;
import com.topcoder.web.reg.model.Email;
import junit.framework.TestCase;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


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
        Session session = factory.openSession();

        Long value = null;

        String handle = "f" + System.currentTimeMillis();
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

            log.debug("start transaction");
            Transaction t = session.beginTransaction();
            log.debug("transaction started");
            session.saveOrUpdate(u);
            log.debug("save complete");
            value = u.getId();
            t.commit();
            log.debug("commit transaction");


        } catch (Throwable e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            session.close();
            factory.close();
        }
        log.debug("create factory");
        SessionFactory factory1 = conf.buildSessionFactory();
        log.debug("factory created");
        log.debug("open session");
        Session session1 = factory1.openSession();
        log.debug("session opened");
        User u2 = (User) session1.load(User.class, value);
        assertTrue("db contains new user", u2.getHandle().equals(handle));
        session1.close();
        factory1.close();

    }



}
