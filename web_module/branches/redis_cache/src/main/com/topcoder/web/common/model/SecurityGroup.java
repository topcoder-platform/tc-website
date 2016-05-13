package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class SecurityGroup extends Base {

    public static final Integer ACTIVE = 1;
    public static final Integer INACTIVE = 2;

    private Long id;
    private String description;
    private Long createUserId;
    private Set<User> users;
    private Set<RegistrationType> registrationTypes;

    public SecurityGroup() {

    }

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public Set<User> getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public Set<RegistrationType> getRegistrationTypes() {
        return Collections.unmodifiableSet(registrationTypes);
    }


}
