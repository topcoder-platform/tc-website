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

    private long id;
    private Professor professor;
    private String name;
    private int statusId;
    private String academicPeriod;
    private String description;

    private Set students;

    public Classroom() {
        this.students = new HashSet();
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

    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Set getStudents() {
        return Collections.unmodifiableSet(students);
    }

    public void setStudents(Set students) {
        this.students = students;
    }

}
