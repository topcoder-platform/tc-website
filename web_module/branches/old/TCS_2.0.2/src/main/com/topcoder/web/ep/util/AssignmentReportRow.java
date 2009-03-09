package com.topcoder.web.ep.util;

/**
 * Simple representation of the report's row
 * 
 * @author Pablo
 */
public class AssignmentReportRow {

    private Long studentId;
    private String student;
    private Double score;
    private Integer numTestsPassed;
    private Double percentTestsPassed;

    public AssignmentReportRow(Long studentId, String student, Double score,
            Integer numTestsPassed, Double percentTestsPassed) {
        super();
        this.studentId = studentId;
        this.student = student;
        this.score = score;
        this.numTestsPassed = numTestsPassed;
        this.percentTestsPassed = percentTestsPassed;
    }
    
    /**
     * @return the student Id
     */
    public Long getStudentId() {
        return studentId;
    }
    /**
     * @param student the student Id to set
     */
    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }
    /**
     * @return the student
     */
    public String getStudent() {
        return student;
    }
    /**
     * @param student the student to set
     */
    public void setStudent(String student) {
        this.student = student;
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
        result = prime * result + ((student == null) ? 0 : student.hashCode());
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
        final AssignmentReportRow other = (AssignmentReportRow) obj;
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
        if (student == null) {
            if (other.student != null)
                return false;
        } else if (!student.equals(other.student))
            return false;
        return true;
    }
}
