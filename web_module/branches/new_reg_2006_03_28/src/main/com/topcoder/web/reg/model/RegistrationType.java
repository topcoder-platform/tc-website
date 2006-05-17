package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.util.Set;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class RegistrationType extends Base {

    private Integer id;
    private String description;
    private String name;
    private Boolean active;
    private SecurityGroup securityGroup;
    private Set notifications;
    private Integer sort;

    public static final Integer COMPETITION_ID = new Integer(1);
    public static final Integer CORPORATE_ID = new Integer(2);
    public static final Integer HIGH_SCHOOL_ID = new Integer(3);
    public static final Integer MINIMAL_ID = new Integer(4);
    public static final Integer SOFTWARE_ID = new Integer(5);

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

    public SecurityGroup getSecurityGroup() {
        return securityGroup;
    }

    public Set getNotifications() {
        return Collections.unmodifiableSet(notifications);
    }

    public String getName() {
        return name;
    }

    public Integer getSort() {
        return sort;
    }


}
