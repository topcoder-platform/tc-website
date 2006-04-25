package com.topcoder.web.reg.dao;

import junit.framework.TestCase;
import com.topcoder.web.reg.model.RegistrationType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class RegistrationTypeDAOTestCase extends TestCase {

    public void testFind() {
        RegistrationType rt = new RegistrationTypeDAO().find(new Long(1));
        assertTrue("could not find the registration type for competitions", rt!=null);
    }

    public void testGetRegistrationTypes() {
        List types = new RegistrationTypeDAO().getRegistrationTypes();
        assertTrue("count not find any registration types in the db", types!=null&&!types.isEmpty());
    }


}
