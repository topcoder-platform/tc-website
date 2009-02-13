package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class State extends Base {
    private String code;
    private String name;
    private Boolean optionalDemographics;

    public State() {

    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public Boolean getOptionalDemographics() {
        return optionalDemographics;
    }

    public boolean isOptionalDemographics() {
        return optionalDemographics.booleanValue();
    }

}
