package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.openaim.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class PrizeDescriptionValidatorTestCase extends TCHibernateTestCase {
    public void testDescNull() {
        boolean gotException = false;
        try {
            new PrizeDescriptionValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

}