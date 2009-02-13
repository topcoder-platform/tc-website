package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.voting.*;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.CandidateRoomResultDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.PredictionDAO;
import com.topcoder.web.oracle.model.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 3, 2007
 */
public class ViewProvisionalResults extends Base {
    protected void dbProcessing() throws Exception {
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


                Room tempRoom;
                CandidateRoomResult tempCrr;

                ArrayList<Room> rooms = new ArrayList<Room>();

                for (Room room : round.getRooms()) {
                    tempRoom = new Room();
                    tempRoom.setId(room.getId());
                    tempRoom.setName(room.getName());
                    rooms.add(tempRoom);

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

                    CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
                    for (RankedResult result : csr.getResults()) {
                        tempCrr = new CandidateRoomResult();
                        tempCrr.setRoom(tempRoom);
                        tempCrr.setCandidate(cDAO.find(result.getCandidate().getId().intValue()));
                        tempCrr.setCorrectValue(result.getRank());
                        tempRoom.addCandidateResult(tempCrr);

                    }


                }


                HashMap<Integer, List> results = new HashMap<Integer, List>();

                for (Room room : rooms) {
                    ArrayList<CandidateRoomResult> a = new ArrayList<CandidateRoomResult>(room.getCandidateResults());
                    Collections.sort(a, new CandidateRoomResult.CorrectValueComparator());
                    results.put(room.getId(), a);
                }

                getRequest().setAttribute("rooms", rooms);
                getRequest().setAttribute("results", results);
                setNextPage("/admin/provisionalResults.jsp");
                setIsNextPageInContext(true);


            }
        }
    }
}
