package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.TCHibernateTestCase;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 69932 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class EndTimeValidatorTestCase extends TCHibernateTestCase {
    public void testEndBeforeStart() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        sdf.setLenient(false);
        Date start = new Date();
        Date end = new Date(start.getTime() - 1000 * 60 * 60);
        assertFalse("validated the case where the contest ends before it starts",
                new EndTimeValidator(sdf.format(start)).validate(new StringInput(sdf.format(end))).isValid());
    }

    public void testValidEnd() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        sdf.setLenient(false);
        Date start = new Date();
        Date end = new Date(start.getTime() + 1000 * 60 * 60);
        assertTrue("failed to validate a valid end",
                new EndTimeValidator(sdf.format(start)).validate(new StringInput(sdf.format(end))).isValid());

    }

    public void testInvalidStart() {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
        sdf.setLenient(false);
        Date start = new Date();
        Date end = new Date(start.getTime() + 1000 * 60 * 60);
        assertFalse("validated an invalid start",
                new EndTimeValidator("x" + sdf.format(start)).validate(new StringInput(sdf.format(end))).isValid());

    }
}
