package com.topcoder.web.oracle.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateInfo;
import com.topcoder.web.oracle.model.Contest;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.RoomResult;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundRegistration;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class CandidateDAOTestCase extends TCHibernateTestCase {


    public void testSaveAndFind() {
        Candidate c = new Candidate();
        c.setName("my candidate");

        OracleDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(c);
        Candidate c1 = OracleDAOUtil.getFactory().getCandidateDAO().find(c.getId());
        assertFalse("could not find candidate in the db", c1 == null);
    }

    public void testSave() {
        Candidate c = new Candidate();
        c.setName("my candidate");

        CandidateInfo ci = new CandidateInfo();
        ci.setProperty(OracleDAOUtil.getFactory().getCandidatePropertyDAO().getProperties().get(0));

        OracleDAOUtil.getFactory().getCandidateDAO().saveOrUpdate(c);
        Candidate c1 = OracleDAOUtil.getFactory().getCandidateDAO().find(c.getId());
        assertFalse("could not find candidate in the db", c1 == null);
    }

    public void testGetCandidates() {
        User dok = DAOUtil.getFactory().getUserDAO().find(132456L);
        boolean found = false;
        for (Contest contest : OracleDAOUtil.getFactory().getContestDAO().getContests()) {
            log.debug("contest: " + contest.getId());
            for (Round round : contest.getRounds()) {
                log.debug("round: " + contest.getId());
                for (Room room : round.getRooms()) {
                    log.debug("room: " + room.getId());
                    if (room.getCandidateResults().size() > 0) {
                        if (OracleDAOUtil.getFactory().getRoundRegistrationDAO().find(round, dok) == null) {
                            found = true;
                            RoundRegistration rr = new RoundRegistration();
                            rr.setRound(round);
                            rr.setUser(dok);
                            rr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));
                            RoomResult roomR = new RoomResult();
                            roomR.setUser(dok);
                            room.addResult(roomR);
                            OracleDAOUtil.getFactory().getRoundRegistrationDAO().saveOrUpdate(rr);
                            OracleDAOUtil.getFactory().getRoomDAO().saveOrUpdate(room);
                            tearDown();
                            setUp();
                            List<Candidate> candidates = OracleDAOUtil.getFactory().getCandidateDAO().getCandidates(round.getId(), dok.getId());
                            for (Candidate c : candidates) {
                                log.debug(c.getName());
                            }
                            log.debug("candidates " + candidates);
                            assertFalse("candidates was null", candidates == null);
                            assertFalse("candidates empty", candidates.isEmpty());
                        }
                    }
                    if (found) break;
                }
                if (found) break;
            }
            if (found) break;
        }
        assertTrue("could not find anything", found);

    }


    public void testGetCandidatesByRound() {
        boolean found = false;
        for (Contest contest : OracleDAOUtil.getFactory().getContestDAO().getContests()) {
            log.debug("contest: " + contest.getId());
            for (Round round : contest.getRounds()) {
                log.debug("round: " + contest.getId());
                for (Room room : round.getRooms()) {
                    log.debug("room: " + room.getId());
                    if (room.getCandidateResults().size() > 0) {
                        found = true;
                        List<Candidate> candidates = OracleDAOUtil.getFactory().getCandidateDAO().getCandidates(round);
                        for (Candidate c : candidates) {
                            log.debug(c.getName());
                        }
                        log.debug("candidates " + candidates);
                        assertFalse("candidates was null", candidates == null);
                        assertFalse("candidates empty", candidates.isEmpty());
                    }
                }
                if (found) break;
            }
            if (found) break;
        }
        assertTrue("could not find anything", found);

    }
}
