package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.School;

import java.util.List;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class SchoolDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        School mit = Util.getFactory().getSchoolDAO().find(new Long(775));
        assertTrue("could not find MIT in the database", mit.getName().equals("Massachusetts Institute of Technology"));
    }

    public void testSearch() {
        List l = Util.getFactory().getSchoolDAO().searchByName("mass%", 20);
        Object[] o;
        School s;
        boolean ok = true;
        for (Iterator it = l.iterator(); it.hasNext();) {
            o = (Object[])it.next();
            s = (School)o[1];
            Integer count = (Integer)o[0];
            if (!s.getName().toLowerCase().startsWith("mass")) {
                ok = false;
            }
        }
        assertTrue("could not find any schools like mass%", true);
    }

    public void testCreateCoderLoaded() {
        School mit = Util.getFactory().getSchoolDAO().find(new Long(1719));
        assertFalse("coder not loaded", mit.getCoder()==null);
    }


}
