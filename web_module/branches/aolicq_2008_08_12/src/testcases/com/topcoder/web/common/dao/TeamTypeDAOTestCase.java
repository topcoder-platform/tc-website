package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.TeamType;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamTypeDAOTestCase extends TCHibernateTestCase {
    public void testFind() {
        assertFalse("couldn't find the highschool team type",
                DAOUtil.getFactory().getTeamTypeDAO().find(TeamType.HIGH_SCHOOL_TYPE) == null);
    }
}
