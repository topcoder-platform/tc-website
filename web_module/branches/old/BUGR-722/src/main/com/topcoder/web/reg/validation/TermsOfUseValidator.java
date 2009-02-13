package com.topcoder.web.reg.validation;

import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 30, 2006
 */
public class TermsOfUseValidator implements Validator {
    private User u;

    public TermsOfUseValidator(User u) {
        this.u = u;

    }

    public ValidationResult validate(ValidationInput input) {
        if (!u.hasTerms(new Integer(Constants.REG_TERMS_ID))) {
            return new BasicResult("on".equals(input.getInput()), "In order to continue, you must agree to the terms of use.");
        } else {
            return ValidationResult.SUCCESS;
        }
    }
}
