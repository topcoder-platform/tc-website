package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.voting.dao.hibernate.VotingDAOFactoryHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 29, 2007
 */
public class VotingDAOUtil {
    public static VotingDAOFactory getFactory() {
        return new VotingDAOFactoryHibernate();
    }
}
