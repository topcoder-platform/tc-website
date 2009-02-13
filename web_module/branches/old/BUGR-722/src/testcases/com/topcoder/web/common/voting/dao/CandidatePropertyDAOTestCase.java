package com.topcoder.web.common.voting.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.voting.CandidateProperty;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 58938 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 31, 2007
 */
public class CandidatePropertyDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(CandidatePropertyDAOTestCase.class);


    public void testFindAll() {
        List l = VotingDAOUtil.getFactory().getContestPropertyDAO().getProperties();
        assertFalse("list of properties is null", l == null);
        assertFalse("list of properties is empty", l.size() == 0);
    }


    public void testFind() {
        CandidatePropertyDAO dao = VotingDAOUtil.getFactory().getContestPropertyDAO();
        List l = dao.getProperties();
        CandidateProperty cp = dao.find(((CandidateProperty) l.get(0)).getId());
        assertFalse("didn't find property", cp == null);
    }


}



