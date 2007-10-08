package com.topcoder.web.common.dao;


import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public interface SecurityGroupDAO {
    List<SecurityGroup> getSecurityGroups(Set registrationTypes);

    public boolean hasInactiveHSGroup(User u);

    public boolean hasGroup(long userId, long groupId);

    boolean hasGroup(User u, SecurityGroup g);
}
