package com.topcoder.web.ep.util;

/**
 * Simple representation of the report's row
 * 
 * @author Pablo
 */
public class StudentHomeDetailRow {
    private Long classroomId;
    private String classroomName;
    private Boolean active;
    
    public StudentHomeDetailRow(Long classroomId, String classroomName,
            Boolean active) {
        super();
        this.classroomId = classroomId;
        this.classroomName = classroomName;
        this.active = active;
    }
    
    public Long getClassroomId() {
        return classroomId;
    }
    public void setClassroomId(Long classroomId) {
        this.classroomId = classroomId;
    }
    public String getClassroomName() {
        return classroomName;
    }
    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }
    public Boolean getActive() {
        return active;
    }
    public void setActive(Boolean active) {
        this.active = active;
    }

    
}
