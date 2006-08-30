package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.AlgoRating;
import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class ContestResult extends Base implements Comparable {
    private Identifier id = new Identifier();
    private Contest contest;
    private Submission submission;
    private Prize prize;

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
    }

    public Submission getSubmission() {
        return submission;
    }

    public void setSubmission(Submission submission) {
        this.submission = submission;
    }

    public Prize getPrize() {
        return prize;
    }

    public void setPrize(Prize prize) {
        this.prize = prize;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                ContestResult oa = (ContestResult) o;
                boolean sameContest = (oa.getContest().getId() == null && getContest().getId() == null) ||
                        (oa.getContest().getId() != null && getContest().getId() != null && oa.getContest().getId().equals(getContest().getId()));
                boolean sameSubmission = (oa.getSubmission().getId() == null && getSubmission().getId() == null) ||
                        (oa.getSubmission().getId() != null && getSubmission().getId() != null && oa.getSubmission().getId().equals(getSubmission().getId()));
                return sameContest && sameSubmission;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getContest() == null) {
            buf.append("");
        } else if (getContest().getId() == null) {
            buf.append(getContest().hashCode());
        } else {
            buf.append(getContest().getId());
        }
        buf.append(" ");
        if (getSubmission() == null) {
            buf.append("");
        } else if (getSubmission().getId() == null) {
            buf.append(getSubmission().hashCode());
        } else {
            buf.append(getSubmission().getId());
        }
        return buf.toString().hashCode();
    }

    public int compareTo(Object o) {
        return getPrize().compareTo(((ContestResult) o).getPrize());
    }


    public static class Identifier implements Serializable {

        private Contest contest;
        private Submission submission;


        public Identifier() {

        }

        public Identifier(Contest contest, Submission submission) {
            this.contest = contest;
            this.submission = submission;
        }

        public Contest getContest() {
            return contest;
        }

        public void setContest(Contest contest) {
            this.contest = contest;
        }

        public Submission getSubmission() {
            return submission;
        }

        public void setSubmission(Submission submission) {
            this.submission = submission;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    AlgoRating.Identifier oa = (AlgoRating.Identifier) o;
                    return (oa.getCoder().equals(getContest()) &&
                            oa.getType().equals(getSubmission()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(getContest().getId());
            buf.append(" ");
            buf.append(getSubmission().getId());
            return buf.toString().hashCode();
        }
    }


}
