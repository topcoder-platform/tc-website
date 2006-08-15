package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.TimeZoneDAO;
import com.topcoder.web.common.model.TimeZone;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 12, 2006
 */
public class TimeZoneDAOHibernate extends Base implements TimeZoneDAO {

    public TimeZoneDAOHibernate() {
        super();
    }

    public TimeZoneDAOHibernate(Session session) {
        super(session);
    }

    public List getTimeZones() {
        return findAll(TimeZone.class);
    }

    public TimeZone find(Integer id) {
        return (TimeZone) find(TimeZone.class, id);
    }

    public TimeZone find(String s) {
        return (TimeZone) findOne(TimeZone.class, "description", s);
    }

    public TimeZone find(java.util.TimeZone t) {
        return find(t.getID());
    }

}
