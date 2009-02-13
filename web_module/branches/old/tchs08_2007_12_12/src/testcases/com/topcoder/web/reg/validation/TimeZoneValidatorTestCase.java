package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class TimeZoneValidatorTestCase extends TCHibernateTestCase {

    public void testValid() {
        assertTrue("found a valid coder type to be invalid",
                new TimeZoneValidator().validate(new StringInput("40")).isValid());
    }

    public void testInvalid() {
        assertFalse("found an invalid coder type to be valid",
                new TimeZoneValidator().validate(new StringInput("666")).isValid());
    }



}
