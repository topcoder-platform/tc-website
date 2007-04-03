package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 23, 2007
 */
public class PredictionDAOTestCase extends TCHibernateTestCase {

    public void testSaveAndFind() {
        User dok = DAOUtil.getFactory().getUserDAO().find(132456L);
        boolean found = false;
        for (Contest contest : OracleDAOUtil.getFactory().getContestDAO().getContests()) {
            log.debug("contest: " + contest.getId());
            for (Round round : contest.getRounds()) {
                log.debug("round: "  + contest.getId());
                for (Room room : round.getRooms()) {
                    log.debug("room: " + room.getId());
                    for (CandidateRoomResult candidateRoomResult : room.getCandidateResults()) {
                        log.debug("candidate " + candidateRoomResult.getCandidate().getId());
                        Prediction p = new Prediction();
                        p.setRoom(room);
                        p.setUser(dok);
                        p.setCandidate(candidateRoomResult.getCandidate());
                        p.setValue(939);
                        p.setScore(39.29d);
                        found = true;

                        OracleDAOUtil.getFactory().getPredictionDAO().saveOrUpdate(p);
                        tearDown();
                        setUp();
                        Prediction p1 = OracleDAOUtil.getFactory().getPredictionDAO().find(p.getId());
                        assertFalse("prediction not found", p1 == null);
                        break;
                    }
                    if (found) break;
                }
                if (found) break;
            }
            if (found) break;
        }
        assertTrue("could not find anything", found);
    }

    public void testSaveAndAlreadyCompeted() {
        User dok = DAOUtil.getFactory().getUserDAO().find(132456L);
        boolean found = false;
        for (Contest contest : OracleDAOUtil.getFactory().getContestDAO().getContests()) {
            log.debug("contest: " + contest.getId());
            for (Round round : contest.getRounds()) {
                log.debug("round: "  + contest.getId());
                for (Room room : round.getRooms()) {
                    log.debug("room: " + room.getId());
                    for (CandidateRoomResult candidateRoomResult : room.getCandidateResults()) {
                        log.debug("candidate " + candidateRoomResult.getCandidate().getId());
                        Prediction p = new Prediction();
                        p.setRoom(room);
                        p.setUser(dok);
                        p.setCandidate(candidateRoomResult.getCandidate());
                        p.setValue(939);
                        p.setScore(39.29d);
                        found = true;

                        OracleDAOUtil.getFactory().getPredictionDAO().saveOrUpdate(p);
                        tearDown();
                        setUp();
                        assertTrue("prediction not found", 
                                OracleDAOUtil.getFactory().getPredictionDAO().alreadyCompeted(dok.getId(), room.getId()));
                        break;
                    }
                    if (found) break;
                }
                if (found) break;
            }
            if (found) break;
        }
        assertTrue("could not find anything", found);
    }


}
