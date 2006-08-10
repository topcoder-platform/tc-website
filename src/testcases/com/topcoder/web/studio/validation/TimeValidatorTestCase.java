package com.topcoder.web.studio.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.TCHibernateTestCase;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class TimeValidatorTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(TimeValidatorTestCase.class);

    public void testTimeNull() {
        boolean gotException = false;
        try {
            new TimeValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testValid() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        assertTrue("failed to validate a valid time",
                new TimeValidator().validate(new StringInput(sdf.format(new Date()))).isValid());
    }

    public void testInValid() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        assertFalse("failed to detect an invalid time",
                new TimeValidator().validate(new StringInput("x" + sdf.format(new Date()))).isValid());
    }

}
