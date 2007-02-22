package com.topcoder.web.common.model;


/**
 * @author pulky
 */
public class AssignmentDocumentStatus extends Base {
    public static final Long PENDING_STATUS_ID = new Long(1);
    public static final Long DELETED_STATUS_ID = new Long(2);
    public static final Long AFFIRMED_STATUS_ID = new Long(3);

    private Long id;
    private String description;

    public AssignmentDocumentStatus() {
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

}
