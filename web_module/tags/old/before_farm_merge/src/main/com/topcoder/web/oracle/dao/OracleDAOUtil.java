package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.dao.hibernate.OracleDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public class OracleDAOUtil {
    public static OracleDAOFactory getFactory() {
        return new OracleDAOFactoryHibernate();
    }

}
