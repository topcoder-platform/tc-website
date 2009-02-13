package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class RegistrationTypeDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        RegistrationType rt = DAOUtil.getFactory().getRegistrationTypeDAO().find(new Integer(1));
        assertTrue("could not find the registration type for competitions", rt != null);
    }

    public void testGetRegistrationTypes() {
        List types = DAOUtil.getFactory().getRegistrationTypeDAO().getRegistrationTypes();
        assertTrue("count not find any registration types in the db", types != null && !types.isEmpty());
    }

    public void testNotifications() {
        Set rt = DAOUtil.getFactory().getRegistrationTypeDAO().find(new Integer(1)).getNotifications();
        assertTrue("count not find any notificatinos", rt != null && !rt.isEmpty());
    }

    public void testPreferences() {
        Set rt = DAOUtil.getFactory().getRegistrationTypeDAO().find(new Integer(1)).getPreferences();
        assertTrue("count not find any preferences", rt != null && !rt.isEmpty());
    }

}
