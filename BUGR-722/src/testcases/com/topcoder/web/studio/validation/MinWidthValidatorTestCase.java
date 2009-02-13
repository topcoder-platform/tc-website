package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 69932 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MinWidthValidatorTestCase extends TCHibernateTestCase {

    public void testBigMin() {
        assertFalse("validated a min height with a smaller max", new MinWidthValidator("100").validate(new StringInput("300")).isValid());
    }

    public void testInvalidMax() {
        assertFalse("validated an invalid min", new MinWidthValidator("300").validate(new StringInput("aaa")).isValid());
    }

    public void testInvalidMin() {
        assertFalse("validated an invalid max", new MinWidthValidator("aaa").validate(new StringInput("100")).isValid());
    }

    public void testNullMax() {
        assertTrue("didn't validate a null min", new MinWidthValidator("100").validate(new StringInput(null)).isValid());
    }

    public void testValid() {
        assertTrue("did not validate", new MinWidthValidator("400").validate(new StringInput("300")).isValid());
    }

    public void testValidNulls() {
        assertTrue("did not validate nulls", new MinWidthValidator(null).validate(new StringInput(null)).isValid());
    }
}
