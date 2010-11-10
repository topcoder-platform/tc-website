package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.TCHibernateTestCase;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class StartTimeValidatorTestCase extends TCHibernateTestCase {
    public void testEndBeforeStart() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        sdf.setLenient(false);
        Date start = new Date();
        Date end = new Date(start.getTime() - 1000 * 60 * 60);
        assertFalse("validated the case where the contest ends before it starts",
                new StartTimeValidator(sdf.format(end)).validate(new StringInput(sdf.format(start))).isValid());
    }

    public void testValidEnd() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        sdf.setLenient(false);
        Date start = new Date();
        Date end = new Date(start.getTime() + 1000 * 60 * 60);
        assertTrue("failed to validate a valid start",
                new StartTimeValidator(sdf.format(end)).validate(new StringInput(sdf.format(start))).isValid());

    }

    public void testInvalidStart() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        sdf.setLenient(false);
        Date start = new Date();
        Date end = new Date(start.getTime() + 1000 * 60 * 60);
        assertFalse("validated an invalid end",
                new StartTimeValidator("x" + sdf.format(end)).validate(new StringInput(sdf.format(start))).isValid());

    }
}
