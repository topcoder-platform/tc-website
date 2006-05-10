package com.topcoder.web.reg.validation;

import junit.framework.TestCase;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class PasswordConfirmValidatorTestCase extends TestCase {


    public void testPasswordConfirmNull() {
        boolean gotException = false;
        try {
            new PasswordConfirmValidator(null).validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

}
