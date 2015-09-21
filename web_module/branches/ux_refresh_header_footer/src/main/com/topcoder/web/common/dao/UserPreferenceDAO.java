package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public interface UserPreferenceDAO {

    UserPreference find(User user, Preference preference);

    UserPreference find(Long userId, Integer preferenceId);

    void saveOrUpdate(UserPreference u);

    List<UserPreference> find(List<Long> userIdList, Integer preferenceId);

    List<UserPreference> find(Integer preferenceId);
}
