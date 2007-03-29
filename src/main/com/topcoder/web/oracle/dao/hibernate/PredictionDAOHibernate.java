package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.dao.PredictionDAO;
import com.topcoder.web.oracle.model.Prediction;
import com.topcoder.web.oracle.model.Round;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 23, 2007
 */
public class PredictionDAOHibernate extends Base implements PredictionDAO {

    public Prediction find(Integer id) {
        return (Prediction) super.find(Prediction.class, id);
    }

    public void saveOrUpdate(Prediction prediction) {
        super.saveOrUpdate(prediction);
    }

    public boolean alreadCompeted(User u, Round r) {
        return alreadyCompeted(u.getId(), r.getId());
    }

    public boolean alreadyCompeted(Long userId, Integer roundId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" from com.topcoder.web.oracle.model.Prediction p");
        query.append(" where p.round.id = ?");
        query.append(  " and p.user.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roundId);
        q.setLong(1, userId);
        List l = q.list();
        return !l.isEmpty();
    }
}
