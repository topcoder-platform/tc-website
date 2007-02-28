package com.topcoder.web.common.model;


/**
 * @author pulky
 */
public class AssignmentDocumentType extends Base {
    public static final Long COMPONENT_COMPETITION_TYPE_ID = new Long(1);
    public static final Long STUDIO_CONTEST_TYPE_ID = new Long(2);

    private Long id;
    private String description;
    private String template;
    
    public AssignmentDocumentType() {
    }

    public AssignmentDocumentType(Long id) {
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

    /**
     * @return the template
     */
    public String getTemplate() {
        return template;
    }

    /**
     * @param template the template to set
     */
    public void setTemplate(String template) {
        this.template = template;
    }

}
