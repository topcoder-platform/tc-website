package com.topcoder.web.common.voting;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Sep 2, 2005
 */
public class Vote implements Comparable, Serializable {
    private Candidate candidate = null;
    private int rank = 0;

    /**
     * create a vote for a particular candidate
     *
     * @param candidate
     * @param rank
     */
    public Vote(Candidate candidate, int rank) {
        if (candidate == null) {
            throw new NullPointerException("candidate was null");
        }
        this.candidate = candidate;
        this.rank = rank;
    }

    /**
     * the rank for this vote
     *
     * @return int
     */
    public int getRank() {
        return rank;
    }

    /**
     * return a the candidate associated with this vote.
     * <code>Candidate</code> is immutable, therefore a copy
     * is not necessary.
     *
     * @return Candidate
     */
    public Candidate getCandidate() {
        return this.candidate;
    }

    /**
     * Will a value > 0 if this vote is preferred to the other vote,
     * 0 if they are preferred the same, and a values < 0 otherwise.
     *
     * @param o
     * @return int
     */
    public int compareTo(Object o) {
        Vote v = (Vote) o;
        if (getRank() < v.getRank()) {
            return 1;
        } else if (getRank() > v.getRank()) {
            return -1;
        } else {
            return 0;
        }
    }

    /**
     * provide a nice view of the data encapsulated here
     *
     * @return String
     */
    public String toString() {
        return "[" + candidate.getName() + ":" + rank + "]";
    }

}
