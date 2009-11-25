package com.topcoder.web.oracle.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.ContestType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class ContestTypeDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(CandidatePropertyDAOTestCase.class);


    public void testFindAll() {
        List l = OracleDAOUtil.getFactory().getContestTypeDAO().getContestTypes();
        assertFalse("list of contest types is null", l == null);
        assertFalse("list of contest types is empty", l.size() == 0);
    }


    public void testFind() {
        ContestTypeDAO dao = OracleDAOUtil.getFactory().getContestTypeDAO();
        ContestType cp = dao.find((dao.getContestTypes().get(0)).getId());
        assertFalse("didn't find contest type", cp == null);
    }

}
