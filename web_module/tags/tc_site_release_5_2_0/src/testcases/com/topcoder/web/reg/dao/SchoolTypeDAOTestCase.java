package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.SchoolType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 */
public class SchoolTypeDAOTestCase extends TCHibernateTestCase {
    public void testGetTypes() {
        List l = Util.getFactory().getSchoolTypeDAO().getSchoolTypes();
        assertFalse("couldn't find the school types in the db", l==null||l.isEmpty());
    }
    public void testGetHighSchol() {
        assertFalse("couldn't find high school type", Util.getFactory().getSchoolTypeDAO().find(SchoolType.HIGH_SCHOOL)==null);
    }
    public void testGetUniversity() {
        assertFalse("couldn't find college type", Util.getFactory().getSchoolTypeDAO().find(SchoolType.COLLEGE)==null);
    }

}
