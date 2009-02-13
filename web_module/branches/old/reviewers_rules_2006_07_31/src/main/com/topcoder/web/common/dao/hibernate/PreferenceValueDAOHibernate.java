package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.PreferenceValueDAO;
import com.topcoder.web.common.model.PreferenceValue;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class PreferenceValueDAOHibernate extends Base implements PreferenceValueDAO {

    public PreferenceValueDAOHibernate() {
        super();
    }

    public PreferenceValueDAOHibernate(Session session) {
        super(session);
    }

    public PreferenceValue find(Long id) {
        return (PreferenceValue) find(PreferenceValue.class, id);
    }
    
    public List findForPreference(Long preferenceId) {
    	Query q = session.createQuery("from PreferenceValue where preference_id=" + preferenceId);
    	return q.list();
    }


}
