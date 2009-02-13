package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision: 50837 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class PasswordValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret;
        ValidationResult nret = new NonEmptyValidator("Please enter your password.").validate(input);
        if (nret.isValid()) {
            ValidationResult sret =  new SizeValidator(Constants.MIN_PASSWORD_LENGTH,
                    Constants.MAX_PASSWORD_LENGTH, "Password").validate(input);
            if (sret.isValid()) {
                //validate characters in password
                ret = new BasicResult(StringUtils.containsOnly((String)input.getInput(), Constants.PASSWORD_ALPHABET, false),
                        "Your password may contain only letters, numbers and " +  Constants.PUNCTUATION);
            } else {
                ret = sret;
            }
        } else {
            ret = nret;
        }
        return ret;
    }
}
