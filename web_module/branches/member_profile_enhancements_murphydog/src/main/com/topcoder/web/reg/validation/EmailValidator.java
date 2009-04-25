package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class EmailValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your email address.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_EMAIL_LENGTH, "email").validate(input);
        } else {
            return ret;
        }
    }
}
