package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class PasswordConfirmValidator implements Validator {

    private ValidationInput password;

    public PasswordConfirmValidator(ValidationInput password) {
        this.password = password;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please confirm your password.").validate(input);
        if (ret.isValid()) {
            return new BasicResult(password!=null&&input.getInput().equals(password.getInput()), "Please be sure the password confirmation and password fields match.");
        } else {
            return ret;
        }
    }
}
