package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.DemographicAssignmentDAO;
import com.topcoder.web.common.model.*;
import org.hibernate.Query;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
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

        if (s != null && s.isOptionalDemographics()) {
            DemographicAssignment da;
            for (Iterator it = ret.iterator(); it.hasNext();) {
                da = (DemographicAssignment) it.next();
                if ((da.getQuestion().isMultipleSelect() || da.getQuestion().isSingleSelect()) && !containsDecline(da.getQuestion()))
                {
                    DemographicAnswer dan = DAOUtil.getFactory().getDemographicAnswerDAO().findDecline(da.getQuestion());
                    da.getQuestion().addAnswer(dan);
                }
            }
        }

        DemographicAssignment da;
        for (int i = 0; i < ret.size(); i++) {
            da = (DemographicAssignment) ret.get(i);
            for (int j = i + 1; j < ret.size(); j++) {
                if (((DemographicAssignment) ret.get(j)).getQuestion().equals(da.getQuestion())) {
                    //remove duplicate questions
                    ret.remove(j);
                    j--;
                }
            }
        }

        RegistrationType hs = DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType();
        HashSet h = new HashSet();
        h.add(DemographicQuestion.COLLEGE_MAJOR);
        h.add(DemographicQuestion.COLLEGE_MAJOR_DESC);
        h.add(DemographicQuestion.DEGREE_PROGRAM);

        if (regTypes.contains(hs)) {
            for (int i = 0; i < ret.size(); i++) {
                da = (DemographicAssignment) ret.get(i);
                if (h.contains(da.getQuestion().getId())) {
                    //if they're registering for high school, remove college specific questions
                    ret.remove(i);
                    i--;
                }
            }
        }


        return ret;
    }

    public List getAssignments(RegistrationType regType) {
        StringBuffer query = new StringBuffer(100);
        query.append("FROM DemographicAssignment dass WHERE dass.status = 'A'");
        query.append(" AND dass.regType.id = ?");
        query.append(" order by dass.sort");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, regType.getId().intValue());
        return q.list();
    }

    private boolean containsDecline(DemographicQuestion q) {
        boolean found = false;
        for (Iterator it = q.getAnswers().iterator(); it.hasNext() && !found;) {
            found = DemographicAnswer.DECLINE.equals(((DemographicAnswer) it.next()).getText());
        }
        return found;
    }


}
