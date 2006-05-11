package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.dao.UserDAO;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class UserDAOHibernate extends Base implements  UserDAO {

    public UserDAOHibernate() {
        super();
    }

    public UserDAOHibernate(Session session) {
        super(session);
    }

    public User find(Long id) {
        return (User) super.find(User.class, id);
    }

    public User find(String userName) {
        return (User) findOne(User.class, "handle_lower", userName.toLowerCase());
    }

    public void saveOrUpdate(User u) {
        super.saveOrUpdate(u);
    }


}
