package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class SchoolIdValidatorTestCase extends TCHibernateTestCase {
    public void testInvalidId() {
        assertFalse("validated invalid id -666", new SchoolIdValidator().validate(new StringInput("-666")).isValid());
    }

    public void testValidId() {
        assertTrue("did not validate mit", new SchoolIdValidator().validate(new StringInput("755")).isValid());
    }

}
