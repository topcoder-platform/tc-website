package com.topcoder.web.oracle.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoomDAOTestCase extends TCHibernateTestCase {


    public void testFindSmallestRoomById() {

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));


        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));

        Room ro = new Room();
        ro.setName("gp room " + System.currentTimeMillis());
        r.addRoom(ro);
        Room ro1 = new Room();
        ro1.setName("gp room " + System.currentTimeMillis());
        r.addRoom(ro1);

        c.addRound(r);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();

        Room r2 = OracleDAOUtil.getFactory().getRoomDAO().findSmallestRoom(r.getId());
        assertFalse("found no room", r2 == null);


    }

    public void testAddResult() {

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));

        Room ro = new Room();
        ro.setName("gp room " + System.currentTimeMillis());
        r.addRoom(ro);
        Room ro1 = new Room();
        ro1.setName("gp room " + System.currentTimeMillis());
        r.addRoom(ro1);

        c.addRound(r);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();

        Room r2 = OracleDAOUtil.getFactory().getRoomDAO().findSmallestRoom(r.getId());
        RoomResult rr = new RoomResult();
        r2.addResult(rr);
        rr.setUser(DAOUtil.getFactory().getUserDAO().find(132456l));
        rr.setAdvanced(false);
        rr.setAttended(false);

        OracleDAOUtil.getFactory().getRoomDAO().saveOrUpdate(r2);

        tearDown();
        setUp();

        assertTrue("found no room result", OracleDAOUtil.getFactory().getRoomDAO().find(r2.getId()).getResults().iterator().hasNext());


    }


}
