package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.dao.hibernate.StudioDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class StudioDAOUtil {
    public static StudioDAOFactory getFactory() {
        return new StudioDAOFactoryHibernate();
    }
}
