package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Session;

import com.topcoder.web.common.dao.IntroEventPropertyTypeDAO;
import com.topcoder.web.common.model.IntroEventPropertyType;

/**
 * @author cucu
 */
public class IntroEventPropertyTypeDAOHibernate extends Base implements IntroEventPropertyTypeDAO {

    public IntroEventPropertyTypeDAOHibernate() {
        super();
    }

    public IntroEventPropertyTypeDAOHibernate(Session session) {
        super(session);
    }

    @SuppressWarnings("unchecked")
    public List<IntroEventPropertyType> getTypes() {
        return findAll(IntroEventPropertyType.class, "viewable", 1);
    }

}
