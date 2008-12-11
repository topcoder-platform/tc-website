package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.PreferenceDAO;
import com.topcoder.web.common.model.Preference;
import org.hibernate.Query;

/**
 * @author cucu
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class PreferenceDAOHibernate extends Base implements PreferenceDAO {

    public Preference find(Integer id) {
        return (Preference) find(Preference.class, id);
    }

    public Preference find(String name) {
        Query q = session.createQuery("from Preference p where p.name='" + name + "'");
        return (Preference) q.uniqueResult();
    }


}
