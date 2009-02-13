package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.DemographicAssignmentDAO;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.reg.model.*;
import org.hibernate.Query;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicAssignmentDAOHibernate extends Base implements DemographicAssignmentDAO {
    public List getAssignments(CoderType ct, State s, Set regTypes) {
        StringBuffer query = new StringBuffer(100);
        query.append("FROM DemographicAssignment dass WHERE dass.status = 'A' AND dass.coderType.id = ");
        query.append(ct.getId());
        query.append(" AND dass.regType.id in (");
        for (Iterator it = regTypes.iterator(); it.hasNext();) {
            query.append(((RegistrationType) it.next()).getId()).append(",");
        }
        query.delete(query.length() - 1, query.length());
        query.append(")");
        query.append(" order by dass.sort");
        Query q = session.createQuery(query.toString());
        List ret = q.list();

        if (s!=null&&s.isOptionalDemographics()) {
            DemographicAssignment da;
            for (Iterator it = ret.iterator(); it.hasNext();) {
                da = (DemographicAssignment)it.next();
                if (!containsDecline(da.getQuestion())) {
                    da.getQuestion().addAnswer(Util.getFactory().getDemographicAnswerDAO().findDecline(da.getQuestion()));
                }
            }
        }

        DemographicAssignment da;
        for (int i=0; i<ret.size(); i++) {
            da = (DemographicAssignment)ret.get(i);
            for (int j=i+1; j<ret.size(); j++) {
                if (((DemographicAssignment)ret.get(j)).getQuestion().equals(da.getQuestion())) {
                    ret.remove(j);
                }
            }
        }

        return ret;
    }

    private boolean containsDecline(DemographicQuestion q) {
        boolean found = false;
        for (Iterator it = q.getAnswers().iterator(); it.hasNext()&&!found;) {
            found = DemographicAnswer.DECLINE.equals(((DemographicAnswer)it.next()).getText());
        }
        return found;
    }


}
