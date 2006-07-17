package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.dao.hibernate.CreativeDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class CreativeDAOUtil {
    public static CreativeDAOFactory getFactory() {
        return new CreativeDAOFactoryHibernate();
    }
}
