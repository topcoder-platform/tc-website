package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.User;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class UserDAO extends Base {

    public UserDAO() {
        super();
    }

    public UserDAO(Session session) {
        super(session);
    }

    public User find(Long id) {
        return (User)super.find(User.class, id);
    }

    public User find(String userName) {
        return (User)findOne(User.class, "handle_lower", userName.toLowerCase());
    }

    public void saveOrUpdate(User u) {
        super.saveOrUpdate(u);
    }


}
