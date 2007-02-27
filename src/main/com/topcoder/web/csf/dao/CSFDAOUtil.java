package com.topcoder.web.csf.dao;

import com.topcoder.web.csf.dao.hibernate.CSFDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class CSFDAOUtil {
    public static CSFDAOFactory getFactory() {
        return new CSFDAOFactoryHibernate();
    }
}
