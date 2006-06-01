package com.topcoder.web.reg;

import junit.framework.TestCase;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class TCHibernateTestCase extends TestCase {
    protected static final Logger log = Logger.getLogger(TCHibernateTestCase.class);
    public void tearDown() {
        HibernateUtils.getSession().flush();
        HibernateUtils.commit();
        HibernateUtils.close();
    }

    public void setUp() {
        HibernateUtils.begin();
    }

}
