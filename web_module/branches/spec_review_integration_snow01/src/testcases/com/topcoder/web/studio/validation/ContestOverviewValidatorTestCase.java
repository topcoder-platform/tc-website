package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class ContestOverviewValidatorTestCase extends TCHibernateTestCase {
    public void testOverviewNull() {
        boolean gotException = false;
        try {
            new ContestOverviewValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

}