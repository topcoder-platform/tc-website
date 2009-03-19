package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 28, 2006
 */
public class CoderType extends Base {
    private Integer id;
    private String description;
    private String status;

    public static final Integer STUDENT = new Integer(1);
    public static final Integer PROFESSIONAL = new Integer(2);

    public CoderType() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                CoderType oa = (CoderType) o;
                return oa.getId().equals(id);
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

}
