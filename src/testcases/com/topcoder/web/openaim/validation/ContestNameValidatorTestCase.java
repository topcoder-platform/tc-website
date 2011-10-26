package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.openaim.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ContestNameValidatorTestCase extends TCHibernateTestCase {
    public void testNameNull() {
        boolean gotException = false;
        try {
            new ContestNameValidator().validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertTrue("got exception", !gotException);
    }

    public void testLongName() {
        assertFalse("validated a name that was too long", new ContestNameValidator().validate(new StringInput("lkajsdlkajdflaksjfalkjfalsjfaldsjfaldsfjaldjfaldfjalkfjalskfjaldsjfaldsfjaldsfjalsfjalksfjalksfjalksfjalksfjalksjfalksjfalksjfalksjflaksjfalksjfalksfjalksfjalksfjalkfjalksdfjalksdjflaksdjflkasdjflkasjdflajflkajflkajsflkajslkfjalkfjalkfjalkfjlakjflakjflkajflkajdflkajdflkajdflkajdf")).isValid());
    }
}