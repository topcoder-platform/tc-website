package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.TeamType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find the highschool team type",
                Util.getFactory().getTeamTypeDAO().find(TeamType.HIGH_SCHOOL_TYPE)==null);
    }
}
