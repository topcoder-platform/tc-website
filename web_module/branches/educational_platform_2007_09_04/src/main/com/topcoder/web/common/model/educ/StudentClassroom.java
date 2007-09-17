package com.topcoder.web.common.model.educ;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
@Entity
@Table(name="student_classroom_xref")
public class StudentClassroom extends Base {

    public static final Long PENDING_STATUS = 1l;
    
    private Identifier id = new Identifier();
    private Long statusId;

    public StudentClassroom() {
    }

    public StudentClassroom(Coder student, Classroom classroom, Long statusId) {
        this.id.setStudent(student);
        this.id.setClassroom(classroom);
        this.statusId = statusId;
    }

    @EmbeddedId
//    @AttributeOverrides( {
//        @AttributeOverride(name="student", column=@Column(name="student_id", nullable=false) ), 
//        @AttributeOverride(name="classroom", column=@Column(name="classroom_id", nullable=false) ) } )
    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    @Column(name="status_id")
    public Long getStatusId() {
        return statusId;
    }

    public void setValue(Long statusId) {
        this.statusId = statusId;
    }

    @Embeddable
    public static class Identifier implements Serializable {
        private Coder student;
        private Classroom classroom;

        public Identifier(Coder student, Classroom classroom) {
            this.student = student;
            this.classroom = classroom;
        }

        public Identifier() {
        }

        @OneToOne @PrimaryKeyJoinColumn
        public Coder getStudent() {
            return student;
        }

        public void setStudent(Coder student) {
            this.student = student;
        }

        @OneToOne @PrimaryKeyJoinColumn
        public Classroom getClassroom() {
            return classroom;
        }

        public void setClassroom(Classroom classroom) {
            this.classroom = classroom;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            try {
                StudentClassroom.Identifier sc = (StudentClassroom.Identifier) o;
                boolean e = (sc.getStudent().getId().equals(getStudent().getId()) &&
                        sc.getClassroom().getId().equals(getClassroom().getId()));
                return e;
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            int i = (student.getId().hashCode() + " " + classroom.getId()).hashCode();
            return i;
        }
    }


    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((statusId == null) ? 0 : statusId.hashCode());
        return result;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final StudentClassroom other = (StudentClassroom) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (statusId == null) {
            if (other.statusId != null)
                return false;
        } else if (!statusId.equals(other.statusId))
            return false;
        return true;
    }


}
