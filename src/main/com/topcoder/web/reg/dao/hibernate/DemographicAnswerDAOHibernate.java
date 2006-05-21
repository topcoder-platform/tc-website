package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.DemographicAnswerDAO;
import com.topcoder.web.reg.model.DemographicAnswer;
import com.topcoder.web.reg.model.DemographicQuestion;
import org.hibernate.Query;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class DemographicAnswerDAOHibernate extends Base implements DemographicAnswerDAO {

    public DemographicAnswer find(Long id) {
        return (DemographicAnswer) find(DemographicAnswer.class, id);
    }

    public DemographicAnswer findDecline(DemographicQuestion dq) {
        StringBuffer query = new StringBuffer(100);
        query.append("from DemographicAnswer da WHERE da.text = ? AND da.question.id = ?");
        Query q = session.createQuery(query.toString());
        q.setString(0, DemographicAnswer.DECLINE);
        q.setLong(1, dq.getId().longValue());
        return (DemographicAnswer) q.uniqueResult();


    }

    public DemographicAnswer findFreeForm(DemographicQuestion dq) {
        StringBuffer query = new StringBuffer(100);
        query.append("from DemographicAnswer da WHERE da.text = ? AND da.question.id = ?");
        Query q = session.createQuery(query.toString());
        q.setString(0, DemographicAnswer.FREE_FORM);
        q.setLong(1, dq.getId().longValue());
        return (DemographicAnswer) q.uniqueResult();
    }
}
