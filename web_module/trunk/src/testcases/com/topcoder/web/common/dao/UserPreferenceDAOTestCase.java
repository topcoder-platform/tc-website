package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 24, 2006
 */
public class UserPreferenceDAOTestCase extends TCHibernateTestCase {

    public void testFind1() {
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(7545675));
        Preference p = DAOUtil.getFactory().getPreferenceDAO().find(new Integer(24));

        assertNotNull("User 7545675 (cucu) should be in db", u);
        assertNotNull("Preference 24 (member contact) should be in db", p);

        UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO().find(u, p);
        assertNotNull("could not find UserPreference", up);
    }


    public void testFind2() {
        UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO().find(new Long(7545675), new Integer(24));
        assertNotNull("could not find UserPreference", up);
    }

}
