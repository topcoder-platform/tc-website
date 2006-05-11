package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.model.State;
import junit.framework.TestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class StateDAOTestCase extends TestCase {
    public void testGetStates() {
        List states = new StateDAO(HibernateUtils.getLocalSession()).findAll(State.class);
        assertTrue("could not find any states in the db", !states.isEmpty());
    }

    public void testFind(Long id) {
        State c = new StateDAO(HibernateUtils.getLocalSession()).find("CO");
        assertTrue("could not find colorado", c.getName().equals("Colorado"));
    }
}
