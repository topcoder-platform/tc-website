package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.common.validation.StringInput;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class SchoolNameValidatorTestCase extends TCHibernateTestCase {

    public void testLongName() {
        assertFalse("validated long name", new SchoolNameValidator().validate(new StringInput("lkajsdflaksfjalksjflaksjlaskfjalskfjalksfjalksjfalksjflaksjflkasjdflkasjdflkajsdflkasjdflkasjdflkajsflkajsflkjaslfkjaslkfjaslkdjflkasdjflkasdjflkasdjflksjdf")).isValid());
    }
    public void testShortName() {
        assertFalse("validated short name", new SchoolNameValidator().validate(new StringInput("")).isValid());
    }
}
