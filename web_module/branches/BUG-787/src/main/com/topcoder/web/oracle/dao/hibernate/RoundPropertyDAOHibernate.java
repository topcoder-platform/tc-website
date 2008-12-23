package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.model.RoundProperty;
import com.topcoder.web.oracle.dao.RoundPropertyDAO;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class RoundPropertyDAOHibernate extends Base implements RoundPropertyDAO {
    public RoundProperty find(Integer id) {
        return (RoundProperty) super.find(RoundProperty.class, id);
    }

    public List getProperties() {
        return findAll(RoundProperty.class);
    }
}
