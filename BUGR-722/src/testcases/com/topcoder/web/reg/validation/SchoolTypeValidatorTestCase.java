package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.HashSet;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 17, 2006
 */
public class SchoolTypeValidatorTestCase extends TCHibernateTestCase {

    public void testValid() {
        HashSet set = new HashSet();
        set.add(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType());
        assertTrue("found a valid school type to be invalid",
                new SchoolTypeValidator(set).validate(new StringInput("2")).isValid());
    }

    public void testInvalid() {
        HashSet set = new HashSet();
        set.add(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType());
        assertFalse("found an invalid school type to be valid",
                new SchoolTypeValidator(set).validate(new StringInput("666")).isValid());
    }

    public void testInvalidValue() {
        HashSet set = new HashSet();
        set.add(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType());
        assertFalse("found an invalid school type to be valid",
                new SchoolTypeValidator(set).validate(new StringInput("k")).isValid());
    }

    public void testInvalidChange() {
        HashSet set = new HashSet();
        set.add(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType());
        assertFalse("found a valid school type to be invalid",
                new SchoolTypeValidator(set).validate(new StringInput("1")).isValid());
    }
}