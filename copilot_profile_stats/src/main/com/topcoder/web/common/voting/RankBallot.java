package com.topcoder.web.common.voting;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Sep 2, 2005
 */
public class RankBallot extends Base {

    private User user;
    private Long id;
    private CondorcetSchulzeElection election;
    private Set votes;

    public RankBallot() {
        this.votes = new HashSet();
    }

    public RankBallot(CondorcetSchulzeElection election, User user) {
        this();
        this.election = election;
        this.user = user;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CondorcetSchulzeElection getElection() {
        return election;
    }

    public void setElection(CondorcetSchulzeElection election) {
        this.election = election;
    }


    public Set getVotes() {
        return votes;
    }

    public void setVotes(Set votes) {
        this.votes = votes;
    }

    public void addVote(Vote v) {
        v.setBallot(this);
        this.votes.add(v);
    }

    /**
     * privides a view of the content of the balot
     *
     * @return List
     */
    public String toString() {
        StringBuffer buf = new StringBuffer(votes.size() * 20);
        if (user != null) {
            buf.append(user.getId()).append(":").append(user.getHandle());
        } else {
            buf.append("unknown user");
        }
        for (Iterator it = votes.iterator(); it.hasNext();) {
            buf.append(it.next().toString());
        }
        return buf.toString();
    }

}
