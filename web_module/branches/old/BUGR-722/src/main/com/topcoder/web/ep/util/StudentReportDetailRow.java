package com.topcoder.web.ep.util;

/**
 * Simple representation of the report's row
 * 
 * @author Pablo
 */
public class StudentReportDetailRow {
    private Long componentId;
    private String component;
    private Double score;
    private Double possiblePoints;
    private Integer numTestsPassed;
    private Double percentTestsPassed;

    public StudentReportDetailRow(Long componentId, String component,
            Double score, Double possiblePoints, Integer numTestsPassed, Double percentTestsPassed) {
        super();
        this.componentId = componentId;
        this.component = component;
        this.score = score;
        this.possiblePoints = possiblePoints;
        this.numTestsPassed = numTestsPassed;
        this.percentTestsPassed = percentTestsPassed;
    }
    
    public Double getPossiblePoints() {
        return possiblePoints;
    }

    public void setPossiblePoints(Double possiblePoints) {
        this.possiblePoints = possiblePoints;
    }

    public Long getComponentId() {
        return componentId;
    }
    public void setComponentId(Long componentId) {
        this.componentId = componentId;
    }
    public String getComponent() {
        return component;
    }
    public void setComponent(String component) {
        this.component = component;
    }
    public Double getScore() {
        return score;
    }
    public void setScore(Double score) {
        this.score = score;
    }
    public Integer getNumTestsPassed() {
        return numTestsPassed;
    }
    public void setNumTestsPassed(Integer numTestsPassed) {
        this.numTestsPassed = numTestsPassed;
    }
    public Double getPercentTestsPassed() {
        return percentTestsPassed;
    }
    public void setPercentTestsPassed(Double percentTestsPassed) {
        this.percentTestsPassed = percentTestsPassed;
    }

    
}
