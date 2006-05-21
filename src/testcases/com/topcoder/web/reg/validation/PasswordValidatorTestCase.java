package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class PasswordValidatorTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(PasswordValidatorTestCase.class);

    public void testPasswordNull() {
        boolean gotException = false;
        try {
            new PasswordValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertFalse("got exception", gotException);
    }

    public void testIllegalChars() {
        assertFalse("validation didn't detect illegal chars",
                new PasswordValidator().validate(new StringInput("****ad33")).isValid());
    }

    public void testShort() {
        assertFalse("validation didn't detect a password that was too short",
                new PasswordValidator().validate(new StringInput("ad33")).isValid());
    }

    public void testLong() {
        assertFalse("validation didn't detect a password that was too long",
                new PasswordValidator().validate(new StringInput("ad33d999d9d9d9d93938938dd")).isValid());
    }

}