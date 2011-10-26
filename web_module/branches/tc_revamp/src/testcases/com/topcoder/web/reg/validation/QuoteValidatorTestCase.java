package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class QuoteValidatorTestCase  extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(QuoteValidatorTestCase.class);

    public void testQuoteNull() {
        boolean gotException = false;
        try {
            new QuoteValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testQuoteLong() {
        assertFalse("validation did not detect long quote", new QuoteValidator().validate(new StringInput("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll")).isValid());
    }



}
