package com.topcoder.web.oracle.roomassignment;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public class RandomAssignerTestCase extends TCHibernateTestCase {

    public void testOneFullRoom() {

        final int candidateCount = 50;

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));
        c.addRound(r);

        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        Candidate can;
        for (int i = 0; i < candidateCount; i++) {
            can = new Candidate();
            can.setName("gp candidate " + (i + 1));
            candidates.add(can);

        }
        CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        CandidateRoomAssigner ra = new RandomAssigner();
        List<Room> l = ra.createAssignments(candidates, r, candidateCount);
        for (Room myRoom : l) {
            log.debug("adding " + myRoom.getName());
            r.addRoom(myRoom);
            for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                cDAO.saveOrUpdate(crr.getCandidate());
            }
        }

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        int assCount = 0;
        int roundCount = 0;
        int roomCount = 0;
        for (Round round1 : c1.getRounds()) {
            roundCount++;
            for (Room room1 : round1.getRooms()) {
                roomCount++;
                assCount += room1.getCandidateResults().size();
            }
        }
        assertTrue("got " + roundCount + " rounds expected 1", roundCount == 1);
        assertTrue("got " + roomCount + " rooms expected 1", roomCount == 1);
        assertTrue("got " + assCount + " candidate assignments expected " + candidateCount, assCount == candidateCount);
    }

    public void testOnePartialRoom() {

        final int candidateCount = 41;

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));
        c.addRound(r);

        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        Candidate can;
        for (int i = 0; i < candidateCount; i++) {
            can = new Candidate();
            can.setName("gp candidate " + (i + 1));
            candidates.add(can);

        }
        CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        CandidateRoomAssigner ra = new RandomAssigner();
        List<Room> l = ra.createAssignments(candidates, r, candidateCount + 9);
        for (Room myRoom : l) {
            log.debug("adding " + myRoom.getName());
            r.addRoom(myRoom);
            for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                cDAO.saveOrUpdate(crr.getCandidate());
            }
        }

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        int assCount = 0;
        int roundCount = 0;
        int roomCount = 0;
        for (Round round1 : c1.getRounds()) {
            roundCount++;
            for (Room room1 : round1.getRooms()) {
                roomCount++;
                assCount += room1.getCandidateResults().size();
            }
        }
        assertTrue("got " + roundCount + " rounds expected 1", roundCount == 1);
        assertTrue("got " + roomCount + " rooms expected 1", roomCount == 1);
        assertTrue("got " + assCount + " candidate assignments expected " + candidateCount, assCount == candidateCount);
    }

    public void testSmallOverflow() {

        final int candidateCount = 41;

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));
        c.addRound(r);

        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        Candidate can;
        for (int i = 0; i < candidateCount; i++) {
            can = new Candidate();
            can.setName("gp candidate " + (i + 1));
            candidates.add(can);

        }
        CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        CandidateRoomAssigner ra = new RandomAssigner();
        List<Room> l = ra.createAssignments(candidates, r, candidateCount - 1);
        for (Room myRoom : l) {
            log.debug("adding " + myRoom.getName());
            r.addRoom(myRoom);
            for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                cDAO.saveOrUpdate(crr.getCandidate());
            }
        }

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        int assCount = 0;
        int roundCount = 0;
        int roomCount = 0;
        for (Round round1 : c1.getRounds()) {
            roundCount++;
            for (Room room1 : round1.getRooms()) {
                roomCount++;
                assCount += room1.getCandidateResults().size();
            }
        }
        assertTrue("got " + roundCount + " rounds expected 1", roundCount == 1);
        assertTrue("got " + roomCount + " rooms expected 2", roomCount == 2);
        assertTrue("got " + assCount + " candidate assignments expected " + candidateCount, assCount == candidateCount);
    }

    public void testManyRoomEven() {

        final int candidateCount = 70;

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));
        c.addRound(r);

        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        Candidate can;
        for (int i = 0; i < candidateCount; i++) {
            can = new Candidate();
            can.setName("gp candidate " + (i + 1));
            candidates.add(can);

        }
        CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        CandidateRoomAssigner ra = new RandomAssigner();
        List<Room> l = ra.createAssignments(candidates, r, candidateCount / 10);
        for (Room myRoom : l) {
            log.debug("adding " + myRoom.getName());
            r.addRoom(myRoom);
            for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                cDAO.saveOrUpdate(crr.getCandidate());
            }
        }

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        int assCount = 0;
        int roundCount = 0;
        int roomCount = 0;
        for (Round round1 : c1.getRounds()) {
            roundCount++;
            for (Room room1 : round1.getRooms()) {
                roomCount++;
                assCount += room1.getCandidateResults().size();
            }
        }
        assertTrue("got " + roundCount + " rounds expected 1", roundCount == 1);
        assertTrue("got " + roomCount + " rooms expected 10", roomCount == 10);
        assertTrue("got " + assCount + " candidate assignments expected " + candidateCount, assCount == candidateCount);
    }

    public void testManyRoomNotEven() {

        final int candidateCount = 70;

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setType(OracleDAOUtil.getFactory().getContestTypeDAO().find(ContestType.STUDIO_WINNER));
        c.setStatus(OracleDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));
        c.addRound(r);

        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        Candidate can;
        for (int i = 0; i < candidateCount; i++) {
            can = new Candidate();
            can.setName("gp candidate " + (i + 1));
            candidates.add(can);

        }
        CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        CandidateRoomAssigner ra = new RandomAssigner();
        List<Room> l = ra.createAssignments(candidates, r, 11);
        for (Room myRoom : l) {
            log.debug("adding " + myRoom.getName());
            r.addRoom(myRoom);
            for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                cDAO.saveOrUpdate(crr.getCandidate());
            }
        }

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        tearDown();
        setUp();
        Contest c1 = OracleDAOUtil.getFactory().getContestDAO().find(c.getId());
        int assCount = 0;
        int roundCount = 0;
        int roomCount = 0;
        for (Round round1 : c1.getRounds()) {
            roundCount++;
            for (Room room1 : round1.getRooms()) {
                roomCount++;
                assCount += room1.getCandidateResults().size();
            }
        }
        assertTrue("got " + roundCount + " rounds expected 1", roundCount == 1);
        assertTrue("got " + roomCount + " rooms expected 7", roomCount == 7);
        assertTrue("got " + assCount + " candidate assignments expected " + candidateCount, assCount == candidateCount);
    }


}
