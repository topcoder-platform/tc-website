package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.TimeZone;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 12, 2006
 */
public class TimeZoneDAO extends Base {

    public TimeZoneDAO() {
        super();
    }

    public TimeZoneDAO(Session session) {
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
