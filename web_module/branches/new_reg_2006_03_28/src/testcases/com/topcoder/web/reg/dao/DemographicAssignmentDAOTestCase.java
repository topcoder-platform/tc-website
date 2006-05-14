package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.CoderType;
import com.topcoder.web.reg.model.RegistrationType;

import java.util.List;
import java.util.HashSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicAssignmentDAOTestCase extends TCHibernateTestCase {


    public void testLoadList() {
        CoderType ct = Util.getFactory().getCoderTypeDAO().find(new Integer(1));
        RegistrationType rt = Util.getFactory().getRegistrationTypeDAO().find(new Integer(1));
        HashSet h = new HashSet();
        h.add(rt);
        List l = Util.getFactory().getDemographicAssignmentDAO().getAssignments(ct, h);
        assertTrue("no assignments found", l!=null && !l.isEmpty());
    }
}
