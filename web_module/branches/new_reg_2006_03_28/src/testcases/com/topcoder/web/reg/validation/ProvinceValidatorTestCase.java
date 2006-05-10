package com.topcoder.web.reg.validation;

import junit.framework.TestCase;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class ProvinceValidatorTestCase  extends TestCase {
    protected static final Logger log = Logger.getLogger(ProvinceValidatorTestCase.class);

    public void testProvinceNull() {
        boolean gotException = false;
        try {
            new ProvinceValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testProvinceLong() {
        assertFalse("validation did not detect long province", new ProvinceValidator().validate(new StringInput("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll")).isValid());
    }



}
