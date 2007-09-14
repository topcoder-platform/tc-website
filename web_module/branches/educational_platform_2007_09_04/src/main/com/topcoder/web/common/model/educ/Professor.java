/*
* Professor
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Table;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.User;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
@Entity
@Table(appliesTo="professor")
public class Professor extends Base {

    private Long id;

    private User user;
    private School school;
    private Integer statusId;

//    private Set students;
    private Set classrooms;

    public Professor() {
//        this.students = new HashSet();
        this.classrooms = new HashSet();
    }

    @Id @GeneratedValue(generator="foreign")    
    @GenericGenerator(name="foreign", strategy="foreign",
        parameters = {
            @Parameter(name="property", value = "user")
        }
    )
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

    @OneToMany(fetch = FetchType.LAZY,
            targetEntity = Classroom.class,
            cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
    public Set getClassrooms() {
        return Collections.unmodifiableSet(classrooms);
    }

    public void setClassrooms(Set classrooms) {
        this.classrooms = classrooms;
    }

//  public Set getStudents() {
//  return Collections.unmodifiableSet(students);
//}
//
//public void setStudents(Set students) {
//  this.students = students;
//}

}
