package com.topcoder.web.openaim.model;

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
    private Float finalScore;
    private Integer placed;

    //can't have a result without a submission, so don't provide a constructor.  
    protected ContestResult() {

    }

    /**
     * Create a new contest result for the given submission.  This
     * constructor takes care of all the associations between the result
     * and the submission/contest
     *
     * @param s - the submission
     */
    public ContestResult(Submission s) {
        setSubmission(s);
        setContest(s.getContest());
        s.setResult(this);
    }

    //i don't think we need to expose this.  i think it's just necessary to make hibernate happy
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
        if (this == o) return true;
        if (!(o instanceof ContestResult)) return false;
        final ContestResult that = (ContestResult) o;
        return this.getSubmission().equals(that.getSubmission());
    }

    public int hashCode() {
        return getSubmission().hashCode();
    }

    public int compareTo(Object o) {
        ContestResult other = (ContestResult) o;
        if (getFinalScore() != null && other.getFinalScore() == null) {
            return -1;
        } else if (getFinalScore() == null && other.getFinalScore() == null) {
            return getSubmission().getId().compareTo(other.getSubmission().getId());
        } else {
            return getFinalScore().compareTo(other.getFinalScore());
        }
    }


}
