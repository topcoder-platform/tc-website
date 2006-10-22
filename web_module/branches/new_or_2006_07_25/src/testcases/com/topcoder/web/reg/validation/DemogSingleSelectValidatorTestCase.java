package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogSingleSelectValidatorTestCase extends TCHibernateTestCase {


    public void testInvalidAnswer() {
        DemogSingleSelectValidator d =
                new DemogSingleSelectValidator(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(1)), true);
        assertFalse("allowed non numeric answerid", d.validate(new StringInput("dd")).isValid());
    }

    public void testInvalidAnswerNotRequired() {
        DemogSingleSelectValidator d =
                new DemogSingleSelectValidator(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(1)), false);
        assertFalse("allowed non numeric answerid", d.validate(new StringInput("dd")).isValid());
    }

}