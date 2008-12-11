package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.PreferenceValueDAO;
import com.topcoder.web.common.model.PreferenceValue;
import org.hibernate.Query;

import java.util.List;

/**
 * @author cucu
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class PreferenceValueDAOHibernate extends Base implements PreferenceValueDAO {


    public PreferenceValue find(Integer id) {
        return (PreferenceValue) find(PreferenceValue.class, id);
    }

    public List findForPreference(Integer preferenceId) {
        Query q = session.createQuery("from PreferenceValue where preference_id=" + preferenceId);
        return q.list();
    }


}
