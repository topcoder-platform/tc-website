package com.topcoder.web.tc.dao;

import com.topcoder.web.tc.dao.hibernate.TCDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public class TCDAOUtil {
    public static TCDAOFactory getFactory() {
        return new TCDAOFactoryHibernate();
    }

}
