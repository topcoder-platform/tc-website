package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.User;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 18, 2006
 */
public interface MemberContactBlackListDAO {

    MemberContactBlackList find(User user, User blockedUser);

    MemberContactBlackList findOrCreate(User user, User blockedUser);

    List getBlockedUsers(Long userId);

    List getPreviouslyBlockedUsers(Long userId);

    void saveOrUpdate(MemberContactBlackList u);

}
