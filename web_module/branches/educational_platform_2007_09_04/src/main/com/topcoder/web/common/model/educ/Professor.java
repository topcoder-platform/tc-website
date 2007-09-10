/*
* Professor
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.User;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Professor extends Base {

    private Long id;

    private User user;
    private School school;
    private int statusId;

    private Set students;
    private Set classrooms;

    public Professor() {
        this.students = new HashSet();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set getClassrooms() {
        return Collections.unmodifiableSet(classrooms);
    }

    public void setClassrooms(Set classrooms) {
        this.classrooms = classrooms;
    }


}
