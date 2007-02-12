package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class RegionType extends Base {
    private Integer id;
    private String description;

    public RegionType() {
    }

    public Integer getId() {
        return id;
    }
    
    public String getDescription() {
        return description;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
