package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.voting.*;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.CandidateRoomResultDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.PredictionDAO;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.oracle.scoring.BasicScorer;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class GenerateResults extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //todo figure out if the round is over
        //todo only accept post requests
        if (userLoggedIn()) {
            String roundId = getRequest().getParameter(Constants.ROUND_ID);
            if ("".equals(StringUtils.checkNull(roundId))) {
                throw new NavigationException("No round specified");
            } else {
                Integer rid;
                try {
                    rid = new Integer(roundId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid round specified");
                }
                Round round = OracleDAOUtil.getFactory().getRoundDAO().find(rid);


                Integer numAdvancing = new Integer(round.getConfigMap().get(RoundProperty.NUMBER_OF_CANDIDDATE_ADVANCERS));
                if (log.isDebugEnabled()) {
                    log.debug("num advancing : " + numAdvancing);
                }
                List<CandidateRoomResult> candidateResults = getCanidateResults(round);

                log.debug("candidate room results: ");
                for (CandidateRoomResult result : candidateResults) {
                    //we're assuming the the correct value is the same as their placement.  at least for now.
                    // this might not be the case in the future
                    result.setPlaced(result.getCorrectValue());
                    result.setAdvanced(result.getCorrectValue() <= numAdvancing);
                    if (log.isDebugEnabled()) {
                        log.debug(result.getId().toString());
                    }
                }

                //todo put in logic so that other scoring systems can instantiated and use via reflection based on user input
                Set<Prediction> predResult = new BasicScorer().generateScores(round);
                if (log.isDebugEnabled()) {
                    log.debug("predictions: " + predResult.size());
                }

                //figure out the scores for competitors
                HashMap<String, Double> userMap = new HashMap<String, Double>();
                Double score;
                String key;
                for (Prediction pred : predResult) {
                    key = pred.getUser().getId() + " " + pred.getRoom().getId();
                    score = userMap.get(key);
                    if (score == null) {
                        score = 0d;
                    }
                    userMap.put(key, score + pred.getScore());
                    if (log.isDebugEnabled()) {
                        log.debug("adding to user map " + pred.getUser().getId() + " " + (score + pred.getScore()));
                    }
                }

                ArrayList<ArrayList<RoomResult>> results = new ArrayList<ArrayList<RoomResult>>(round.getRooms().size());
                ArrayList<RoomResult> tempRoomResults;
                for (Room room : round.getRooms()) {
                    tempRoomResults = new ArrayList<RoomResult>(room.getResults().size());
                    for (RoomResult rr : room.getResults()) {
                        key = rr.getUser().getId() + " " + rr.getRoom().getId();
                        if (userMap.containsKey(key)) {
                            rr.setScore(userMap.get(key));
                            tempRoomResults.add(rr);
                        }
                    }
                    results.add(tempRoomResults);
                }

                for (ArrayList<RoomResult> roomResults : results) {
                    int currPlaced = 0;
                    Double lastScore = -666d;
                    Collections.sort(roomResults, new RoomResult.ScoreComparator());
                    for (RoomResult rr : roomResults) {
                        //todo consider adding epsilon for comparison
                        if (!rr.getScore().equals(lastScore)) {
                            currPlaced++;
                        }
                        rr.setPlaced(currPlaced);
                        if (log.isDebugEnabled()) {
                            log.debug("setting " + rr.getUser().getHandle() + " placed to " + rr.getPlaced());
                        }
                    }
                }

                StringBuffer buf = new StringBuffer(50);
                buf.append(getSessionInfo().getServletPath());
                buf.append("?" + Constants.MODULE_KEY + "=Static&");
                buf.append(Constants.STATIC_PREFIX).append("1=admin&");
                buf.append(Constants.STATIC_PREFIX).append("2=generateResultsSuccess");
                setNextPage(buf.toString());
                setIsNextPageInContext(false);

            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }


    private List<CandidateRoomResult> getCanidateResults(Round r) {

        ArrayList<CandidateRoomResult> ret = new ArrayList<CandidateRoomResult>(100);
        PredictionDAO pDAO = OracleDAOUtil.getFactory().getPredictionDAO();
        CandidateRoomResultDAO crrDAO = OracleDAOUtil.getFactory().getCandidateRoomResultDAO();
        com.topcoder.web.common.voting.Candidate c;
        HashMap<Integer, com.topcoder.web.common.voting.Candidate> candidateMap =
                new HashMap<Integer, com.topcoder.web.common.voting.Candidate>();

        RankBallot ballot;
        Vote v;
        CondorcetSchulzeElection cs;
        CandidateRoomResult crr;
        for (Room room : r.getRooms()) {
            ArrayList<com.topcoder.web.common.voting.Candidate> cans =
                    new ArrayList<com.topcoder.web.common.voting.Candidate>();
            for (CandidateRoomResult cr : room.getCandidateResults()) {
                c = new com.topcoder.web.common.voting.Candidate();
                c.setName(cr.getCandidate().getName());
                c.setId((long) cr.getCandidate().getId());
                cans.add(c);
                candidateMap.put(cr.getCandidate().getId(), c);
            }
            cs = new CondorcetSchulzeElection();
            cs.getCandidates().addAll(cans);

            for (RoomResult rr : room.getResults()) {
                ballot = new RankBallot();
                ballot.setUser(rr.getUser());
                for (Prediction p : pDAO.getPredictions(rr.getUser().getId(), room.getId())) {
                    v = new Vote();
                    v.setRank(p.getValue());
                    v.setCandidate(candidateMap.get(p.getCandidate().getId()));
                    ballot.addVote(v);
                }
                cs.addBallot(ballot);
            }

            CondorcetSchulzeResults csr = new CondorcetSchulzeResults(cs);
            for (RankedResult result : csr.getResults()) {
                crr = crrDAO.find(room.getId(), result.getCandidate().getId().intValue());
                crr.setCorrectValue(result.getRank());
                ret.add(crr);
            }
            if (log.isDebugEnabled()) {
                log.debug("size after doing " + room.getId() + " " + ret.size());
            }
        }
        return ret;

    }

}
