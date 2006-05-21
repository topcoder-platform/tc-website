package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.HashSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class SecurityGroupDAOTestCase extends TCHibernateTestCase {

    public void testGetGroups() {
        HashSet s = new HashSet(Util.getFactory().getRegistrationTypeDAO().getRegistrationTypes());
        assertFalse("couldn't find the security groups", Util.getFactory().getSecurityGroupDAO().getSecurityGroups(s).isEmpty());
    }
}
