package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class SecurityGroup extends Base {

    public static final Integer ACTIVE = new Integer(1);
    public static final Integer INACTIVE = new Integer(2);

    private Long groupId;
    private String description;
    private Long createUserId;
    private Set users;
    private Set registrationTypes;

    protected SecurityGroup() {

    }

    public Long getGroupId() {
        return groupId;
    }

    public String getDescription() {
        return description;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public Set getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public Set getRegistrationTypes() {
        return Collections.unmodifiableSet(registrationTypes);
    }


}
