package com.topcoder.web.common.voting;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class RankedResult implements Serializable {
    private Candidate candidate;
    private int rank;

    public RankedResult(Candidate candidate, int rank) {
        this.candidate = candidate;
        this.rank = rank;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public int getRank() {
        return rank;
    }

    public String toString() {
        return candidate.getName()+":"+rank;
    }
}

