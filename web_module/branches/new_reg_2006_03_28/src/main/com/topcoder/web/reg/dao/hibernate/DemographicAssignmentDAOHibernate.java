package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.DemographicAssignmentDAO;
import com.topcoder.web.reg.model.CoderType;
import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.reg.model.DemographicAssignment;
import org.hibernate.Query;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicAssignmentDAOHibernate extends Base implements DemographicAssignmentDAO {
    public List getQuestions(CoderType ct, Set regTypes) {
        StringBuffer query = new StringBuffer(100);
        query.append("from DemographicAssignment dass WHERE dass.status = 'A' AND dass.coderType.id = ");
        query.append(ct.getId());
        query.append(" AND dass.regType.id in (");
        for (Iterator it = regTypes.iterator(); it.hasNext();) {
            query.append(((RegistrationType) it.next()).getId()).append(",");
        }
        query.delete(query.length() - 1, query.length());
        query.append(")");
        query.append(" order by dass.sort");
        Query q = session.createQuery(query.toString());
        List ass = q.list();
        ArrayList ret =new ArrayList(ass.size());
        for (Iterator it = ass.iterator(); it.hasNext();) {
            ret.add(((DemographicAssignment)it.next()).getQuestion());
        }
        return ret;
    }
}
