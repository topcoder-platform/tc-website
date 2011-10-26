package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author cucu
 * @version $Revision: 64563 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 24, 2006
 */
public class PreferenceDAOTestCase extends TCHibernateTestCase {

    public void testFindById() {
        Preference p = DAOUtil.getFactory().getPreferenceDAO().find(new Integer(24));
        assertNotNull("could not find preference 24 (member contact)", p);
        assertTrue("name of the preference should not be empty or null", p.getName() != null && p.getName().length() > 0);
    }

    public void testFindByName() {
        Preference p = DAOUtil.getFactory().getPreferenceDAO().find("unlock");
        assertNotNull("could not find preference 'unlock'", p);
        assertEquals("preference 'unlock' should have id 1", 1, p.getId().longValue());
    }

    public void testRegTypes() {
        Preference p = DAOUtil.getFactory().getPreferenceDAO().find(new Integer(24));
        assertTrue("we found no reg types", p.getRegistrationTypes() != null && !p.getRegistrationTypes().isEmpty());
    }
}
