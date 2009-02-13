package com.topcoder.web.ep.util;


/**
 * Simple representation of the report's row
 * 
 * @author Pablo
 */
public class AssignmentOverviewRow {
    private Long id;
    private String name;
    private Integer assigned;
    private Integer opened;
    private Integer finished;
    
    public AssignmentOverviewRow() {
        super();
    }

    public AssignmentOverviewRow(Long id, String name, Integer assigned,
            Integer opened, Integer finished) {
        super();
        this.id = id;
        this.name = name;
        this.assigned = assigned;
        this.opened = opened;
        this.finished = finished;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getassigned() {
        return assigned;
    }

    public void setassigned(Integer assigned) {
        this.assigned = assigned;
    }

    public Integer getOpened() {
        return opened;
    }

    public void setOpened(Integer opened) {
        this.opened = opened;
    }

    public Integer getFinished() {
        return finished;
    }

    public void setFinished(Integer finished) {
        this.finished = finished;
    }
    
    
    
}
