package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.SchoolTypeDAO;
import com.topcoder.web.common.model.SchoolType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 */
public class SchoolTypeDAOHibernate extends Base implements SchoolTypeDAO {
    public List getSchoolTypes() {
        return findAll(SchoolType.class);
    }

    public SchoolType find(Integer id) {
        return (SchoolType) find(SchoolType.class, id);
    }
}
