package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class MiddleNameValidatorTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(MiddleNameValidatorTestCase.class);

    public void testMiddleNameNull() {
        boolean gotException = false;
        try {
            new MiddleNameValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }
}



