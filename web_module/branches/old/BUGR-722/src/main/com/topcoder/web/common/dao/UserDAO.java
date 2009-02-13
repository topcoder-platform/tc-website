package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.User;


/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface UserDAO {
    User find(Long id);

    User find(String userName, boolean ignoreCase);

    User find(String userName, boolean ignoreCase, boolean activeRequired);

    List find(String handle, String firstName, String lastName, String email);
    
    void saveOrUpdate(User u);
}
