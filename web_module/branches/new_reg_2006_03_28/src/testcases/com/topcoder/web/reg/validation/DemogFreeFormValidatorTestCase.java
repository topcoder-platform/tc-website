package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogFreeFormValidatorTestCase extends TCHibernateTestCase {

    public void testAnswerNullDeclineEnabled() {
        User u = Util.getFactory().getUserDAO().find("dok");
        u.getHomeAddress().setState(Util.getFactory().getStateDAO().find("VT"));
        DemogFreeFormValidator d = new DemogFreeFormValidator(u);
        ValidationResult r =d.validate(new StringInput(null));
        log.debug(r.getMessage());
        assertTrue("didn't allow null response from a decline state", r.isValid());
    }

    public void testAnswerNullDeclineDisabled() {
        User u = Util.getFactory().getUserDAO().find("dok");
        u.getHomeAddress().setState(Util.getFactory().getStateDAO().find("CO"));
        DemogFreeFormValidator d = new DemogFreeFormValidator(u);
        assertFalse("allowed null response from a non-decline state", d.validate(new StringInput(null)).isValid());
    }

    public void testMaxLength() {
        User u = Util.getFactory().getUserDAO().find("dok");
        DemogFreeFormValidator d = new DemogFreeFormValidator(u);
        assertFalse("validated a response that was too long", d.validate(new StringInput("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).isValid());
    }


}
