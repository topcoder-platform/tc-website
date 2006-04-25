package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.util.Set;
import java.util.Collections;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class SecurityGroup extends Base {

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

    public Object clone() throws CloneNotSupportedException {
        SecurityGroup ret = (SecurityGroup)super.clone();
        for(Iterator it = users.iterator(); it.hasNext();) {
            ret.users.add(((SecurityGroup)it.next()).clone());
        }
        for(Iterator it = registrationTypes.iterator(); it.hasNext();) {
            ret.registrationTypes.add(((RegistrationType)it.next()).clone());
        }
        return ret;
    }


}
