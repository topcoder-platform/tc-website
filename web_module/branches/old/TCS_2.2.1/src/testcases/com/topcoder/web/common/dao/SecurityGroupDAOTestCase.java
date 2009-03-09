package com.topcoder.web.common.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.HashSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class SecurityGroupDAOTestCase extends TCHibernateTestCase {

    public void testGetGroups() {
        HashSet s = new HashSet(DAOUtil.getFactory().getRegistrationTypeDAO().getRegistrationTypes());
        assertFalse("couldn't find the security groups", DAOUtil.getFactory().getSecurityGroupDAO().getSecurityGroups(s).isEmpty());
    }

    public void testHasInactiveHSGroup() {
        assertTrue("didn't find inactive group for SnapDragon",
                DAOUtil.getFactory().getSecurityGroupDAO().hasInactiveHSGroup(DAOUtil.getFactory().getUserDAO().find("SnapDragon", false)));
    }
}
