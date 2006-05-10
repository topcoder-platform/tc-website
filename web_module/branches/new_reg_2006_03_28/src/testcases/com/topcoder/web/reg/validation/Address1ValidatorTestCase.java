package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class Address1ValidatorTestCase extends TestCase {
    protected static final Logger log = Logger.getLogger(Address1ValidatorTestCase.class);

    public void testAddress1Null() {
        boolean gotException = false;
        try {
            new Address1Validator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testLongAddress() {
        
    }



}
