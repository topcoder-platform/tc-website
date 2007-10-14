/**
 * 
 */
package com.topcoder.web.ep.controller.request.professor.reports;

/**
 * @author Pablo
 *
 */
public class StudentReportRow {

    private Long assignmentId;
    private String assignment;
    private Double score;
    private Integer numTestsPassed;
    private Double percentTestsPassed;

    /**
     * @param student
     * @param score
     * @param numTestsPassed
     * @param percentTestsPassed
     */
    public StudentReportRow(Long assignmentId, String assignment, Double score,
            Integer numTestsPassed, Double percentTestsPassed) {
        super();
        this.assignmentId = assignmentId;
        this.assignment = assignment;
        this.score = score;
        this.numTestsPassed = numTestsPassed;
        this.percentTestsPassed = percentTestsPassed;
    }
    
    /**
     * @return the assignment Id
     */
    public Long getAssignmentId() {
        return assignmentId;
    }
    /**
     * @param assignment the assignment Id to set
     */
    public void setAssignmentId(Long assignmentId) {
        this.assignmentId = assignmentId;
    }
    /**
     * @return the assignment
     */
    public String getAssignment() {
        return assignment;
    }
    /**
     * @param assignment the assignment to set
     */
    public void setAssignment(String assignment) {
        this.assignment = assignment;
    }
    /**
     * @return the score
     */
    public Double getScore() {
        return score;
    }
    /**
     * @param score the score to set
     */
    public void setScore(Double score) {
        this.score = score;
    }
    /**
     * @return the numTestsPassed
     */
    public Integer getNumTestsPassed() {
        return numTestsPassed;
    }
    /**
     * @param numTestsPassed the numTestsPassed to set
     */
    public void setNumTestsPassed(Integer numTestsPassed) {
        this.numTestsPassed = numTestsPassed;
    }
    /**
     * @return the percentTestsPassed
     */
    public Double getPercentTestsPassed() {
        return percentTestsPassed;
    }
    /**
     * @param percentTestsPassed the percentTestsPassed to set
     */
    public void setPercentTestsPassed(Double percentTestsPassed) {
        this.percentTestsPassed = percentTestsPassed;
    }
    
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((numTestsPassed == null) ? 0 : numTestsPassed.hashCode());
        result = prime
                * result
                + ((percentTestsPassed == null) ? 0 : percentTestsPassed
                        .hashCode());
        result = prime * result + ((score == null) ? 0 : score.hashCode());
        result = prime * result + ((assignment == null) ? 0 : assignment.hashCode());
        return result;
    }
    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final StudentReportRow other = (StudentReportRow) obj;
        if (numTestsPassed == null) {
            if (other.numTestsPassed != null)
                return false;
        } else if (!numTestsPassed.equals(other.numTestsPassed))
            return false;
        if (percentTestsPassed == null) {
            if (other.percentTestsPassed != null)
                return false;
        } else if (!percentTestsPassed.equals(other.percentTestsPassed))
            return false;
        if (score == null) {
            if (other.score != null)
                return false;
        } else if (!score.equals(other.score))
            return false;
        if (assignment == null) {
            if (other.assignment != null)
                return false;
        } else if (!assignment.equals(other.assignment))
            return false;
        return true;
    }
}
