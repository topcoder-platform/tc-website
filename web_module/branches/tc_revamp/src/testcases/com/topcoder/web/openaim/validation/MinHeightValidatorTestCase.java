package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.openaim.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MinHeightValidatorTestCase extends TCHibernateTestCase {
    public void testBigMin() {
        assertFalse("validated a min width with a smaller max", new MinHeightValidator("100").validate(new StringInput("300")).isValid());
    }

    public void testInvalidMax() {
        assertFalse("validated an invalid min", new MinHeightValidator("300").validate(new StringInput("aaa")).isValid());
    }

    public void testInvalidMin() {
        assertFalse("validated an invalid max", new MinHeightValidator("aaa").validate(new StringInput("100")).isValid());
    }

    public void testNullMax() {
        assertTrue("didn't validate a null min", new MinHeightValidator("100").validate(new StringInput(null)).isValid());
    }

    public void testValid() {
        assertTrue("did not validate", new MinHeightValidator("400").validate(new StringInput("300")).isValid());
    }

    public void testValidNulls() {
        assertTrue("did not validate nulls", new MinHeightValidator(null).validate(new StringInput(null)).isValid());
    }
}
