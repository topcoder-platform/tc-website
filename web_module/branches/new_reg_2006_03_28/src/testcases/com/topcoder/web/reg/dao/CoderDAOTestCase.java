package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Coder;
import com.topcoder.web.reg.TestUtils;
import com.topcoder.web.reg.HibernateUtils;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CoderDAOTestCase extends TestCase {

    public void testFind() {

        Coder tomek = new CoderDAO().find(new Long(144400));

        assertTrue("could not load tomek", tomek != null);

    }

    public void testSaveOrUpdate() {
        try {
            Coder c= TestUtils.makeCoder();
            new CoderDAO().saveOrUpdate(c);
            Coder c1= new CoderDAO().find(c.getId());
            assertTrue("new coder does not exist", c1!=null);
        } finally {
            HibernateUtils.close();
        }

    }


}
