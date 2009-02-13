package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.SecurityGroupDAO;
import com.topcoder.web.reg.model.RegistrationType;
import org.hibernate.Query;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class SecurityGroupDAOHibernate extends Base implements SecurityGroupDAO {
    public List getSecurityGroups(Set registrationTypes) {
        StringBuffer query = new StringBuffer(100);
        query.append("SELECT rt.securityGroup FROM RegistrationType rt WHERE rt.id in (");
        for (Iterator it = registrationTypes.iterator(); it.hasNext();) {
            query.append(((RegistrationType) it.next()).getId()).append(",");
        }
        query.delete(query.length() - 1, query.length());
        query.append(")");
        Query q = session.createQuery(query.toString());

        return q.list();

    }
}
