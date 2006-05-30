package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface UserDAO {
    User find(Long id);

    User find(String userName, boolean ignoreCase);

    void saveOrUpdate(User u);
}
