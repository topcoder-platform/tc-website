package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class MaxSubmissionsValidatorTestCase  extends TCHibernateTestCase {

    public void testNegative() {
        assertFalse("validated a negative number", new MaxSubmissionsValidator().validate(new StringInput("-33")).isValid());
    }

    public void testZero() {
        assertFalse("validated zero", new MaxSubmissionsValidator().validate(new StringInput("0")).isValid());
    }

    public void testEmpty() {
        assertTrue("didn't validate empty string", new MaxSubmissionsValidator().validate(new StringInput("")).isValid());
    }

    public void testNull() {
        assertTrue("didn't validate null", new MaxSubmissionsValidator().validate(new StringInput(null)).isValid());
    }

    public void testBigNumber() {
        assertFalse("validated a number that was too big", new MaxSubmissionsValidator().validate(new StringInput("32121")).isValid());
    }

    public void testValid() {
        assertTrue("did not validate a valid number", new MaxSubmissionsValidator().validate(new StringInput("666")).isValid());
    }

}
