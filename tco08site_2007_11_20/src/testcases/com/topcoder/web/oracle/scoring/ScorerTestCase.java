package com.topcoder.web.oracle.scoring;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.TCHibernateTestCase;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.PredictionDAO;
import com.topcoder.web.oracle.model.*;

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
        ro.setName("gp room " + System.currentTimeMillis() + " " + 1);

        Room ro1 = new Room();
        ro1.setName("gp room " + System.currentTimeMillis() + " " + 2);

        Round r = new Round();
        r.setName("gp round " + System.currentTimeMillis());
        r.addRoom(ro);
        r.addRoom(ro1);
        r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.UNACTIVE));
        RoundConfig cc = new RoundConfig();
        cc.setProperty(OracleDAOUtil.getFactory().getRoundPropertyDAO().find(RoundProperty.MAX_SELECTED_CANDIDATES));
        cc.setValue("5");
        r.addConfig(cc);

        RoundConfig cc1 = new RoundConfig();
        cc1.setProperty(OracleDAOUtil.getFactory().getRoundPropertyDAO().find(RoundProperty.NUMBER_OF_CANDIDDATE_ADVANCERS));
        cc1.setValue("5");
        r.addConfig(cc1);

        c.addRound(r);

        Candidate canTemp;
        CandidateRoomResult crrTemp;
        CandidateRoomResult crrTemp1;
        CandidateDAO canDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        for (int i = 0; i < 50; i++) {
            canTemp = new Candidate();
            canTemp.setName("scoretest " + i + " " + System.currentTimeMillis());
            canDAO.saveOrUpdate(canTemp);
            crrTemp = new CandidateRoomResult();
            crrTemp.setCandidate(canTemp);
            crrTemp.setCorrectValue(i);
            ro.addCandidateResult(crrTemp);

            crrTemp1 = new CandidateRoomResult();
            crrTemp1.setCandidate(canTemp);
            crrTemp1.setCorrectValue(i);
            ro1.addCandidateResult(crrTemp1);

        }

        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        User dok = userDAO.find(132456l);

        ArrayList<User> users = new ArrayList<User>();
        userDAO = DAOUtil.getFactory().getUserDAO();
        users.add(dok);
        users.add(userDAO.find("ntrefz", true));
        users.add(userDAO.find("mike", true));
        users.add(userDAO.find("TheFaxman", true));
        users.add(userDAO.find("mbnd96", true));
        users.add(userDAO.find("fenway", true));
        users.add(userDAO.find(104972l));
        users.add(userDAO.find(104973l));
        users.add(userDAO.find(104974l));
        users.add(userDAO.find(104975l));
        users.add(userDAO.find(104976l));
        users.add(userDAO.find(104977l));
        users.add(userDAO.find(104978l));
        users.add(userDAO.find(104979l));
        users.add(userDAO.find(104980l));
        users.add(userDAO.find(104995l));
        users.add(userDAO.find(104997l));
        users.add(userDAO.find(104999l));
        users.add(userDAO.find(105000l));
        users.add(userDAO.find(105003l));
        users.add(userDAO.find(105004l));
        users.add(userDAO.find(105008l));
        users.add(userDAO.find(105010l));
        users.add(userDAO.find(105012l));
        users.add(userDAO.find(105013l));
        users.add(userDAO.find(105014l));
        users.add(userDAO.find(105016l));
        users.add(userDAO.find(105018l));
        users.add(userDAO.find(105020l));
        users.add(userDAO.find(105021l));
        users.add(userDAO.find(105022l));
        users.add(userDAO.find(105023l));
        users.add(userDAO.find(105024l));
        users.add(userDAO.find(105025l));
        users.add(userDAO.find(105026l));
        users.add(userDAO.find(105027l));
        users.add(userDAO.find(105029l));
        users.add(userDAO.find(105506l));
        users.add(userDAO.find(105553l));
        users.add(userDAO.find(105742l));
        users.add(userDAO.find(105753l));
        users.add(userDAO.find(105754l));
        users.add(userDAO.find(105755l));
        users.add(userDAO.find(105774l));
        users.add(userDAO.find(105775l));
        users.add(userDAO.find(105786l));
        users.add(userDAO.find(105787l));
        users.add(userDAO.find(105793l));
        users.add(userDAO.find(105804l));
        users.add(userDAO.find(105805l));
        users.add(userDAO.find(105806l));
        users.add(userDAO.find(105815l));
        users.add(userDAO.find(105833l));
        users.add(userDAO.find(105843l));
        users.add(userDAO.find(105857l));
        users.add(userDAO.find(105858l));
        users.add(userDAO.find(105859l));
        users.add(userDAO.find(105871l));
        users.add(userDAO.find(105873l));
        users.add(userDAO.find(105878l));
        users.add(userDAO.find(105880l));
        users.add(userDAO.find(105900l));
        users.add(userDAO.find(105901l));
        users.add(userDAO.find(105903l));
        users.add(userDAO.find(105904l));
        users.add(userDAO.find(105914l));
        users.add(userDAO.find(105916l));
        users.add(userDAO.find(105917l));
        users.add(userDAO.find(105918l));
        users.add(userDAO.find(105919l));
        users.add(userDAO.find(105920l));
        users.add(userDAO.find(105921l));
        users.add(userDAO.find(105922l));
        users.add(userDAO.find(105959l));
        users.add(userDAO.find(105964l));
        users.add(userDAO.find(105965l));
        users.add(userDAO.find(105969l));
        users.add(userDAO.find(105972l));
        users.add(userDAO.find(105973l));
        users.add(userDAO.find(105995l));
        users.add(userDAO.find(106013l));
        users.add(userDAO.find(106027l));
        users.add(userDAO.find(106033l));
        users.add(userDAO.find(106034l));
        users.add(userDAO.find(106036l));
        users.add(userDAO.find(106039l));
        users.add(userDAO.find(106084l));
        users.add(userDAO.find(106098l));
        users.add(userDAO.find(106120l));
        users.add(userDAO.find(106121l));
        users.add(userDAO.find(106122l));
        users.add(userDAO.find(106152l));
        users.add(userDAO.find(106162l));
        users.add(userDAO.find(106166l));
        users.add(userDAO.find(106169l));
        users.add(userDAO.find(106178l));
        users.add(userDAO.find(106184l));
        users.add(userDAO.find(106197l));
        users.add(userDAO.find(106204l));
        users.add(userDAO.find(106221l));
        users.add(userDAO.find(106222l));
        users.add(userDAO.find(106225l));
        users.add(userDAO.find(106226l));
        users.add(userDAO.find(106227l));
        users.add(userDAO.find(106232l));
        users.add(userDAO.find(106233l));
        users.add(userDAO.find(106235l));
        users.add(userDAO.find(106236l));
        users.add(userDAO.find(106313l));
        users.add(userDAO.find(106354l));
        users.add(userDAO.find(106370l));
        users.add(userDAO.find(106371l));
        users.add(userDAO.find(106380l));
        users.add(userDAO.find(106382l));
        users.add(userDAO.find(106385l));
        users.add(userDAO.find(106390l));
        users.add(userDAO.find(106407l));
        users.add(userDAO.find(106411l));
        users.add(userDAO.find(106414l));
        users.add(userDAO.find(106419l));
        users.add(userDAO.find(106420l));
        users.add(userDAO.find(106468l));
        users.add(userDAO.find(106469l));
        users.add(userDAO.find(106475l));
        users.add(userDAO.find(106476l));
        users.add(userDAO.find(106495l));
        users.add(userDAO.find(106507l));
        users.add(userDAO.find(106514l));
        users.add(userDAO.find(106531l));
        users.add(userDAO.find(106532l));
        users.add(userDAO.find(106544l));
        users.add(userDAO.find(106620l));
        users.add(userDAO.find(106710l));
        users.add(userDAO.find(106716l));
        users.add(userDAO.find(106771l));
        users.add(userDAO.find(106895l));
        users.add(userDAO.find(106909l));
        users.add(userDAO.find(106910l));
        users.add(userDAO.find(107041l));
        users.add(userDAO.find(107045l));
        users.add(userDAO.find(107053l));
        users.add(userDAO.find(107058l));
        users.add(userDAO.find(107108l));
        users.add(userDAO.find(107118l));
        users.add(userDAO.find(107119l));
        users.add(userDAO.find(107160l));
        users.add(userDAO.find(107165l));
        users.add(userDAO.find(107175l));
        users.add(userDAO.find(107432l));
        users.add(userDAO.find(107443l));
        users.add(userDAO.find(107458l));
        users.add(userDAO.find(107708l));
        users.add(userDAO.find(107709l));
        users.add(userDAO.find(107741l));
        users.add(userDAO.find(107746l));
        users.add(userDAO.find(107785l));
        users.add(userDAO.find(107790l));
        users.add(userDAO.find(107798l));
        users.add(userDAO.find(107799l));
        users.add(userDAO.find(107801l));
        users.add(userDAO.find(107811l));


        boolean doof = false;
        for (User u1 : users) {
            RoomResult rr = new RoomResult();
            rr.setUser(u1);

            if (doof) {
            ro.addResult(rr);
            } else {
                ro1.addResult(rr);
            }
            doof = !doof;
        }


        OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

        tearDown();
        setUp();
        canDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        PredictionDAO predDAO = OracleDAOUtil.getFactory().getPredictionDAO();
        List<Candidate> candidates = canDAO.getCandidates(r.getId(), dok.getId());
        Prediction p;
        Random rand = new Random();
        ArrayList<Integer> predictionValues = new ArrayList<Integer>(5);
        for (int i = 0; i < 5; i++) {
            predictionValues.add(i + 1);
        }


        for (User u1 : users) {
            Collections.shuffle(predictionValues);
            for (Integer p1 : predictionValues) {
                p = new Prediction();
                if (doof) {
                    p.setRoom(ro);
                } else {
                    p.setRoom(ro1);
                }
                p.setCandidate(candidates.get(rand.nextInt(50)));
                p.setUser(u1);
                p.setValue(p1);
                predDAO.saveOrUpdate(p);
                doof = !doof;
            }
        }
        tearDown();
        setUp();

        try {
            Set<Prediction> predResult = new BasicScorer().generateScores(OracleDAOUtil.getFactory().getRoundDAO().find(r.getId()));
            assertFalse("null results", predResult == null);
            assertFalse("empty results", predResult.isEmpty());
            assertTrue("incorrect number of predictions scored " + predResult.size(), predResult.size() == users.size() * predictionValues.size());
        } catch (GeneralScoringException e) {
            assertFalse("got an exception generating scores " + e.getMessage(), true);
        }

    }
}
