package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.PreferenceValue;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 24, 2006
 */
public class PreferenceValueDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        PreferenceValue p = DAOUtil.getFactory().getPreferenceValueDAO().find(new Integer(1));
        assertNotNull("could not find PreferenceValue 1", p);
    }

    public void testFindForPreference() {
        List l = DAOUtil.getFactory().getPreferenceValueDAO().findForPreference(new Integer(6));
        assertEquals("preference values for preference_id 6 should have 2 elements", 2, l.size());
    }

}
