package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogMultiSelectValidatorTestCase extends TCHibernateTestCase {

    public void testAnswerNull() {
        DemogMultiSelectValidator d =
                new DemogMultiSelectValidator(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(19)), true);
        ArrayList a = new ArrayList();
        a.add(null);
        assertFalse("allowed null response", d.validate(new ListInput(a)).isValid());
    }

    public void testAnswerNullNotRequired() {
        DemogMultiSelectValidator d =
                new DemogMultiSelectValidator(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(19)), false);
        ArrayList a = new ArrayList();
        a.add(null);
        assertTrue("didn't allow null response", d.validate(new ListInput(a)).isValid());
    }

    public void testInvalidAnswer() {
        DemogMultiSelectValidator d =
                new DemogMultiSelectValidator(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(19)), true);
        ArrayList a = new ArrayList();
        a.add("96");
        a.add("97");
        assertFalse("allowed unassociated answerid", d.validate(new ListInput(a)).isValid());
    }

    public void testInvalidAnswerNotRequired() {
        DemogMultiSelectValidator d =
                new DemogMultiSelectValidator(DAOUtil.getFactory().getDemographicQuestionDAO().find(new Long(19)), false);
        ArrayList a = new ArrayList();
        a.add("96");
        a.add("97");
        assertFalse("allowed unassociated answerid", d.validate(new ListInput(a)).isValid());
    }


}