package com.topcoder.web.common.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamDAOTestCase extends TCHibernateTestCase {

    public void testGetTeamsForSchool() {
        assertFalse("couldn't find team for school",
                DAOUtil.getFactory().getTeamDAO().getHighSchoolTeamsForSchool(
                        DAOUtil.getFactory().getSchoolDAO().find(new Long(1))).isEmpty());
    }

}
