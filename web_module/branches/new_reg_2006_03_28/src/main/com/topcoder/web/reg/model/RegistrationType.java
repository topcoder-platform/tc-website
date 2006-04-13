package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class RegistrationType extends Base {
    private Integer id;
    private String description;
    private Boolean active;
    private Long securityGroupId;

    protected RegistrationType() {

    }

    public String getDescription() {
        return description;
    }

    public Integer getId() {
        return id;
    }


    public Boolean getActive() {
        return active;
    }

    public Long getSecurityGroupId() {
        return securityGroupId;
    }

}
