package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.dao.Util;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogSingleSelectValidatorTestCase extends TCHibernateTestCase {


    public void testInvalidAnswer() {
        DemogSingleSelectValidator d =
                new DemogSingleSelectValidator(Util.getFactory().getDemographicQuestionDAO().find(new Long(1)));
        assertFalse("allowed non numeric answerid", d.validate(new StringInput("dd")).isValid());
    }


}
