package com.topcoder.web.common.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.CoderDAO;
import com.topcoder.web.common.model.Coder;

/**
 * @author dok
 * @version $Revision: 66901 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CoderDAOHibernate extends Base implements CoderDAO {

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
        return ret;

    }

    public void saveOrUpdate(Coder u) {
        session.saveOrUpdate(u);
    }
    
}

