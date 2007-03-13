package com.topcoder.web.common.model;


/**
 * @author pulky
 */
public class AssignmentDocumentStatus extends Base {
    public static final Long PENDING_STATUS_ID = new Long(1);
    public static final Long DELETED_STATUS_ID = new Long(2);
    public static final Long AFFIRMED_STATUS_ID = new Long(3);
    public static final Long EXPIRED_STATUS_ID = new Long(4);
    public static final Long REJECTED_STATUS_ID = new Long(5);

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
