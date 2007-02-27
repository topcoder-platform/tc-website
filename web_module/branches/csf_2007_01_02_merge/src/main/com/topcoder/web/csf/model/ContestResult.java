package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class ContestResult extends Base implements Comparable {
    private Long id;
    private Contest contest;
    private Submission submission;
    private Prize prize;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
                boolean sameSubmission = (oa.getSubmission().getId() == null && getSubmission().getId() == null) ||
                        (oa.getSubmission().getId() != null && getSubmission().getId() != null && oa.getSubmission().getId().equals(getSubmission().getId()));
                boolean samePrize = (oa.getPrize().getId() == null && getPrize().getId() == null) ||
                        (oa.getPrize().getId() != null && getPrize().getId() != null && oa.getPrize().getId().equals(getPrize().getId()));
                return sameSubmission && samePrize;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getPrize() == null) {
            buf.append("");
        } else if (getPrize().getId() == null) {
            buf.append(getPrize().hashCode());
        } else {
            buf.append(getPrize().getId());
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


}
