package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.model.DemographicResponse;
import com.topcoder.web.reg.model.User;
import org.hibernate.Query;
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
        boolean isNew = u.isNew();
        super.saveOrUpdate(u);

        if (!isNew) {
            StringBuffer query = new StringBuffer(100);
            query.append(" DELETE DemographicResponse WHERE user_id = ?");
            Query q;
            q = session.createQuery(query.toString());
            q.setLong(0, u.getId().longValue());
            q.executeUpdate();
        }
        DemographicResponse tr;
        DemographicResponse dr;
        for (Iterator it = u.getTransientResponses().iterator(); it.hasNext();) {
            tr = (DemographicResponse) it.next();
            log.debug("adding response:" + tr.getQuestion().getId() + " " + tr.getAnswer().getId() + " " + tr.getResponse());
            dr = new DemographicResponse();
            dr.setAnswer(tr.getAnswer());
            dr.setQuestion(tr.getQuestion());
            dr.setResponse(tr.getResponse());
            dr.setUser(u);
            dr.getId().setAnswer(tr.getAnswer());
            dr.getId().setQuestion(tr.getQuestion());
            dr.getId().setUser(u);
            super.saveOrUpdate(dr);
        }

    }
}
