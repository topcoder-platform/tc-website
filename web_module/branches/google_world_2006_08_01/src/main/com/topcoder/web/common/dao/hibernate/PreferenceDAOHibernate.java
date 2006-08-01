package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.PreferenceDAO;
import com.topcoder.web.common.model.Preference;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class PreferenceDAOHibernate extends Base implements PreferenceDAO {

    public PreferenceDAOHibernate() {
        super();
    }

    public PreferenceDAOHibernate(Session session) {
        super(session);
    }

    public Preference find(Long id) {
        return (Preference) find(Preference.class, id);
    }
    
    public Preference find(String name) {
    	Query q = session.createQuery("from Preference p where p.name='" + name + "'");
    	return (Preference) q.uniqueResult();
    }


}
