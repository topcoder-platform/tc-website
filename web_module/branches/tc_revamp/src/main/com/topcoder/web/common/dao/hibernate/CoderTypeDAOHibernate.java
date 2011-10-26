package com.topcoder.web.common.dao.hibernate;


import com.topcoder.web.common.dao.CoderTypeDAO;
import com.topcoder.web.common.model.CoderType;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 28, 2006
 */
public class CoderTypeDAOHibernate extends Base implements CoderTypeDAO {

    public CoderTypeDAOHibernate() {
        super();
    }

    public CoderTypeDAOHibernate(Session session) {
        super(session);
    }

    public List getCoderTypes() {
        return findAll(CoderType.class, "status", "A");
    }

    public CoderType find(Integer id) {
        return (CoderType) find(CoderType.class, id);
    }
}
