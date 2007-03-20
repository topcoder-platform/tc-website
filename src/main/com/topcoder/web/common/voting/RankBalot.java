package com.topcoder.web.common.voting;

import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Sep 2, 2005
 */
public class RankBalot {
    private List candidates = null;
    private Voter voter = null;
    private List votes = null;

    /**
     * create a rank balot with the given <code>candidates</code>.
     */
    public RankBalot(List candidates) {
        this(Voter.ANONYMOUS_VOTER, candidates);
    }

    /**
     * Create a rank balot for the given <code>voter</code> for the
     * given <code>candidates</code>.
     * @param voter
     */
    public RankBalot(Voter voter, List candidates) {
        this.candidates = candidates;
        Collections.sort(this.candidates);
        this.voter = voter;
        this.votes = new ArrayList(candidates.size());
    }

    /**
     * Adds a vote for a candidate.
     * @param vote
     */
    public void add(Vote vote) {
        votes.add(vote);
    }

    /**
     * provide a read only versin of the list of the candidates for this balot
     * @return
     */
    public List getCandidates() {
        return Collections.unmodifiableList(candidates);
    }

    /**
     * provide a read only version of the list of votes in this balot
     * @return
     */
    public List getVotes() {
        return Collections.unmodifiableList(votes);
    }

    /**
     * privides a view of the content of the balot
     * @return
     */
    public String toString() {
        StringBuffer buf = new StringBuffer(votes.size()*20);
        buf.append(voter.toString()).append(":");
        for (Iterator it = votes.iterator(); it.hasNext();) {
            buf.append(it.next().toString());
        }
        return buf.toString();
    }

}
