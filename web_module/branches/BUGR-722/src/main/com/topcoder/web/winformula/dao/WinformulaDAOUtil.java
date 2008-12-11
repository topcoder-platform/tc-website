package com.topcoder.web.winformula.dao;

import com.topcoder.web.winformula.dao.hibernate.WinformulaDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class WinformulaDAOUtil {
    public static WinformulaDAOFactory getFactory() {
        return new WinformulaDAOFactoryHibernate();
    }
}
