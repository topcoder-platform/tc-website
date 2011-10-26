package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.PreferenceGroupDAO;
import com.topcoder.web.common.model.PreferenceGroup;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public class PreferenceGroupDAOHibernate extends Base implements PreferenceGroupDAO {
    public PreferenceGroup find(Integer id) {
        return (PreferenceGroup) super.find(PreferenceGroup.class, id);
    }
}
