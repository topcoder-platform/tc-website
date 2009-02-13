package com.topcoder.web.oracle.scoring;

import com.topcoder.web.oracle.model.CandidateRoomResult;
import com.topcoder.web.oracle.model.Prediction;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class BasicScorer implements Scorer {

    public final static int MAX_CANDIDATES_IN_SCORING = 16;

    public Set<Prediction> generateScores(Round round) throws GeneralScoringException {

        HashSet<Prediction> ret = new HashSet<Prediction>(100);

        int[] magicMapping = new int[MAX_CANDIDATES_IN_SCORING + 1];
        for (int i = 1; i <= MAX_CANDIDATES_IN_SCORING; i++) {
            magicMapping[i] = magicNumber(i, MAX_CANDIDATES_IN_SCORING);
        }

        HashMap<Integer, Integer> candidateResultMap;
        List<CandidateRoomResult> results;

        for (Room room : round.getRooms()) {
            candidateResultMap = new HashMap<Integer, Integer>();

            results = new ArrayList<CandidateRoomResult>(room.getCandidateResults());
            for (CandidateRoomResult crr : results) {
                if (crr.getCorrectValue() == null) {
                    throw new GeneralScoringException("Candidate does not have a correct value set " +
                            crr.getCandidate().getName() + " (" + crr.getCandidate().getId() + ")");
                } else {
                    //only include the top 16.  we won't bother including any others in the scoring.
                    //we're including 16 (even if they're only going to rank 5) because that will
                    //give us more data to compare against for scoring.
                    if (crr.getCorrectValue() <= MAX_CANDIDATES_IN_SCORING) {
                        candidateResultMap.put(crr.getCandidate().getId(), crr.getCorrectValue());

                    }
                }
            }

            for (Prediction p : room.getPredictions()) {
                if (candidateResultMap.containsKey(p.getCandidate().getId())) {
                    int candidateVal = candidateResultMap.get(p.getCandidate().getId());
                    int delta = Math.abs(candidateVal - p.getValue());
                    p.setScore((double) magicMapping[candidateVal] / Math.pow(delta + 1, 2));
                } else {
                    p.setScore(0d);
                }
                ret.add(p);
            }
        }

        return ret;
    }

    /**
     * I've got this odd way of creating what you get for a score if you
     * get the value right on the nose.  Basically, it is such that
     * if you predict the top finisher correctly, you get enough points
     * so that no one who didn't predict the top finisher correctly
     * can beat you.  That extends on down.  If you predict the top 2
     * correctly, you can not be beaten by someone who did not get them both.
     * <p/>
     * For example if a competitor is predicting 5 spots.
     * magicNumber(n, 5) for n between 1 and 5 will be: 47, 23, 11, 5, 2
     *
     * @param n         - the place to determine how much it's worth if predicted correctly
     * @param numRanked - the number ranked
     * @return how much the nth place is worth if correctly predicted.
     */
    private int magicNumber(int n, int numRanked) {
        if (numRanked > 30) {
            throw new IllegalArgumentException("numRanked is too large.  It can be at most 30. " + numRanked);
        } else if (n > numRanked) {
            throw new IllegalArgumentException("numRanked must be greater than n " + numRanked + " " + n);
        } else {
            if (n == numRanked) {
                return 1;
            } else {
                return magicNumber(n + 1, numRanked) * 2 + 1;
            }
        }
    }
}
