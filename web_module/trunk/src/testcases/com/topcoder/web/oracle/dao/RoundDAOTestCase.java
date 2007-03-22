package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoundDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));

        c.addRound(r);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        Round r1 = OracleDAOUtil.getFactory().getRoundDAO().find(c.getRounds().iterator().next().getId());

        assertFalse("did not find round", r1 == null);

    }


}
