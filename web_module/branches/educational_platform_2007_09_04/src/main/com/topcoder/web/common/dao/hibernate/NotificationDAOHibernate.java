package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.NotificationDAO;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.RegistrationType;
import org.hibernate.Query;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class NotificationDAOHibernate extends GenericBase<Notification, Integer> implements NotificationDAO {


    public List<Notification> getNotifications(Set<RegistrationType> regTypes) {
        List ret;
        if (regTypes.isEmpty()) {
            ret = Collections.EMPTY_LIST;
        } else {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT distinct n.type.sort, n FROM Notification n join n.registrationTypes r WHERE ");
            query.append("n.status = 'A' AND r.id in (");
            for (RegistrationType regType : regTypes) {
                query.append(regType.getId()).append(",");
            }
            query.delete(query.length() - 1, query.length());
            query.append(")");
            query.append(" order by n.type.sort, n.sort");
            Query q = getSession().createQuery(query.toString());
            List tmp = q.list();

            // this is informix fault, forcing to add the sort columns to the select clause.
            // so we need to take it out before returning the list
            ret = new ArrayList();
            for (Object[] obj : (List<Object[]>) tmp) {
                ret.add(obj[1]);
            }
        }
        return ret;
    }


}
