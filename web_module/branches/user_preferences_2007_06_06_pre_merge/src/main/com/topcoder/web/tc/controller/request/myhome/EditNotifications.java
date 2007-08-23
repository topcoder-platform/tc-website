package com.topcoder.web.tc.controller.request.myhome;

import java.util.List;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * @author pulky
 * @version $Revision$Date: 
 *          Create Date: Jun 08, 2007
 */
public class EditNotifications extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User u  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        List<Notification> notifications = (List<Notification>)DAOUtil.getFactory().getNotificationDAO().getNotifications(u.getRegistrationTypes());
        Set<Notification> userNotifications = (Set<Notification>) u.getNotifications();

        for (Notification n : notifications) {
            if (userNotifications.contains(n)) {
                setDefault("notif_" + n.getId(), "true");
            }
        }

        getRequest().setAttribute("notifications", notifications);

        if ("POST".equals(getRequest().getMethod())) {
            for (Notification n : notifications) {
                String notif = StringUtils.checkNull(getRequest().getParameter("notif_" + n.getId()));
                log.debug("getting param: notif_" + n.getId() + ": " + notif);

                if (userNotifications.contains(n) && !notif.equals("on")) {
                    u.removeNotification(n);
                } else if (!userNotifications.contains(n) && notif.equals("on")) {
                    u.addNotification(n);
                }
            }
            DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
            getRequest().setAttribute("regUser", u);

            setNextPage("/my_home/index.jsp");
//            setNextPage("/tc?" + Constants.MODULE_KEY + "=MyHome");
        } else {
            setNextPage("/my_home/emailNotification.jsp");
        }
        setIsNextPageInContext(true);
    }
}
