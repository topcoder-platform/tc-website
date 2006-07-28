package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.UserPreferenceDAO;
import com.topcoder.web.common.model.MemberContactMessage;
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
    
    public UserPreference find(Long userId, Long preferenceId) {
    	Query q = session.createQuery(" from UserPreference " +
    								  " where user_id=" + userId +
    								  " and preference_id=" + preferenceId);
    	return (UserPreference) q.uniqueResult();
    }
    
	public void saveOrUpdate(UserPreference up) {
		super.saveOrUpdate(up);
	}
    


}
