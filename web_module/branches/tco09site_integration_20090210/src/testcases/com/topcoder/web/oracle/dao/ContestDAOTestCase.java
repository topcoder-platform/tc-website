package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.*;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ContestDAOTestCase extends TCHibernateTestCase {


    public void testSimpleSaveAndFind() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contest", c1 != null);
    }

    public void testGetContests() {
        List contests = OracleDAOUtil.getFactory().getContestDAO().getContests();
        assertTrue("could not find any contests in the db", contests != null && !contests.isEmpty());
    }

    public void testFullSaveAndFind() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Room ro = new Room();
        ro.setName("gp room " + System.currentTimeMillis());

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.addRoom(ro);
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));

        c.addRound(r);

        Prize cp = new Prize();
        cp.setAmount(1000f);
        cp.setPlace(1);
        cp.setType(OracleDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CASH));

        c.addPrize(cp);

        Prize rp = new Prize();
        rp.setAmount(1000f);
        rp.setPlace(1);
        rp.setType(OracleDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CASH));

        r.addPrize(rp);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertFalse("did not create contest", c1 == null);
        assertFalse("did not create round", c1.getRounds().isEmpty());
        Round theRound = c1.getRounds().iterator().next();
        assertTrue("did not create room", theRound != null && !theRound.getRooms().isEmpty());
        assertTrue("did not create contest prize", c1.getPrizes().iterator().hasNext());
        assertTrue("did not create round prize", theRound.getPrizes().iterator().hasNext());

    }


}
