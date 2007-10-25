package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Notification;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class NotificationDAOTestCase extends TCHibernateTestCase {


    public void testGetNotificiations() {
        List l = DAOUtil.getFactory().getNotificationDAO().findAll();
        assertTrue("we found no notifications", l != null && !l.isEmpty());
    }

    public void testGetParticularNotificiations() {
        List l = DAOUtil.getFactory().getNotificationDAO().getNotifications(new HashSet(DAOUtil.getFactory().getRegistrationTypeDAO().getRegistrationTypes()));
        Set s = new HashSet();
        for (Iterator it = l.iterator(); it.hasNext();) {
            Object o = it.next();
            assertFalse("duplicate notifications in return", s.contains(o));
            s.add(o);
        }
    }

    public void testFind() {
        Notification n = DAOUtil.getFactory().getNotificationDAO().find(new Integer(1));
        assertFalse("we did not find notification 1", n == null);
    }

    public void testRegTypes() {
        Notification n = DAOUtil.getFactory().getNotificationDAO().find(new Integer(1));
        assertTrue("we found no reg types", n.getRegistrationTypes() != null && !n.getRegistrationTypes().isEmpty());
    }

    public void testGetByRegTypes() {
        Set s = new HashSet();
        s.addAll(DAOUtil.getFactory().getRegistrationTypeDAO().getRegistrationTypes());
        List l = DAOUtil.getFactory().getNotificationDAO().getNotifications(s);
        assertTrue("we found no notifications", l != null && !l.isEmpty());
    }

}
