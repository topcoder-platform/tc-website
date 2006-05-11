package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Notification;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class NotificationDAO extends Base {

    public NotificationDAO() {
        super();
    }

    public NotificationDAO(Session session) {
        super(session);
    }

    public List getNotifications() {
        return findAll(Notification.class, "status", "A");
    }

    public Notification find(Long id) {
        return (Notification) find(Notification.class, id);
    }

    /**
     * Get the nto
     * @param s
     * @return
     */
/*
    public List getNotifications(final Set s) {
        List ret = getNotifications();
        Notification n;
        for(Iterator it=ret.iterator(); it.hasNext();) {
            n = (Notification)it.next();
            if (!s.contains(n.)) {
                it.remove();
            }
        }
        return ret;
    }
*/

}
