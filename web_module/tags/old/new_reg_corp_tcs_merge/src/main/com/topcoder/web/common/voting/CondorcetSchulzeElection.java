package com.topcoder.web.common.voting;

import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Collections;
import java.io.Serializable;

/**
 * Help for determining beat paths and schwartz sets from here:
 *
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Aug 31, 2005
 */
public class CondorcetSchulzeElection implements Serializable {

    private static final Logger log = Logger.getLogger(CondorcetSchulzeElection.class);
    private Candidate[] candidates = null;
    private List balots = null;
    private Matrix sumMatrix = null;

    public CondorcetSchulzeElection() {
        balots = new ArrayList(1000);
    }

    public Candidate[] getCandidates() {
        return candidates;
    }

    public void addBalot(RankBallot ballot) {
        if (candidates == null) {
            candidates = ballot.getCandidates();
        }
        balots.add(ballot);
    }

    public Matrix getSumMatrix() {
        if (sumMatrix == null) {
            Matrix sum = new Matrix((RankBallot) balots.get(0));
            for (int i = 1; i < balots.size(); i++) {
                sum = Matrix.add(sum, new Matrix((RankBallot) balots.get(i)));
            }
            sumMatrix = sum;
        }
        return sumMatrix;
    }

    /**
     * Return the Schwartz set for this election.  An undominated set is a set of
     * candidates not beaten by any candidates outside the set.  A minimal undominated set
     * does not contain other undominated sets.  The Schwartz set is the union of all minimal
     * undominated sets.
     *
     * @return the sorted list of candidates in the Schwartz set.
     */
    public Candidate[] getSchwartzSet() {
        Matrix m = getSumMatrix();
        int candidateCount = candidates.length;
        boolean[] schwartzSet = new boolean[candidateCount];
        boolean[][] beats = new boolean[candidateCount][candidateCount];

        Arrays.fill(schwartzSet, true);

        for (int i = 0; i < candidateCount; i++) {
            for (int j = 0; j < candidateCount; j++) {
                if (i != j) {
                    beats[i][j] = m.beat(i, j);
                }
            }
        }

        for (int i = 0; i < candidateCount; i++) {
            for (int j = 0; j < candidateCount; j++) {
                if (i != j) {
                    for (int k = 0; k < candidateCount; k++) {
                        if (i != k && j != k) {
                            if (beats[j][i] && beats[i][k]) {
                                beats[j][k] = true;
                            }
                        }
                    }
                }
            }
        }

        for (int i = 0; i < candidateCount; i++) {
            for (int j = 0; j < candidateCount; j++) {
                if (i != j) {
                    if (!beats[i][j] && beats[j][i]) {
                        schwartzSet[i] = false;
                    }
                }
            }
        }

        ArrayList ret = new ArrayList(candidateCount);
        for (int i=0; i<candidateCount; i++) {
            if (schwartzSet[i]) {
                ret.add(candidates[i]);
            }
        }
        Collections.sort(ret);
        return (Candidate[])ret.toArray(new Candidate[ret.size()]);

    }

    /**
     * Return the Smith Set for this election.  The smith set is the
     * smallest set of candidates in a particular election such that
     * each member beats every other candidate outside the set in a pairwise election
     * @return the smith set
     */
    public Candidate[] getSmithSet() {
        throw new UnsupportedOperationException();
    }


    /**
     *
     * @return an array of <code>Pair</code> objects where CandidateA
     *
     */
    public Matrix getBeatPathStrengthMatrix() {
        Matrix m = getSumMatrix();
        int candidateCount = candidates.length;
        int[][] strength = new int[candidates.length][candidates.length];
        int[][] margin = new int[candidates.length][candidates.length];

        for(int i=0; i<candidateCount; i++) {
            for(int j=0; j<candidateCount; j++) {
                if (i!=j) {
                    if (m.beat(i,j)||m.tie(i,j)) {
                        strength[i][j] = m.getValue(i,j);
                    } else {
                        strength[i][j] = -1;
                    }
                    margin[i][j] = m.getValue(i,j)-m.getValue(j,i);
                }
            }
        }

        for (int i=0; i<candidateCount; i++) {
            for (int j=0; j<candidateCount; j++) {
                if (i!=j) {
                    for (int k=0; k<candidateCount; k++) {
                        if (i!=k && j!=k) {
                            int s = Math.min(strength[j][i], strength[i][k]);
                            int t = Math.min(margin[j][i], margin[i][k]);
                            if (strength[j][k] < s || (strength[j][k]==s && margin[j][k]<t)) {
                                strength[j][k]=s;
                                margin[j][k]=t;
                            }
                        }
                    }
                }
            }
        }

        Matrix ret = new Matrix(candidates, strength);
        log.debug("strength matrix: \n" + ret.toString());
        return ret;
    }





}

