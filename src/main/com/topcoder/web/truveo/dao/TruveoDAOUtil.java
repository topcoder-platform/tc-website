package com.topcoder.web.truveo.dao;

import com.topcoder.web.truveo.dao.hibernate.TruveoDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class TruveoDAOUtil {
    public static TruveoDAOFactory getFactory() {
        return new TruveoDAOFactoryHibernate();
    }
}
