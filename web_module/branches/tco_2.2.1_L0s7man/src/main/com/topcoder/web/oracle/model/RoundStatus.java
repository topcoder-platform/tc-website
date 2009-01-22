package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 20, 2007
 */
public class RoundStatus extends Base {
    public static final Integer ACTIVE = 2;
    public static final Integer UNACTIVE = 1;
    public static final Integer INACTIVE = 3;

    private Integer id;
    private String description;

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
}
