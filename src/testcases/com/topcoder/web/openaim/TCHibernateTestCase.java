package com.topcoder.web.openaim;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
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
