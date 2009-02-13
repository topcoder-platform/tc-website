package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class GPAScaleValidatorTestCase extends TCHibernateTestCase  {
    public void testInvalid() {
        assertFalse("validated an invalid gpa scale", new GPAScaleValidator().validate(new StringInput("6.00")).isValid());
    }

    public void testValid() {
        assertTrue("marked a valid scale invalid", new GPAScaleValidator().validate(
                new StringInput((String)Constants.GPA_SCALES.get(0))).isValid());
    }
}
