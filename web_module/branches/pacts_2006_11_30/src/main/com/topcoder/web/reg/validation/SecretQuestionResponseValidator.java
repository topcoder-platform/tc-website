package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.reg.Constants;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 11 2006
 */
public class SecretQuestionResponseValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your secret question response.").validate(input);
        if (!ret.isValid()) {
            return ret;
        }
        return  new SizeValidator(Constants.MIN_SECRET_QUESTION_RESPONSE_LENGTH,
                    Constants.MAX_SECRET_QUESTION_RESPONSE_LENGTH, "secret question response").validate(input);
    }
}
