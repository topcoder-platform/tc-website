/*
* Classroom
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Classroom {

    private Long id;
    private Professor professor;
    private String name;
    private Integer statusId;
    private String academicPeriod;
    private String description;

    private Set studentClassrooms;

    public Classroom() {
        this.studentClassrooms = new HashSet();
    }

    public String getAcademicPeriod() {
        return academicPeriod;
    }

    public void setAcademicPeriod(String academicPeriod) {
        this.academicPeriod = academicPeriod;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public Set getStudentClassrooms() {
        return Collections.unmodifiableSet(studentClassrooms);
    }

    public void setStudentClassrooms(Set studentClassrooms) {
        this.studentClassrooms = studentClassrooms;
    }

}
