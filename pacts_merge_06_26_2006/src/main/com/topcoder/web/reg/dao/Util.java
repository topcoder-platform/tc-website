package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.dao.hibernate.DAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class Util {
    public static DAOFactory getFactory() {
        return new DAOFactoryHibernate();
    }
}
