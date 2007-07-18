package com.topcoder.web.studio.model;

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
    private Float finalScore;
    private Integer placed;

    protected ContestResult() {
        
    }

    public ContestResult(Submission s) {
        setSubmission(s);
        setContest(s.getContest());
    }

    protected Long getId() {
        return id;
    }

    protected void setId(Long id) {
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


    public Float getFinalScore() {
        return finalScore;
    }

    public void setFinalScore(Float finalScore) {
        this.finalScore = finalScore;
    }


    public Integer getPlaced() {
        return placed;
    }

    public void setPlaced(Integer placed) {
        this.placed = placed;
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
        ContestResult other = (ContestResult) o;
        if (getPrize() == null && other.getPrize() != null) return 1;
        else if (getPrize() != null && other.getPrize() == null) return -1;
        else return getPrize().compareTo(other.getPrize());
    }


}
