package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class SchoolType extends Base {
    private Integer id;
    private String description;

    protected SchoolType() {

    }

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}
