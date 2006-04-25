package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.RegistrationType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 13, 2006
 */
public class RegistrationTypeDAO extends Base {
    public List getRegistrationTypes() {
        return findAll(RegistrationType.class, "active", new Integer(1));
    }

    public RegistrationType find(Long id) {
        return (RegistrationType)find(RegistrationType.class, id);
    }

/*    public Set getRegistrationTypes(User u) {
        Set ret = new HashSet();
        try {
            begin();
            StringBuffer query = new StringBuffer(100);
            query.append("from RegistrationType rt join user_group_xref x ");
            query.append("where x.groupId = rt.securityGroupId ");
            query.append( " and x.userId = ?");
            Query q = session.createQuery(query.toString());
            q.setLong(0, u.getId().longValue());
            ret.addAll(q.list());
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }
        return ret;
    }*/
}
