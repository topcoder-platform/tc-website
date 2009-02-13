package com.topcoder.web.oracle.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.CandidateProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class CandidatePropertyDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(CandidatePropertyDAOTestCase.class);


    public void testFindAll() {
        List l = OracleDAOUtil.getFactory().getCandidatePropertyDAO().getProperties();
        assertFalse("list of properties is null", l == null);
        assertFalse("list of properties is empty", l.size() == 0);
    }


    public void testFind() {
        CandidatePropertyDAO dao = OracleDAOUtil.getFactory().getCandidatePropertyDAO();
        CandidateProperty cp = dao.find(dao.getProperties().get(0).getId());
        assertFalse("didn't find property", cp == null);
    }

}
