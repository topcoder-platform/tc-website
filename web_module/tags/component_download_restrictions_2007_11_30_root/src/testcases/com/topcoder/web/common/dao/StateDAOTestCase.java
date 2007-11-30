package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.State;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class StateDAOTestCase extends TCHibernateTestCase {

    public void testGetStates() {
        List states = DAOUtil.getFactory().getStateDAO().getStates();
        assertTrue("could not find any states in the db", !states.isEmpty());
    }

    public void testFind() {
        State c = DAOUtil.getFactory().getStateDAO().find("CO");
        assertTrue("could not find colorado", c.getName().equals("Colorado"));
    }

    public void testFindWrongCase() {
        State c = DAOUtil.getFactory().getStateDAO().find("Co");
        assertTrue("could not find colorado", c.getName().equals("Colorado"));
    }
}
