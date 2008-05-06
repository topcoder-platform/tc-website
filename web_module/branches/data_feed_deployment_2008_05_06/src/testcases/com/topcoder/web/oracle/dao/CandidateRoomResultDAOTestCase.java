package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class CandidateRoomResultDAOTestCase extends TCHibernateTestCase {

    public void testFindById() {
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
        Candidate can = new Candidate();
        can.setName("my candidate");

        OracleDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(can);

        CandidateRoomResult crr = new CandidateRoomResult();
        crr.setAdvanced(true);
        crr.setCandidate(can);
        crr.setRoom(ro);


        ro.addCandidateResult(crr);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);


        tearDown();
        setUp();
        CandidateRoomResult crr1 = OracleDAOUtil.getFactory().getCandidateRoomResultDAO().find(ro.getId(), can.getId());

        assertFalse("cound not find candidate room result", crr1 == null);


    }


    public void testSave() {
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

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        Candidate can = new Candidate();
        can.setName("my candidate");

        OracleDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(can);


        CandidateRoomResult crr = new CandidateRoomResult();
        crr.setAdvanced(true);
        crr.setCandidate(can);
        crr.setRoom(ro);

        OracleDAOUtil.getFactory().getCandidateRoomResultDAO().saveOrUpdate(crr);
        tearDown();
        setUp();

        CandidateRoomResult crr1 = OracleDAOUtil.getFactory().getCandidateRoomResultDAO().find(ro, can);

        assertFalse("did not create candidate room result", crr1 == null);

    }

}
