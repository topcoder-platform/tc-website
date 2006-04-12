package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Coder;
import com.topcoder.web.reg.model.TCAlgoRating;
import com.topcoder.web.reg.model.HSAlgoRating;
import org.hibernate.HibernateException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CoderDAO extends Base {
    public Coder find(Long id) {
        Coder ret = null;
        try {
            begin();
            ret = (Coder)session.load(Coder.class, id);
            //can't figure out how to get hibernate to handle this, so
            //i'm doing it here.
/*            ret.setTCRating((TCAlgoRating)session.load(TCAlgoRating.class,
                    new TCAlgoRating.Identifier(id, TCAlgoRating.RATING_TYPE_ID)));
            ret.setHSRating((HSAlgoRating)session.load(HSAlgoRating.class,
                    new HSAlgoRating.Identifier(id, HSAlgoRating.RATING_TYPE_ID)));*/
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }
        return ret;

    }

    public void saveOrUpdate(Coder u) {
        try {
            begin();
            session.saveOrUpdate(u);
            //can't figure out how to get hibernate to handle this, so
            //i'm doing it here.
            TCAlgoRating tcRating = u.getTCRating();
            HSAlgoRating hsRating = u.getHSRating();
            tcRating.getId().setCoderId(u.getId());
            hsRating.getId().setCoderId(u.getId());
            session.saveOrUpdate(tcRating);
            session.saveOrUpdate(hsRating);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw e;
        }

    }
}

