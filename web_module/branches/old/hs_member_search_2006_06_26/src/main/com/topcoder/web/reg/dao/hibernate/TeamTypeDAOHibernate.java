package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.TeamTypeDAO;
import com.topcoder.web.reg.model.TeamType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamTypeDAOHibernate extends Base implements TeamTypeDAO {
    public TeamType find(Integer id) {
        return (TeamType)find(TeamType.class, id);
    }
}
