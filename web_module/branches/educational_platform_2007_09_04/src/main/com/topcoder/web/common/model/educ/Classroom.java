/*
* Classroom
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
@Entity
@Table(name="classroom")
public class Classroom {

    private Long id;
    private Professor professor;
    private String name;
    private Integer statusId;
    private String academicPeriod;
    private String description;

    private Set<StudentClassroom> studentClassrooms;

    public Classroom() {
        this.studentClassrooms = new HashSet<StudentClassroom>();
    }

    @GenericGenerator(name="generator", strategy="com.topcoder.web.common.model.IdGenerator", parameters=@Parameter(name="sequence_name", value="CLASSROOM_SEQ"))@Id @GeneratedValue(generator="generator")
    @Column(name="classroom_id", nullable=false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="academic_period")
    public String getAcademicPeriod() {
        return academicPeriod;
    }

    public void setAcademicPeriod(String academicPeriod) {
        this.academicPeriod = academicPeriod;
    }

    @Column(name="description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name="name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="professor_id")
    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    @Column(name="status_id")
    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="StudentClassroom")
    @Cascade( {CascadeType.SAVE_UPDATE} )
    public Set<StudentClassroom> getStudentClassrooms() {
        return Collections.unmodifiableSet(studentClassrooms);
    }

    public void setStudentClassrooms(Set<StudentClassroom> studentClassrooms) {
        this.studentClassrooms = studentClassrooms;
    }

}
