package com.topcoder.web.common.model.educ;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.School;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class ProfessorSchool extends Base {

    public static final Long PENDING_STATUS = 1l;
    public static final Long ACTIVE_STATUS = 2l;
    public static final Long INACTIVE_STATUS = 3l;
    
    private Identifier id = new Identifier();
    private Long statusId;

    public ProfessorSchool() {
    }

    public ProfessorSchool(Professor professor, School school, Long statusId) {
        this.id.setProfessor(professor);
        this.id.setSchool(school);
        this.statusId = statusId;
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public static class Identifier implements Serializable {
        private Professor professor;
        private School school;

        public Identifier(Professor professor, School school) {
            this.professor = professor;
            this.school = school;
        }

        public Identifier() {
        }

        public Professor getProfessor() {
            return professor;
        }

        public void setProfessor(Professor professor) {
            this.professor = professor;
        }

        public School getSchool() {
            return school;
        }

        public void setSchool(School school) {
            this.school = school;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            try {
                ProfessorSchool.Identifier sc = (ProfessorSchool.Identifier) o;
                boolean e = (sc.getProfessor().getId().equals(getProfessor().getId()) &&
                        sc.getSchool().getId().equals(getSchool().getId()));
                return e;
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            int i = (professor.getId().hashCode() + " " + school.getId()).hashCode();
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
        final ProfessorSchool other = (ProfessorSchool) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }


}
