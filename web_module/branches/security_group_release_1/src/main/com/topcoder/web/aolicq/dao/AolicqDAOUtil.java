package com.topcoder.web.aolicq.dao;

import com.topcoder.web.aolicq.dao.hibernate.AolicqDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class AolicqDAOUtil {
    public static AolicqDAOFactory getFactory() {
        return new AolicqDAOFactoryHibernate();
    }
}
