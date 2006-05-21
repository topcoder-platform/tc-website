package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.model.Coder;
import com.topcoder.web.reg.model.HSAlgoRating;
import com.topcoder.web.reg.model.TCAlgoRating;
import com.topcoder.web.reg.dao.CoderDAO;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CoderDAOHibernate extends Base implements CoderDAO  {

    /**
     * Create a CoderDAO object using the default connection information.
     */
    public CoderDAOHibernate() {
        super();
    }

    public CoderDAOHibernate(Session session) {
        super(session);
    }


    public Coder find(Long id) {
        Coder ret = null;
        ret = (Coder) find(Coder.class, id);
        //can't figure out how to get hibernate to handle this, so
        //i'm doing it here.
/*
            ret.setTCRating((TCAlgoRating)session.load(TCAlgoRating.class,
                    new TCAlgoRating.Identifier(id, TCAlgoRating.RATING_TYPE_ID)));
            ret.setHSRating((HSAlgoRating)session.load(HSAlgoRating.class,
                    new HSAlgoRating.Identifier(id, HSAlgoRating.RATING_TYPE_ID)));
*/
        return ret;

    }

    public void saveOrUpdate(Coder u) {
        boolean addRatings = u.getId() == null;
        session.saveOrUpdate(u);
        //can't figure out how to get hibernate to handle this, so
        //i'm doing it here.
        if (addRatings) {
            //todo add logic so that only the appropriate rating records get created
            TCAlgoRating tcRating = new TCAlgoRating(u);
            tcRating.setRating(new Integer(0));
            HSAlgoRating hsRating = new HSAlgoRating(u);
            hsRating.setRating(new Integer(0));
            session.save(tcRating);
            session.save(hsRating);
        }


    }
}

