package com.topcoder.web.ep.util;

import java.util.List;

/**
 * Simple representation of the report's row
 * 
 * @author Pablo
 */
public class StudentReportRow {
    private Long assignmentId;
    private String assignment;
    private Double assignmentScore;
    private Integer assignmentNumTestsPassed;
    private Double assignmentPercentTestsPassed;
    private Long showAllCoders;
    private Long scoreType;
    

    private List<StudentReportDetailRow> details;
    
    public StudentReportRow(Long assignmentId, String assignment,
            Double assignmentScore, Integer assignmentNumTestsPassed,
            Double assignmentPercentTestsPassed,
            Long showAllCoders,
            Long scoreType,
            List<StudentReportDetailRow> details) {
        super();
        this.assignmentId = assignmentId;
        this.assignment = assignment;
        this.assignmentScore = assignmentScore;
        this.assignmentNumTestsPassed = assignmentNumTestsPassed;
        this.assignmentPercentTestsPassed = assignmentPercentTestsPassed;
        this.showAllCoders = showAllCoders;
        this.scoreType = scoreType;
        this.details = details;
    }

    public Long getShowAllCoders() {
        return showAllCoders;
    }

    public void setShowAllCoders(Long showAllCoders) {
        this.showAllCoders = showAllCoders;
    }

    public Long getScoreType() {
        return scoreType;
    }

    public void setScoreType(Long scoreType) {
        this.scoreType = scoreType;
    }

    public Long getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(Long assignmentId) {
        this.assignmentId = assignmentId;
    }

    public String getAssignment() {
        return assignment;
    }

    public void setAssignment(String assignment) {
        this.assignment = assignment;
    }

    public Double getAssignmentScore() {
        return assignmentScore;
    }

    public void setAssignmentScore(Double assignmentScore) {
        this.assignmentScore = assignmentScore;
    }

    public Integer getAssignmentNumTestsPassed() {
        return assignmentNumTestsPassed;
    }

    public void setAssignmentNumTestsPassed(Integer assignmentNumTestsPassed) {
        this.assignmentNumTestsPassed = assignmentNumTestsPassed;
    }

    public Double getAssignmentPercentTestsPassed() {
        return assignmentPercentTestsPassed;
    }

    public void setAssignmentPercentTestsPassed(Double assignmentPercentTestsPassed) {
        this.assignmentPercentTestsPassed = assignmentPercentTestsPassed;
    }

    public List<StudentReportDetailRow> getDetails() {
        return details;
    }

    public void setDetails(List<StudentReportDetailRow> details) {
        this.details = details;
    }}
