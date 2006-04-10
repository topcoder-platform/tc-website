package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class UserDAO extends Base {
    public User find(Long id) {
        return (User)super.find(User.class, id);
    }

    public void saveOrUpdate(User u) {
        super.saveOrUpdate(u);
    }
    

}
