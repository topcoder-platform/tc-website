package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.TimeZone;
import junit.framework.TestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class TimeZoneDAOTestCase extends TestCase {


    public void testGetTimeZones() {
        List zones = new TimeZoneDAO().getTimeZones();
        assertTrue("could not find any time zones in the db", !zones.isEmpty());
    }

    public void testFind1() {
        java.util.TimeZone here = java.util.TimeZone.getDefault();
        TimeZone t = new TimeZoneDAO().find(here);
        assertTrue("could not find the timezone " + here.getID() + " in the db", t!=null&&t.getDescription().equals(here.getID()));
    }

    public void testFind2() {
        java.util.TimeZone here = java.util.TimeZone.getDefault();
        TimeZone t = new TimeZoneDAO().find(here.getID());
        assertTrue("could not find the timezone " + here.getID() + " in the db", t!=null&&t.getDescription().equals(here.getID()));

    }

    public void testFind3() {
        TimeZone t = new TimeZoneDAO().find(new Integer(90));
        assertTrue("could not find the timezone 90 in the db", t!=null&&t.getDescription().equals("America/Denver"));
    }


}
