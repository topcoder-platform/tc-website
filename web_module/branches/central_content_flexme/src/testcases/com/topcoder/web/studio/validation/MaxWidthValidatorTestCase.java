package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MaxWidthValidatorTestCase extends TCHibernateTestCase {

    public void testBigMin() {
        assertFalse("validated a max width with a larger min", new MaxWidthValidator("300").validate(new StringInput("100")).isValid());
    }

    public void testInvalidMax() {
        assertFalse("validated an invalid max", new MaxWidthValidator("300").validate(new StringInput("aaa")).isValid());
    }

    public void testInvalidMin() {
        assertFalse("validated an invalid min", new MaxWidthValidator("aaa").validate(new StringInput("100")).isValid());
    }

    public void testNullMax() {
        assertTrue("didn't validate a null max", new MaxWidthValidator("10").validate(new StringInput(null)).isValid());
    }

    public void testValid() {
        assertTrue("did not validate", new MaxWidthValidator("300").validate(new StringInput("400")).isValid());
    }

    public void testValidNulls() {
        assertTrue("did not validate nulls", new MaxWidthValidator(null).validate(new StringInput(null)).isValid());
    }
}
