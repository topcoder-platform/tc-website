package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class CountryValidatorTestCase extends TCHibernateTestCase  {

   public void testCountryNull() {
        boolean gotException = false;
        try {
            new CountryValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testInvalidCountry() {
        assertFalse("validated an invalid country code", new CountryValidator().validate(new StringInput("93939")).isValid());
    }

    public void testValidCountry() {
        assertTrue("didn't validate a valid country code", new CountryValidator().validate(new StringInput("840")).isValid());
    }

}
