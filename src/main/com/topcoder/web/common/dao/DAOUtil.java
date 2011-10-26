package com.topcoder.web.common.dao;

import com.topcoder.web.common.dao.hibernate.DAOFactoryHibernate;
import com.topcoder.web.common.dao.querytool.DAOFactoryQueryTool;

/**
 * @author dok
 * @version $Revision: 64563 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DAOUtil {
    public static boolean useQueryToolFactory = true;

    public static DAOFactory getFactory() {
        return new DAOFactoryHibernate();
    }

    public static DAOFactory getQueryToolFactory() {
        if (useQueryToolFactory) {
            return new DAOFactoryQueryTool();
        } else {
            return new DAOFactoryHibernate();
        }
    }
}
