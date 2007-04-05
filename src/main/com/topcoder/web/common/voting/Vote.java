package com.topcoder.web.common.voting;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;
import java.util.Comparator;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Sep 2, 2005
 */
public class Vote extends Base {
    private Integer rank;
    private Identifier id = new Identifier();

    public Vote() {
        super();
    }

    /**
     * the rank for this vote
     *
     * @return Integer
     */
    public Integer getRank() {
        return rank;
    }


    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public void setRank(Integer rank) {
        this.rank = rank;
    }


    public RankBallot getBallot() {
        return id.getBallot();
    }

    public void setBallot(RankBallot ballot) {
        id.setBallot(ballot);
    }

    public Candidate getCandidate() {
        return id.getCandidate();
    }

    public void setCandidate(Candidate candidate) {
        id.setCandidate(candidate);
    }


    public int hashCode() {
        if (id.getBallot() == null || id.getCandidate() == null || id.getBallot().getId() == null || id.getCandidate().getId() == null) {
            return rank.hashCode();
        } else {
            return id.hashCode();
        }
    }

    public boolean equals(Object o) {
        if (id.getBallot() == null || id.getCandidate() == null || id.getBallot().getId() == null || id.getCandidate().getId() == null) {
            return super.equals(o);
        } else {
            return id.equals(((Vote) o).id);
        }
    }

    /**
     * provide a nice view of the data encapsulated here
     *
     * @return String
     */
    public String toString() {
        if (id.getCandidate() != null) {
            return "[" + id.getCandidate().getId() + " " + id.getCandidate().getName() + " : " + rank + "]";
        } else {
            return "[unknown candidate: " + rank + "]";
        }
    }

    public static class Identifier implements Serializable, Cloneable {

        private RankBallot ballot;
        private Candidate candidate;

        public Identifier() {

        }

        public Identifier(RankBallot ballot, Candidate candidate) {
            this.ballot = ballot;
            this.candidate = candidate;
        }


        public RankBallot getBallot() {
            return ballot;
        }

        public void setBallot(RankBallot ballot) {
            this.ballot = ballot;
        }

        public Candidate getCandidate() {
            return candidate;
        }

        public void setCandidate(Candidate candidate) {
            this.candidate = candidate;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    Vote.Identifier oa = (Vote.Identifier) o;
                    return (oa.ballot.getId().equals(ballot.getId()) &&
                            oa.candidate.getId().equals(candidate.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(ballot.getId());
            buf.append(" ");
            buf.append(candidate.getId());
            return buf.toString().hashCode();
        }


    }


    /**
     * class to sort candidates alphabetically by name, and if two are named the same,
     * then by id.  undefined if both name and id are the same.
     */
    public static class RankComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            Vote v1 = (Vote) o1;
            Vote v2 = (Vote) o2;
            return v1.getRank().compareTo(v2.getRank());
        }
    }


}
