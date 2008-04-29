package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class EmailConfirmValidator implements Validator {
    private ValidationInput email;


    public EmailConfirmValidator(ValidationInput email) {
        this.email = email;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please confirm your email address.").validate(input);
        if (ret.isValid()) {
            return new BasicResult(email!=null&&input.getInput().equals(email.getInput()), "Please be sure the email confirmation and email fields match.");
        } else {
            return ret;
        }
    }
}
