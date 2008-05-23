package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.UserPreferenceDAO;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class UserPreferenceDAOHibernate extends Base implements UserPreferenceDAO {

    public UserPreferenceDAOHibernate() {
        super();
    }

    public UserPreferenceDAOHibernate(Session session) {
        super(session);
    }

    public UserPreference find(User user, Preference preference) {
        return (UserPreference) find(UserPreference.class, new UserPreference.Identifier(user, preference));
    }

    public UserPreference find(Long userId, Integer preferenceId) {
        Query q = session.createQuery(" from UserPreference " +
                " where user_id=" + userId +
                " and preference_id=" + preferenceId).setCacheable(true);
        return (UserPreference) q.uniqueResult();
    }

    public void saveOrUpdate(UserPreference up) {
        super.saveOrUpdate(up);
    }

    public List<UserPreference> find(List<Long> userIdList, Integer preferenceId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" from UserPreference " +
                " where preference_id=" + preferenceId +
                " and user_id in (");

        for (Long id : userIdList) {
            query.append(id).append(",");
        }
        query.delete(query.length() - 1, query.length());
        query.append(")");

        Query q = session.createQuery(query.toString());
        return q.list();
    }

    public List<UserPreference> find(Integer preferenceId) {
        Query q = session.createQuery(" from UserPreference " +
                " where preference_id=" + preferenceId);
        return q.list();
    }
}
