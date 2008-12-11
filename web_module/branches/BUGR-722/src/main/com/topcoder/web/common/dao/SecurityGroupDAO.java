package com.topcoder.web.common.dao;


import java.util.List;
import java.util.Set;

import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision: 68985 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public interface SecurityGroupDAO extends GenericDAO<SecurityGroup, Long> {
    List<SecurityGroup> getSecurityGroups(Set registrationTypes);

    public boolean hasInactiveHSGroup(User u);

    public boolean hasGroup(long userId, long groupId);

    boolean hasGroup(User u, SecurityGroup g);
}
