package com.topcoder.web.common.voting;

import java.io.Serializable;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class CondorcetSchulzeResults implements Serializable {

    /*
    4.  getPairwiseResults()
    */

    private Matrix strengthMatrix;
    private Candidate[] candidates;
    private RankedResult[] results;
    private Matrix sumMatrix;

    public CondorcetSchulzeResults(CondorcetSchulzeElection election) {
        this.strengthMatrix = election.getBeatPathStrengthMatrix();
        this.candidates = election.getCandidates();
        this.results = buildResults();
        this.sumMatrix = election.getSumMatrix();
    }

    public boolean hasSingleWinner() {
        if (results.length>1) {
            return results[1].getRank()>results[0].getRank();
        } else if (results.length==1) {
            return true;
        } else {
            return false;
        }
    }

    public List getResults() {
        return Arrays.asList(results);
    }

    public Matrix getSumMatrix() {
        return sumMatrix;
    }

    public Candidate getWinner() {
        if (!hasSingleWinner()) {
            throw new RuntimeException("Please be sure there is only one winner before calling this method.");
        } else {
            return results[0].getCandidate();
        }
    }

    public List getWinners() {

        List ret = new ArrayList();
        if (results.length>0) {
            ret.add(results[0]);
        }
        if (results.length>1) {
            for (int i=1; i<results.length; i++) {
                if (results[i].getRank()==results[0].getRank()) {
                    ret.add(results[i]);
                }
            }
        }
        return ret;
    }

    /**
     *
     * @return a <code>RankedResult</code> array containing the results
     */
    private RankedResult[] buildResults() {
        Pair[] ret = new Pair[(int)(f(candidates.length)/(f(2)*f(candidates.length-2)))];
        //log.debug("result size is " + ret.length);
        //log.debug("strength matrix \n" + m.toString());
        int count = 0;
        //build out all the win lose tie information using the strength matrix
        for (int i=0; i<candidates.length; i++) {
            for (int j=i; j<candidates.length; j++) {
                if (i!=j) {
                    if (strengthMatrix.beat(i,j)) {
                        //log.debug(i + "adding a win for " + candidates[i].toString() + " over " + candidates[j].toString());
                        ret[count] = new Pair(candidates[i], candidates[j], false);
                    } else if (strengthMatrix.tie(i,j)) {
                        //log.debug(i + "adding a tie betwne " + candidates[i].toString() + " and " + candidates[j].toString());
                        ret[count] = new Pair(candidates[i], candidates[j], true);
                    } else {
                        //log.debug(i + "adding a win for " + candidates[j].toString() + " over " + candidates[i].toString());
                        ret[count] = new Pair(candidates[j], candidates[i], false);
                    }
                    count++;
                }
            }
        }

        //build a map between candidates and the number of loses they have
        MapEntry[] map = new MapEntry[candidates.length];
        for (int i=0; i<map.length; i++) {
            map[i] = new MapEntry(candidates[i]);
        }
        for (int i=0; i<ret.length; i++) {
            if (!ret[i].isTie()) {
                map[strengthMatrix.getIndex(ret[i].getCandidateB())].incrementLoseCount();
            }
        }

        Arrays.sort(map);
        RankedResult[] results = new RankedResult[map.length];
        int lastLoses = -1;
        int rank = 0;
        for (int i=0; i<map.length; i++) {
            if (map[i].getLoseCount()!=lastLoses) {
                rank++;
            }
            results[i] = new RankedResult(map[i].getCandidate(), rank);
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
            return new Integer(loseCount).compareTo(new Integer(((MapEntry)o).loseCount));
        }

    }

    private long f(int n) {
        if (n==1) {
            return 1;
        } else {
            return n*f(n-1);
        }
    }



}
