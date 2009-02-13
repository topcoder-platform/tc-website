package com.topcoder.web.studio;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import junit.framework.TestCase;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * @author dok
 * @version $Revision: 69932 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class TCHibernateTestCase extends TestCase {
    protected static final Logger log = Logger.getLogger(TCHibernateTestCase.class);

    public void tearDown() {
        Session session = HibernateUtils.getSession();
        Transaction transaction = session.getTransaction();
        if (transaction != null && transaction.isActive()) {
            session.flush();
        }
        HibernateUtils.commit();
        HibernateUtils.close();
    }

    public void setUp() {
        HibernateUtils.begin();
    }

}
