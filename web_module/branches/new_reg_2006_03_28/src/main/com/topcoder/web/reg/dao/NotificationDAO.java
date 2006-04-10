package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Notification;
import org.hibernate.Query;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class NotificationDAO extends Base {

    public Set getNotifications() {
        Query q = session.createQuery("from Notification where status = 'A'");
        Set ret = new TreeSet();
        for (Iterator it = q.iterate(); it.hasNext();) {
            ret.add(it.next());
        }
        return ret;
    }

    public Notification getNotification(Long id) {
        return (Notification)find(Notification.class, id);
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
