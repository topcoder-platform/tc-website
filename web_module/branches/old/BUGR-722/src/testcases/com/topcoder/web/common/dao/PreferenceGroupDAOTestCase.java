package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.PreferenceGroup;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public class PreferenceGroupDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        PreferenceGroup p = DAOUtil.getFactory().getPreferenceGroupDAO().find(new Integer(1));
        assertNotNull("could not find PreferenceGroup 1", p);
    }

}
