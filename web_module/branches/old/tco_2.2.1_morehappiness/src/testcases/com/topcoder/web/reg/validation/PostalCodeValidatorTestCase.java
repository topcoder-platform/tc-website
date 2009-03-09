package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class PostalCodeValidatorTestCase  extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(PostalCodeValidatorTestCase.class);

    public void testPostalCodeNull() {
        boolean gotException = false;
        try {
            new PostalCodeValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testPostCodeEmpty() {
        assertTrue("validation did not allow empty postal code",
                new PostalCodeValidator().validate(new StringInput("")).isValid());
    }

    public void testPostCodeShort() {
        assertFalse("validation allowed a short postal code",
                new PostalCodeValidator().validate(new StringInput("a")).isValid());
    }

    public void testPostCodeLong() {
        assertFalse("validation allowed a long postal code",
                new PostalCodeValidator().validate(new StringInput("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).isValid());
    }

}
