package com.topcoder.web.common.voting;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Sep 2, 2005
 */
public class RankBallot implements Serializable {
    private Candidate[] candidates = null;
    private Voter voter = null;
    private List votes = null;

    /**
     * create a rank balot with the given <code>candidates</code>.
     */
    public RankBallot(Candidate[] candidates) {
        this(Voter.ANONYMOUS_VOTER, candidates);
    }

    public RankBallot(List candidates) {
        this(Voter.ANONYMOUS_VOTER, (Candidate[]) candidates.toArray(new Candidate[candidates.size()]));
    }

    /**
     * Create a rank balot for the given <code>voter</code> for the
     * given <code>candidates</code>.
     *
     * @param voter
     */
    public RankBallot(Voter voter, Candidate[] candidates) {
        this.candidates = candidates;
        Arrays.sort(this.candidates);
        this.voter = voter;
        this.votes = new ArrayList(candidates.length);
    }

    /**
     * Adds a vote for a candidate.
     *
     * @param vote
     * @throws IllegalArgumentException if this balot already includes a vote for
     *                                  the candidate specified in <code>vote</code>.
     */
    public void add(Vote vote) {
        if (vote == null) {
            throw new NullPointerException("vote was null");
        }
        Vote temp;
        for (Iterator it = votes.iterator(); it.hasNext();) {
            temp = (Vote) it.next();
            if (temp.getCandidate().equals(vote.getCandidate())) {
                throw new IllegalArgumentException("Vote already cast for " + vote.getCandidate().getName() + " on this balot");
            }
        }
        votes.add(vote);
    }

    /**
     * provide a read only versin of the list of the candidates for this balot
     *
     * @return List
     */
    public Candidate[] getCandidates() {
        return candidates;
    }

    /**
     * @return List
     */
    public Vote[] getVotes() {
        return (Vote[]) votes.toArray(new Vote[votes.size()]);
    }

    /**
     * privides a view of the content of the balot
     *
     * @return List
     */
    public String toString() {
        StringBuffer buf = new StringBuffer(votes.size() * 20);
        buf.append(voter.toString()).append(":");
        for (Iterator it = votes.iterator(); it.hasNext();) {
            buf.append(it.next().toString());
        }
        return buf.toString();
    }

}
