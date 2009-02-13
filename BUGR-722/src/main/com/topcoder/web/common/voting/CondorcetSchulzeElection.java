package com.topcoder.web.common.voting;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.Base;

import java.sql.Timestamp;
import java.util.*;

/**
 * Help for determining beat paths and schwartz sets from here:
 *
 * @author dok
 * @version $Revision: 59483 $ $Date$
 *          Create Date: Aug 31, 2005
 */
public class CondorcetSchulzeElection extends Base {

    private static final Logger log = Logger.getLogger(CondorcetSchulzeElection.class);

    private Set ballots;
    private Matrix sumMatrix = null;
    private Timestamp startTime;
    private Timestamp endTime;
    private String name;
    private Set candidates;
    private Long id;
    private ElectionStatus status;

    /**
     * default constructor
     */
    public CondorcetSchulzeElection() {
        ballots = new HashSet();
        candidates = new HashSet();
    }


    public ElectionStatus getStatus() {
        return status;
    }

    public void setStatus(ElectionStatus status) {
        this.status = status;
    }

    public Set getBallots() {
        return ballots;
    }

    public void setBallots(Set ballots) {
        this.ballots = ballots;
    }

    public void addBallot(RankBallot b) {
        b.setElection(this);
        this.ballots.add(b);

    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set getCandidates() {
        return candidates;
    }

    public void setCandidates(Set candidates) {
        this.candidates = candidates;
    }

    public Matrix getSumMatrix() {
        if (sumMatrix == null) {
            Iterator it = ballots.iterator();
            Matrix sum = new Matrix((RankBallot) it.next());
            for (; it.hasNext();) {
                sum = Matrix.add(sum, new Matrix((RankBallot) it.next()));
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
        int candidateCount = candidates.size();
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
        for (int i = 0; i < candidateCount; i++) {
            if (schwartzSet[i]) {
                ret.add(m.getCandidate(i));
            }
        }
        Collections.sort(ret, new Candidate.IDComparator());
        return (Candidate[]) ret.toArray(new Candidate[ret.size()]);

    }

    /**
     * Return the Smith Set for this election.  The smith set is the
     * smallest set of candidates in a particular election such that
     * each member beats every other candidate outside the set in a pairwise election
     *
     * @return the smith set
     */
    public Candidate[] getSmithSet() {
        throw new UnsupportedOperationException();
    }


    /**
     * @return an array of <code>Pair</code> objects where CandidateA
     */
    public Matrix getBeatPathStrengthMatrix() {
        Matrix m = getSumMatrix();
        int candidateCount = candidates.size();
        int[][] strength = new int[candidates.size()][candidates.size()];
        int[][] margin = new int[candidates.size()][candidates.size()];

        for (int i = 0; i < candidateCount; i++) {
            for (int j = 0; j < candidateCount; j++) {
                if (i != j) {
                    if (m.beat(i, j) || m.tie(i, j)) {
                        strength[i][j] = m.getValue(i, j);
                    } else {
                        strength[i][j] = -1;
                    }
                    margin[i][j] = m.getValue(i, j) - m.getValue(j, i);
                }
            }
        }

        for (int i = 0; i < candidateCount; i++) {
            for (int j = 0; j < candidateCount; j++) {
                if (i != j) {
                    for (int k = 0; k < candidateCount; k++) {
                        if (i != k && j != k) {
                            int s = Math.min(strength[j][i], strength[i][k]);
                            int t = Math.min(margin[j][i], margin[i][k]);
                            if (strength[j][k] < s || (strength[j][k] == s && margin[j][k] < t)) {
                                strength[j][k] = s;
                                margin[j][k] = t;
                            }
                        }
                    }
                }
            }
        }

        if (log.isDebugEnabled()) {
            log.debug("margin\n"+new Matrix(m.getCandidates(), margin).toString());
        }
        Matrix ret = new Matrix(m.getCandidates(), strength);
        //log.debug("strength matrix: \n" + ret.toString());
        return ret;
    }


}

