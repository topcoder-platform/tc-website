package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogFreeFormValidatorTestCase extends TCHibernateTestCase {

    public void testAnswerNullDeclineEnabled() {
        User u = DAOUtil.getFactory().getUserDAO().find("dok", true);
        u.getHomeAddress().setState(DAOUtil.getFactory().getStateDAO().find("VT"));
        DemogFreeFormValidator d = new DemogFreeFormValidator(u, true);
        ValidationResult r = d.validate(new StringInput(null));
        log.debug(r.getMessage());
        assertTrue("didn't allow null response from a decline state", r.isValid());
    }

    public void testAnswerNullDeclineDisabled() {
        User u = DAOUtil.getFactory().getUserDAO().find("dok", true);
        u.getHomeAddress().setState(DAOUtil.getFactory().getStateDAO().find("CO"));
        DemogFreeFormValidator d = new DemogFreeFormValidator(u, true);
        assertFalse("allowed null response from a non-decline state", d.validate(new StringInput(null)).isValid());
    }

    public void testAnswerNullNotRequired() {
        User u = DAOUtil.getFactory().getUserDAO().find("dok", true);
        u.getHomeAddress().setState(DAOUtil.getFactory().getStateDAO().find("CO"));
        DemogFreeFormValidator d = new DemogFreeFormValidator(u, false);
        assertTrue("didn't allow null response on unrequired question", d.validate(new StringInput(null)).isValid());
    }

    public void testMaxLength() {
        User u = DAOUtil.getFactory().getUserDAO().find("dok", true);
        DemogFreeFormValidator d = new DemogFreeFormValidator(u, true);
        assertFalse("validated a response that was too long", d.validate(new StringInput("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).isValid());
    }

    public void testMaxLengthNotRequired() {
        User u = DAOUtil.getFactory().getUserDAO().find("dok", true);
        DemogFreeFormValidator d = new DemogFreeFormValidator(u, false);
        assertFalse("validated a response that was too long", d.validate(new StringInput("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).isValid());
    }


}