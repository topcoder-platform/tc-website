package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.common.validation.ListInput;

import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class ResumeValidatorTestCase extends TCHibernateTestCase {
    public void testEmpty() {
        ArrayList l = new ArrayList();
        l.add(new byte[0]);
        l.add("text/plain");
        l.add("filename");

        assertFalse("validated an empty file", new ResumeValidator().validate(new ListInput(l)).isValid());
    }
    public void testInvalidMime() {
        ArrayList l = new ArrayList();
        l.add(new byte[0]);
        l.add("text/plaind");
        l.add("filename");

        assertFalse("validated an empty file", new ResumeValidator().validate(new ListInput(l)).isValid());
    }
    public void testCaseInsensitiveMime() {
        ArrayList l = new ArrayList();
        l.add(new byte[1]);
        l.add("text/plaiN");
        l.add("filename");

        assertTrue("didn't validate case insensitve mime type", new ResumeValidator().validate(new ListInput(l)).isValid());
    }
    public void testShortFileName() {
        ArrayList l = new ArrayList();
        l.add(new byte[1]);
        l.add("text/plaiN");
        l.add("");

        assertFalse("validated a short file name", new ResumeValidator().validate(new ListInput(l)).isValid());
    }
    public void testLongFileName() {
        ArrayList l = new ArrayList();
        l.add(new byte[1]);
        l.add("text/plaiN");
        l.add("kjasdlkjadslfjasdlfjasldfjalsdfjlaksdjflkasdjflkasjflkasjflkasdjflkasjdflkasjdflkajsflkajsflkajsflkjaslkfjaslkfjaslkfjalskdfjalksdfjalksdfjlaksjflkasjflkasdjflkasjdflkasdjfl");

        assertFalse("validated a long file name", new ResumeValidator().validate(new ListInput(l)).isValid());
    }
}
