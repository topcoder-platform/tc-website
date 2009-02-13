package com.topcoder.web.oracle;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class TCHibernateTestCase extends TestCase {
    protected static final Logger log = Logger.getLogger(TCHibernateTestCase.class);

    public void tearDown() {
        try {
            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.close();
        } catch (Throwable e) {
            log.error("bad stuff", e);
        }
    }

    public void setUp() {
        HibernateUtils.begin();
    }

}
