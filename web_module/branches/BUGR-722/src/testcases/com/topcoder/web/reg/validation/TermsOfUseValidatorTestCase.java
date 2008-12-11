package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 30, 2006
 */
public class TermsOfUseValidatorTestCase extends TCHibernateTestCase {
    public void testValid() {
        assertTrue("found a valid terms of use response to be invalid",
                new TermsOfUseValidator(DAOUtil.getFactory().getUserDAO().find("dok", false)).validate(new StringInput("on")).isValid());
    }

    public void testInvalid() {
        assertFalse("found an invalid terms of use response to be valid",
                new TermsOfUseValidator(DAOUtil.getFactory().getUserDAO().find("dok", false)).validate(new StringInput("666")).isValid());
    }

}
