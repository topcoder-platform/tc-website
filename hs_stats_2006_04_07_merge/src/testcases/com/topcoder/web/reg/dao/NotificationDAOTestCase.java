package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Notification;

import java.util.List;
import java.util.Set;
import java.util.HashSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class NotificationDAOTestCase extends TCHibernateTestCase {


    public void testGetNotificiations() {
        List l = Util.getFactory().getNotificationDAO().getNotifications();
        assertTrue("we found no notifications", l!=null&&!l.isEmpty());
    }

    public void testFind() {
        Notification n  = Util.getFactory().getNotificationDAO().find(new Integer(1));
        assertFalse("we did not find notification 1", n==null);
    }

    public void testRegTypes() {
        Notification n = Util.getFactory().getNotificationDAO().find(new Integer(1));
        assertTrue("we found no reg types", n.getRegistrationTypes()!=null&&!n.getRegistrationTypes().isEmpty());
    }

    public void testGetByRegTypes() {
        Set s = new HashSet();
        s.addAll(Util.getFactory().getRegistrationTypeDAO().getRegistrationTypes());
        List l = Util.getFactory().getNotificationDAO().getNotifications(s);
        assertTrue("we found no notifications", l!=null&&!l.isEmpty());
    }

}
