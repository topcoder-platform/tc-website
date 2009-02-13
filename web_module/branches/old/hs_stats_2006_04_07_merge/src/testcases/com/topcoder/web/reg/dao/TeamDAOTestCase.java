package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamDAOTestCase extends TCHibernateTestCase {

    public void testGetTeamsForSchool() {
        assertFalse("couldn't find team for school",
                Util.getFactory().getTeamDAO().getHighSchoolTeamsForSchool(
                        Util.getFactory().getSchoolDAO().find(new Long(1))).isEmpty());
    }

}
