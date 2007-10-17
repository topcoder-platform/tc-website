/**
 * 
 */
package com.topcoder.web.ep.controller.request.reports;

/**
 * @author Pablo
 *
 */
public class StudentReportDetailRow {
    private Long componentId;
    private String component;
    private Double score;
    private Integer numTestsPassed;
    private Double percentTestsPassed;

    public StudentReportDetailRow(Long componentId, String component,
            Double score, Integer numTestsPassed, Double percentTestsPassed) {
        super();
        this.componentId = componentId;
        this.component = component;
        this.score = score;
        this.numTestsPassed = numTestsPassed;
        this.percentTestsPassed = percentTestsPassed;
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
