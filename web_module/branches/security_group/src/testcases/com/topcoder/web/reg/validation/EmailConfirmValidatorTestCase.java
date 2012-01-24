package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class EmailConfirmValidatorTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(EmailConfirmValidatorTestCase.class);

    public void testEmailConfirmNull() {
        boolean gotException = false;
        try {
            new EmailConfirmValidator(null).validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }




}