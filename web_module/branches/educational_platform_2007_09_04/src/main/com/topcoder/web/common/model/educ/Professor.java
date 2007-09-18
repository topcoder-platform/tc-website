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
    private School school;
    private Integer statusId;

//    private Set students;
    private Set<Classroom> classrooms;

    public Professor() {
//        this.students = new HashSet();
        this.classrooms = new HashSet();
    }

    @GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="user"))@Id @GeneratedValue(generator="generator")    
    @Column(name="user_id", nullable=false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @OneToOne @PrimaryKeyJoinColumn
    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
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

    @OneToMany(fetch=FetchType.LAZY, mappedBy="professor")
    @Cascade( {CascadeType.SAVE_UPDATE} )
    public Set<Classroom> getClassrooms() {
        return Collections.unmodifiableSet(classrooms);
    }

    public void setClassrooms(Set<Classroom> classrooms) {
        this.classrooms = classrooms;
    }

    public void addClassrooms(Classroom classroom) {
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
}
