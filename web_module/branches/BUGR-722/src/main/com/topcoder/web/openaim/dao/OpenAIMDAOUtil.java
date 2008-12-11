package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.dao.hibernate.OpenAIMDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class OpenAIMDAOUtil {
    public static OpenAIMDAOFactory getFactory() {
        return new OpenAIMDAOFactoryHibernate();
    }
}
