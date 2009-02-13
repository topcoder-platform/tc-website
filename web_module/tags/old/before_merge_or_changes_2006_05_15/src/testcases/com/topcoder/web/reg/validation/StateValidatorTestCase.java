package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Country;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class StateValidatorTestCase extends TCHibernateTestCase  {

    private Country us;
    private Country india;
    public void setUp() {
        super.setUp();
        us = Util.getFactory().getCountryDAO().getUS();
        india = Util.getFactory().getCountryDAO().find("356");
    }

   public void testStateNull() {
        boolean gotException = false;
        try {
            new StateValidator(us).validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testInvalidState() {
        assertFalse("validated an invalid state code", new StateValidator(us).validate(new StringInput("JJ")).isValid());
    }

    public void testValidState() {
        assertTrue("didn't validate a valid state code", new StateValidator(us).validate(new StringInput("CO")).isValid());
    }

    public void testNonUSInValidState() {
        assertTrue("didn't validate a valid state code", new StateValidator(india).validate(new StringInput("JJ")).isValid());
    }

    public void testNonUSValidState() {
        assertTrue("didn't validate a valid state code", new StateValidator(india).validate(new StringInput("CO")).isValid());
    }

}

