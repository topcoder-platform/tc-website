package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Company;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class CompanyDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Company topcoder = DAOUtil.getFactory().getCompanyDAO().find(new Long(1));
        assertTrue("could not load topcoder", topcoder != null);

    }


    public void testSaveOrUpdate() {
        Company c = new Company();
        c.setName("gptestcompany");
        c.setPrimaryContact(DAOUtil.getFactory().getContactDAO().find(new Long(132456)));
        DAOUtil.getFactory().getCompanyDAO().saveOrUpdate(c);
        //Coder c1= new CoderDAO(HibernateUtils.getLocalSession()).find(c.getId());
        Company c1 = DAOUtil.getFactory().getCompanyDAO().find(c.getId());
        assertTrue("new company does not exist", c1 != null);

    }


}
