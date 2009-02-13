package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 17, 2006
 */
public class SchoolTypeValidatorTestCase extends TCHibernateTestCase {

    public void testValid() {
     assertTrue("found a valid school type to be invalid",
                new SchoolTypeValidator().validate(new StringInput("2")).isValid());
    }

    public void testInvalid() {
        assertFalse("found an invalid school type to be valid",
                new SchoolTypeValidator().validate(new StringInput("666")).isValid());
    }

    public void testInvalidValue() {
        assertFalse("found an invalid school type to be valid",
                new SchoolTypeValidator().validate(new StringInput("k")).isValid());
    }
}
