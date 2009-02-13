package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.State;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class StateDAOTestCase extends TCHibernateTestCase {
    
    public void testGetStates() {
        List states = Util.getFactory().getStateDAO().getStates();
        assertTrue("could not find any states in the db", !states.isEmpty());
    }

    public void testFind() {
        State c = Util.getFactory().getStateDAO().find("CO");
        assertTrue("could not find colorado", c.getName().equals("Colorado"));
    }

    public void testFindWrongCase() {
        State c = Util.getFactory().getStateDAO().find("Co");
        assertTrue("could not find colorado", c.getName().equals("Colorado"));
    }
}
