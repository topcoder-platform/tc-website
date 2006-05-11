package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.model.RegistrationType;
import junit.framework.TestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class RegistrationTypeDAOTestCase extends TestCase {

    public void testFind() {
        RegistrationType rt = new RegistrationTypeDAO(HibernateUtils.getLocalSession()).find(new Integer(1));
        assertTrue("could not find the registration type for competitions", rt != null);
    }

    public void testGetRegistrationTypes() {
        List types = new RegistrationTypeDAO(HibernateUtils.getLocalSession()).getRegistrationTypes();
        assertTrue("count not find any registration types in the db", types != null && !types.isEmpty());
    }


}
