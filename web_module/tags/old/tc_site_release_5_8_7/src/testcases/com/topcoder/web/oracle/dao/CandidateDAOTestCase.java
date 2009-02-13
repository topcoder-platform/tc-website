package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class CandidateDAOTestCase extends TCHibernateTestCase {


    public void testSaveAndFind() {
        Candidate c = new Candidate();
        c.setName("my candidate");

        OracleDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(c);
        Candidate c1 = OracleDAOUtil.getFactory().getCandidateDAO().find(c.getId());
        assertFalse("could not find candidate in the db", c1 == null);
    }

    public void testSave() {
        Candidate c = new Candidate();
        c.setName("my candidate");

        CandidateInfo ci = new CandidateInfo();
        ci.setProperty(OracleDAOUtil.getFactory().getCandidatePropertyDAO().getProperties().get(0));

        OracleDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(c);
        Candidate c1 = OracleDAOUtil.getFactory().getCandidateDAO().find(c.getId());
        assertFalse("could not find candidate in the db", c1 == null);
    }
}
