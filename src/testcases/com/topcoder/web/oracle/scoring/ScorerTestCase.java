package com.topcoder.web.oracle.scoring;

import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.PredictionDAO;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class ScorerTestCase extends TCHibernateTestCase {
    public void testBasicScorer() {
        //create a contest with a round with 1 room with 50 candidates
        //create 100 competitors in that round
        //have them each make 5 predictions (at random)
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
        RoundConfig cc = new RoundConfig();
        cc.setProperty(OracleDAOUtil.getFactory().getRoundPropertyDAO().find(RoundProperty.MAX_SELECTED_CANDIDATES));
        cc.setValue("5");
        r.addConfig(cc);

        c.addRound(r);

        Candidate canTemp;
        CandidateRoomResult crrTemp;
        CandidateDAO canDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        for (int i=0; i<50; i++) {
            canTemp = new Candidate();
            canTemp.setName("scoretest " + i + " " + System.currentTimeMillis());
            canDAO.saveOrUpdate(canTemp);
            crrTemp = new CandidateRoomResult();
            crrTemp.setAdvanced(true);
            crrTemp.setCandidate(canTemp);
            crrTemp.setCorrectValue(i);
            ro.addCandidateResult(crrTemp);
        }

        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        User dok = userDAO.find(132456l);
        RoomResult rr = new RoomResult();
        rr.setUser(dok);
        ro.addResult(rr);

        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        tearDown();
        setUp();
        canDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        PredictionDAO predDAO = OracleDAOUtil.getFactory().getPredictionDAO();
        List<Candidate> candidates = canDAO.getCandidates(r.getId(), dok.getId());
        Prediction p;
        Random rand = new Random();
        ArrayList<Integer> predictionValues = new ArrayList<Integer>(5);
        for (int i=0; i<5; i++) {
            predictionValues.add(i+1);
        }
        ArrayList<User> users = new ArrayList<User>();
        userDAO = DAOUtil.getFactory().getUserDAO();
        users.add(dok);
        users.add(userDAO.find("ntrefz", true));
        users.add(userDAO.find("mike", true));
        users.add(userDAO.find("TheFaxman", true));
        users.add(userDAO.find("mbnd96", true));
        users.add(userDAO.find("fenway", true));

        for (User u1 : users) {
            Collections.shuffle(predictionValues);
            for (Integer p1 : predictionValues) {
                p = new Prediction();
                p.setRound(r);
                p.setCandidate(candidates.get(rand.nextInt(50)));
                p.setUser(u1);
                p.setValue(p1);
                predDAO.saveOrUpdate(p);
            }
        }
        tearDown();
        setUp();

        try {
            Set<Prediction> predResult = new BasicScorer().generateScores(OracleDAOUtil.getFactory().getRoundDAO().find(r.getId()));
            assertFalse("null results", predResult==null);
            assertFalse("empty results", predResult.isEmpty());
            assertTrue("incorrect number of predictions scored " + predResult.size(), predResult.size()==users.size()*predictionValues.size());
        } catch (GeneralScoringException e) {
            assertFalse("got an exception generating scores " + e.getMessage(), true);
        }

    }
}
