package com.topcoder.web.common.voting;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 1, 2005
 */
public class Pair implements Comparable, Serializable {
    private Candidate a;
    private Candidate b;
    private boolean tie = false;

    /**
     * create a new <code>Pair</code> by convention
     * <code>a</code> beat <code>b</code> except in the
     * case of a tie.
     * @param a
     * @param b
     * @param tie
     */
    public Pair(Candidate a, Candidate b, boolean tie) {
        this.a = a;
        this.b = b;
        this.tie = tie;
    }

    /**
     *
     * @return the pairwise winner if there is no tie, otherwise it's just
     * one of these tied candidates
     */
    public Candidate getCandidateA() {
        return a;
    }

    /**
     *
     * @return the pairwise loser if there is no tie, otherwise it's just
     * one of these tied candidates
     */
    public Candidate getCandidateB() {
        return b;
    }

    public boolean isTie() {
        return tie;
    }

    public boolean equals(Object o) {
        try {
            Pair other = (Pair) o;
            return a.equals(other.a) && b.equals(other.b);
        } catch (ClassCastException e) {
            return false;
        }
    }

    public int compareTo(Object o) {
        Pair other = (Pair) o;
        if (this.equals(other)) {
            return 0;
        } else {
            if (a.equals(other.a)) {
                return b.compareTo(other.b);
            } else {
                return a.compareTo(other.a);
            }
        }
    }

    public String toString() {
        return a.toString() + ":" + b.toString() + ":" + tie;
    }


}
