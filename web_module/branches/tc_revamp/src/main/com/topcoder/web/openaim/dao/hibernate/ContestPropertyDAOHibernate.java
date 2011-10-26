package com.topcoder.web.openaim.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.openaim.dao.ContestPropertyDAO;
import com.topcoder.web.openaim.model.ContestProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class ContestPropertyDAOHibernate extends Base implements ContestPropertyDAO {
    public ContestProperty find(Integer id) {
        return (ContestProperty) super.find(ContestProperty.class, id);
    }

    public List getProperties() {
        return findAll(ContestProperty.class);
    }
}
