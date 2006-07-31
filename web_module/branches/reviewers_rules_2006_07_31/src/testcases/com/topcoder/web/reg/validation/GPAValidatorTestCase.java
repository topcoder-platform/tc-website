package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class GPAValidatorTestCase extends TCHibernateTestCase {
    public void testInvalidGPA() {
        assertFalse("validated an invalid gpa", new GPAValidator("4.00").validate(new StringInput("4.01")).isValid());
    }
    public void testEmptyGPA() {
        assertFalse("validated an empty gpa", new GPAValidator("4.00").validate(new StringInput("")).isValid());
    }
    public void testNegativeGPA() {
        assertFalse("validated a negative gpa", new GPAValidator("4.00").validate(new StringInput("-1")).isValid());
    }

    public void testValidGPA() {
        assertTrue("didn't validate a correct gpa", new GPAValidator("4.00").validate(new StringInput("3.0")).isValid());
    }
}
