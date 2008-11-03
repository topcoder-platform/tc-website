package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.RegistrationType;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface NotificationDAO extends GenericDAO<Notification, Integer> {
    List<Notification> getNotifications(Set<RegistrationType> regTypes);

}
