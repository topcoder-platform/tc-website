package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.TestUtils;
import com.topcoder.web.reg.model.Coder;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CoderDAOTestCase extends TestCase {

    public void testFind() {

        Coder tomek = new CoderDAO(HibernateUtils.getLocalSession()).find(new Long(144400));

        assertTrue("could not load tomek", tomek!=null);

    }


}
