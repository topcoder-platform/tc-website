package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.model.Company;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class CompanyDAOTestCase extends TestCase {

    public void testFind() {

        Company topcoder = new CompanyDAO(HibernateUtils.getLocalSession()).find(new Long(1));
        assertTrue("could not load topcoder", topcoder != null);

    }


    public void testSaveOrUpdate() {
        try {
            Company c = new Company();
            c.setName("gptestcompany");
            c.setPrimaryContact(new ContactDAO(HibernateUtils.getLocalSession()).find(new Long(132456)));
            new CompanyDAO(HibernateUtils.getLocalSession()).saveOrUpdate(c);
            //Coder c1= new CoderDAO(HibernateUtils.getLocalSession()).find(c.getId());
            Company c1 = new CompanyDAO(HibernateUtils.getLocalSession()).find(c.getId());
            assertTrue("new company does not exist", c1 != null);
        } finally {
            HibernateUtils.closeLocal();
        }

    }


}
