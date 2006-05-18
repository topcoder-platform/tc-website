package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.model.DemographicResponse;
import com.topcoder.web.reg.model.User;
import org.hibernate.Session;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class UserDAOHibernate extends Base implements UserDAO {

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
        //can't figure out how to get hibernate to handle this, so
        //i'm doing it here.
        DemographicResponse dr;
        for (Iterator it = u.getDemographicResponses().iterator(); it.hasNext();) {
            dr = (DemographicResponse) it.next();
            dr.setId(new DemographicResponse.Identifier(u.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
            session.saveOrUpdate(dr);
        }
    }
}
