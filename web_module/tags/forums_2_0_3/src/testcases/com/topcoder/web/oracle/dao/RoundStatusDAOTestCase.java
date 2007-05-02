package com.topcoder.web.oracle.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.oracle.model.RoundStatus;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoundStatusDAOTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(com.topcoder.web.common.voting.dao.CandidatePropertyDAOTestCase.class);


    public void testFindAll() {
        List l = OracleDAOUtil.getFactory().getRoundStatusDAO().getRoundStatuses();
        assertFalse("list of round statuses is null", l == null);
        assertFalse("list of round statuses is empty", l.size() == 0);
    }


    public void testFind() {
        RoundStatusDAO dao = OracleDAOUtil.getFactory().getRoundStatusDAO();
        List l = dao.getRoundStatuses();
        RoundStatus cp = dao.find(((RoundStatus) l.get(0)).getId());
        assertFalse("didn't find round status", cp == null);
    }


}



