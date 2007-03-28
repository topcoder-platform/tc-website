package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.scoring.BasicScorer;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.RoomResultDAO;
import com.topcoder.web.oracle.model.*;

import java.util.Set;
import java.util.List;
import java.util.Collections;
import java.util.HashMap;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class GenerateResults extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //todo figure out if the round is over
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

                //todo put in logic so that other scoring systems can instantiated and use via reflection based on user input
                Set<Prediction> predResult = new BasicScorer().generateScores(round);


                Integer numAdvancing = new Integer(round.getContest().getConfigMap().get(ContestProperty.NUMBER_OF_CANDIDDATE_ADVANCERS));
                List<CandidateRoomResult> candidateResults = OracleDAOUtil.getFactory().getCandidateRoomResultDAO().getResults(round);

                Collections.sort(candidateResults, new CandidateRoomResult.CorrectValueComparator());

                for (CandidateRoomResult result : candidateResults) {
                    //we're assuming the the correct value is the same as their placement.  at least for now.
                    // this might not be the case in the future
                    result.setPlaced(result.getCorrectValue());
                    if (result.getCorrectValue() <= numAdvancing) {
                        result.setAdvanced('Y');
                    }
                }

                //figure out the scores for competitors
                HashMap<Long,Float> userMap = new HashMap<Long,Float>();
                Float score;
                for (Prediction pred : predResult) {
                    score = userMap.get(pred.getUser().getId());
                    if (score == null) {
                        score = 0f;
                        userMap.put(pred.getUser().getId(),score);
                    }
                    userMap.put(pred.getUser().getId(), score+pred.getScore());
                }

                RoomResultDAO rrDAO = OracleDAOUtil.getFactory().getRoomResultDAO();
                List<RoomResult> roomResults = rrDAO.getResults(round);
                for (RoomResult rr : roomResults) {
                    rr.setScore(userMap.get(rr.getUser().getId()));
                }
                int currPlaced = 1;
                Float lastScore = -666f;
                Collections.sort(roomResults, new RoomResult.ScoreComparator());
                for (RoomResult rr: roomResults) {
                    if (!rr.getScore().equals(lastScore)) {
                        currPlaced++;
                    }
                    rr.setPlaced(currPlaced);
                }

                StringBuffer buf = new StringBuffer(50);
                buf.append(getSessionInfo().getServletPath());
                buf.append("?" + Constants.MODULE_KEY + "=Static&");
                buf.append(Constants.STATIC_PREFIX).append("1=admin");
                buf.append(Constants.STATIC_PREFIX).append("1=endRoundSuccess");
                setNextPage(buf.toString());
                setIsNextPageInContext(false);

            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }



}
