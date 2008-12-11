/*
* Classroom
*
* Created Sep 10, 2007
*/
package com.topcoder.web.ep.model;

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
import javax.persistence.Transient;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.educ.Professor;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: Classroom.java 66901 2007-11-05 19:50:28Z pulky $
 */
@Entity
@Table(name="classroom")
public class Classroom extends Base implements HttpSessionBindingListener {

    public static final Integer ACTIVE = 1;
    private Long id;
    private Professor professor;
    private String name;
    private Integer statusId;
    private String academicPeriod;
    private String description;

    private School school;

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
    @JoinColumn(name="professor_id", nullable=false)
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

    @OneToMany(fetch=FetchType.LAZY, mappedBy="id.classroom")
    @Cascade( {CascadeType.ALL} )
    public Set<StudentClassroom> getStudentClassrooms() {
        return Collections.unmodifiableSet(studentClassrooms);
    }

    public void setStudentClassrooms(Set<StudentClassroom> studentClassrooms) {
        this.studentClassrooms = studentClassrooms;
    }
    
    @ManyToOne()
    @JoinColumn(name="school_id", nullable=false)
    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    @Transient
    public StudentClassroom getStudentClassroom(StudentClassroom orig) {
        for (StudentClassroom sc : this.studentClassrooms) {
            if (sc.equals(orig)) {
                return sc;
            }
        }
        return null;
    }

    @Transient
    public StudentClassroom getStudentClassroom(Long coderId) {
        for (StudentClassroom sc : this.studentClassrooms) {
            if (sc.getId().getStudent().getId().equals(coderId)) {
                return sc;
            }
        }
        return null;
    }

    @Transient
    public void addStudentClassroom(StudentClassroom sc) {
        this.studentClassrooms.add(sc);
    }

    @Transient
    public void deactivateStudent(Coder s) {
        for (StudentClassroom sc : (Set<StudentClassroom>) this.studentClassrooms) {
            if (sc.getId().getStudent().getId().equals(s.getId())) {
                sc.setStatusId(StudentClassroom.INACTIVE_STATUS);
            }
        }
    }

    @Transient
    public void activateStudent(Coder s) {
        for (StudentClassroom sc : (Set<StudentClassroom>) this.studentClassrooms) {
            if (sc.getId().getStudent().getId().equals(s.getId())) {
                sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
            }
        }
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((academicPeriod == null) ? 0 : academicPeriod.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((school == null) ? 0 : school.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Classroom other = (Classroom) obj;
        if (academicPeriod == null) {
            if (other.academicPeriod != null)
                return false;
        } else if (!academicPeriod.equals(other.academicPeriod))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (school == null) {
            if (other.school != null)
                return false;
        } else if (!school.equals(other.school))
            return false;
        return true;
    }

    public void valueBound(HttpSessionBindingEvent arg0) {
        log.debug("Bounding classroom : " + ((this.name != null) ? this.name : "unk"));
    }

    public void valueUnbound(HttpSessionBindingEvent arg0) {
        log.debug("Unbounding classroom : " + ((this.name != null) ? this.name : "unk"));
    }
}
