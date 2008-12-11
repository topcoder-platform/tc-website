package com.topcoder.web.tc.dao.hibernate;

import com.topcoder.web.tc.dao.NominationDAO;
import com.topcoder.web.tc.dao.TCDAOFactory;

/**
 * @author dok
 * @version $Revision: 63542 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 27, 2007
 */
public class TCDAOFactoryHibernate implements TCDAOFactory {
    public NominationDAO getNominationDAO() {
        return new NominationDAOHibernate();
    }
}
