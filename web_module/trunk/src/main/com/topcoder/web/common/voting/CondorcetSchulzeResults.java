package com.topcoder.web.common.voting;

import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class CondorcetSchulzeResults implements Serializable {

    private static final Logger log = Logger.getLogger(CondorcetSchulzeResults.class);
    private Matrix strengthMatrix;
    private Set candidates;
    private List results;
    private Matrix sumMatrix;

    public CondorcetSchulzeResults(CondorcetSchulzeElection election) {
        this.strengthMatrix = election.getBeatPathStrengthMatrix();
        this.candidates = election.getCandidates();
        this.results = buildResults();
        this.sumMatrix = election.getSumMatrix();
    }

    public boolean hasSingleWinner() {
        if (results.size() > 1) {
            return ((RankedResult) results.get(1)).getRank() > ((RankedResult) results.get(0)).getRank();
        } else {
            return results.size() == 1;
        }
    }

    public List getResults() {
        return results;
    }

    public Matrix getSumMatrix() {
        return sumMatrix;
    }

    public Candidate getWinner() {
        if (!hasSingleWinner()) {
            throw new RuntimeException("Please be sure there is only one winner before calling this method.");
        } else {
            return ((RankedResult) results.get(0)).getCandidate();
        }
    }

    public List getWinners() {

        List ret = new ArrayList();
        if (results.size() > 0) {
            ret.add(results.get(0));
        }
        if (results.size() > 1) {
            for (int i = 1; i < results.size(); i++) {
                if (((RankedResult) results.get(i)).getRank() == ((RankedResult) results.get(0)).getRank()) {
                    ret.add(results.get(i));
                }
            }
        }
        return ret;
    }

    /**
     * @return a <code>RankedResult</code> array containing the results
     */
    private List buildResults() {
        BigInteger len = new BigInteger(String.valueOf(candidates.size()));
        BigInteger two = new BigInteger("2");
        Pair[] ret = new Pair[(f(len).divide(f(len.subtract(two))).divide(two)).intValue()];
        //log.debug("result size is " + ret.length);
        //log.debug("strength matrix \n" + m.toString());
        int count = 0;
        //build out all the win lose tie information using the strength matrix
        for (int i = 0; i < candidates.size(); i++) {
            for (int j = i; j < candidates.size(); j++) {
                if (i != j) {
                    if (strengthMatrix.beat(i, j)) {
                        //log.debug(i + "adding a win for " + candidates[i].toString() + " over " + candidates[j].toString());
                        ret[count] = new Pair(strengthMatrix.getCandidate(i), strengthMatrix.getCandidate(j), false);
                    } else if (strengthMatrix.tie(i, j)) {
                        //log.debug(i + "adding a tie betwne " + candidates[i].toString() + " and " + candidates[j].toString());
                        ret[count] = new Pair(strengthMatrix.getCandidate(i), strengthMatrix.getCandidate(j), true);
                    } else {
                        //log.debug(i + "adding a win for " + candidates[j].toString() + " over " + candidates[i].toString());
                        ret[count] = new Pair(strengthMatrix.getCandidate(j), strengthMatrix.getCandidate(i), false);
                    }
                    count++;
                }
            }
        }

        //build a map between candidates and the number of loses they have
        MapEntry[] map = new MapEntry[candidates.size()];
        for (int i = 0; i < map.length; i++) {
            map[i] = new MapEntry(strengthMatrix.getCandidate(i));
        }
        for (int i = 0; i < ret.length; i++) {
            if (!ret[i].isTie()) {
                map[strengthMatrix.getIndex(ret[i].getCandidateB())].incrementLoseCount();
            }
        }

        if (log.isDebugEnabled()) {
            log.debug("strength matrix ****************************");
            log.debug(strengthMatrix);
            log.debug("strength matrix ****************************");
            log.debug("sum matrix ****************************");
            log.debug(sumMatrix);
            log.debug("sum matrix ****************************");
        }
        Arrays.sort(map);
        if (log.isDebugEnabled()) {
            for (MapEntry me : map) {
                log.debug("candidate num loses " + me.getCandidate().getId() + " " + me.getLoseCount());
            }
        }
        ArrayList results = new ArrayList(map.length);
        int lastLoses = -1;
        int rank = 0;
        for (int i = 0; i < map.length; i++) {
            if (map[i].getLoseCount() != lastLoses) {
                rank = i + 1;
            }
            results.add(new RankedResult(map[i].getCandidate(), rank));
            lastLoses = map[i].getLoseCount();
        }

        return results;
    }

    private class MapEntry implements Comparable {
        private Candidate candidate;
        private int loseCount;

        private MapEntry(Candidate candidate) {
            this.candidate = candidate;
            this.loseCount = 0;
        }

        private void incrementLoseCount() {
            loseCount++;
        }

        private Candidate getCandidate() {
            return this.candidate;
        }

        private int getLoseCount() {
            return this.loseCount;
        }

        public int compareTo(Object o) {
            return new Integer(loseCount).compareTo(new Integer(((MapEntry) o).loseCount));
        }

    }

    private static final BigInteger one = new BigInteger("1");

    private static BigInteger f(BigInteger n) {
        if (one.compareTo(n) == 0) {
            return one;
        } else {
            return n.multiply(f(n.subtract(one)));
        }
    }


}
