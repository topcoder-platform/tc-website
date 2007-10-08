package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.SecurityGroupDAO;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import org.hibernate.Query;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class SecurityGroupDAOHibernate extends Base implements SecurityGroupDAO {
    public List<SecurityGroup> getSecurityGroups(Set registrationTypes) {
        StringBuffer query = new StringBuffer(100);
        query.append("SELECT rt.securityGroup FROM RegistrationType rt WHERE rt.id in (");
        for (Object registrationType : registrationTypes) {
            query.append(((RegistrationType) registrationType).getId()).append(",");
        }
        query.delete(query.length() - 1, query.length());
        query.append(")");
        Query q = session.createQuery(query.toString());

        return q.list();

    }

    public boolean hasInactiveHSGroup(User u) {
        StringBuffer query = new StringBuffer(100);
        query.append("FROM UserGroup ug ");
        query.append(" WHERE ug.securityGroup.registrationTypes.id = ? AND ug.securityStatusId = ? AND ug.user.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, RegistrationType.HIGH_SCHOOL_ID);
        q.setInteger(1, SecurityGroup.INACTIVE);
        q.setLong(2, u.getId());
        return !q.list().isEmpty();
    }

    public boolean hasGroup(long userId, long groupId) {
        StringBuffer query = new StringBuffer(100);
        query.append("FROM UserGroup ug ");
        query.append(" WHERE ug.securityGroup.id = ? ");
        query.append("AND ug.securityStatusId = ? AND ug.user.id = ?");
        Query q = session.createQuery(query.toString());
        q.setLong(0, groupId);
        q.setInteger(1, SecurityGroup.ACTIVE);
        q.setLong(2, userId);
        return !q.list().isEmpty();
    }

    public boolean hasGroup(User u, SecurityGroup g) {
        return hasGroup(u.getId(), g.getId());
    }
}
