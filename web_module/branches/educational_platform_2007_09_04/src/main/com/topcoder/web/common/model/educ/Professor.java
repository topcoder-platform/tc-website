/*
* Professor
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.User;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
@Entity
@Table(name="professor")
public class Professor extends Base {

    private Long id;

    private User user;
    private Integer statusId;

    private Set<ProfessorSchool> professorSchools;

    private Set<Classroom> classrooms;

    public Professor() {
        this.classrooms = new HashSet<Classroom>();
        this.professorSchools = new HashSet<ProfessorSchool>();
    }

    @Id @GeneratedValue(generator="generator")
    @GenericGenerator(name="generator", strategy="foreign", 
            parameters=@Parameter(name="property", value="user"))
    @Column(name="user_id", nullable=false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy="id.professor")
    @Cascade( {CascadeType.SAVE_UPDATE} )
    public Set<ProfessorSchool> getProfessorSchools() {
        return Collections.unmodifiableSet(professorSchools);
    }

    public void setProfessorSchools(Set<ProfessorSchool> professorSchools) {
        this.professorSchools = professorSchools;
    }

    @Column(name = "status_id", nullable = false)
    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    @OneToOne @PrimaryKeyJoinColumn
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @OneToMany(mappedBy="professor")
    @Cascade( {CascadeType.ALL} )
    public Set<Classroom> getClassrooms() {
        return Collections.unmodifiableSet(classrooms);
    }

    public void setClassrooms(Set<Classroom> classrooms) {
        this.classrooms = classrooms;
    }

    public void addClassrooms(Classroom classroom) {
        classroom.setProfessor(this);
        this.classrooms.add(classroom);
    }

    @Transient
    public Set<Coder> getStudents() {
        Set<Coder> cs = new HashSet<Coder>();
        for (Classroom c : this.classrooms) {
            for (StudentClassroom sc : c.getStudentClassrooms()) {
                if (!cs.contains(sc.getId().getStudent())) {
                    cs.add(sc.getId().getStudent());
                }
            }
        }
        return Collections.unmodifiableSet(cs);
    }
    
    @Transient
    public Set<School> getActiveSchools() {
        Set schools = new HashSet<School>();
        for (ProfessorSchool ps : professorSchools) {
            if (ps.getStatusId() == ProfessorSchool.ACTIVE_STATUS) {
                schools.add(ps.getId().getSchool());
            }
        }
        return schools;
    }

    @Transient
    public School getSchoolUsingId(Long schoolId) {
        for (ProfessorSchool ps : professorSchools) {
            if (ps.getStatusId() == ProfessorSchool.ACTIVE_STATUS
                    && ps.getId().getSchool().getId() == schoolId) {
                return ps.getId().getSchool();
            }
        }
        return null;
    }

    @Transient
    public boolean hasClassroom(School s, String classroomName, String classroomAcademicPeriod) {
        for (Classroom c : classrooms) {
            if (c.getName().equals(classroomName) &&
                    c.getAcademicPeriod().equals(classroomAcademicPeriod) &&
                    c.getSchool().equals(s)) {
                return true;
            }
        }
        return false;
    }
    
}
