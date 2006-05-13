package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class Address3ValidatorTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(Address3ValidatorTestCase.class);

    public void testAddress3Null() {
        boolean gotException = false;
        try {
            new Address3Validator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }




}
