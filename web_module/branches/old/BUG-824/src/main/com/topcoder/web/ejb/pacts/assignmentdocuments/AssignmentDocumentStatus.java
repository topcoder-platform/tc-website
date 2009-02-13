package com.topcoder.web.ejb.pacts.assignmentdocuments;

import java.io.Serializable;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 */
public class AssignmentDocumentStatus implements Serializable, Cloneable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    public static final Long PENDING_STATUS_ID = new Long(1);
    public static final Long DELETED_STATUS_ID = new Long(2);
    public static final Long AFFIRMED_STATUS_ID = new Long(3);
    public static final Long EXPIRED_STATUS_ID = new Long(4);

    private Long id;
    private String description;

    public AssignmentDocumentStatus() {
    }

    public AssignmentDocumentStatus(Long id) {
        setId(id);
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }


    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return id.intValue();
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final AssignmentDocumentStatus other = (AssignmentDocumentStatus) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
}
