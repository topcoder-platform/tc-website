/*
* Professor
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.HashSet;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
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
@Table(name = "professor")
public class Professor extends Base {

    public static final Integer ACTIVE_STATUS = 1;

    private Long id;

    private User user;
    private ProfessorStatus status;

    private Set<Classroom> classrooms;

    public Professor() {
        this.classrooms = new HashSet<Classroom>();
    }

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "foreign",
            parameters = @Parameter(name = "property", value = "user"))
    @Column(name = "user_id", nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne()
    @JoinColumn(name = "status_id", nullable = false)
    public ProfessorStatus getStatus() {
        return status;
    }

    public void setStatus(ProfessorStatus status) {
        this.status = status;
    }

    @OneToOne(fetch=FetchType.LAZY)
    @PrimaryKeyJoinColumn
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @OneToMany(fetch=FetchType.LAZY, mappedBy = "professor")
    @Cascade({CascadeType.ALL})
    @OrderBy("school, name asc")
    public Set<Classroom> getClassrooms() {
        return classrooms;
    }

    public void setClassrooms(Set<Classroom> classrooms) {
        this.classrooms = classrooms;
    }

    public void addClassrooms(Classroom classroom) {
        classroom.setProfessor(this);
        this.classrooms.add(classroom);
    }

    public void removeClassroom(Classroom classroom) {
        if (this.classrooms.contains(classroom)) {
            this.classrooms.remove(classroom);
        }
    }

    @Transient
    public Set<Coder> getStudents(School s) {
        SortedSet<Coder> cs = new TreeSet<Coder>(new StudentComparator());
        for (Classroom c : this.classrooms) {
            if (c.getSchool().equals(s)) {
                for (StudentClassroom sc : c.getStudentClassrooms()) {
                    if (!cs.contains(sc.getId().getStudent())) {
                        cs.add(sc.getId().getStudent());
                    }
                }
            }
        }
        return cs;
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((user == null) ? 0 : user.hashCode());
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
        final Professor other = (Professor) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (user == null) {
            if (other.user != null)
                return false;
        } else if (!user.equals(other.user))
            return false;
        return true;
    }


}
