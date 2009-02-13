/**
 * 
 */
package com.topcoder.web.ep.controller.request.student;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Pablo
 *
 */
public class StudentHomeRow {
    private Long schoolId;
    private String schoolName;

    private List<StudentHomeDetailRow> details = new ArrayList<StudentHomeDetailRow>();

    
    public StudentHomeRow(Long schoolId, String schoolName) {
        super();
        this.schoolId = schoolId;
        this.schoolName = schoolName;
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public List<StudentHomeDetailRow> getDetails() {
        return details;
    }

    public void setDetails(List<StudentHomeDetailRow> details) {
        this.details = details;
    }
    

    
}
