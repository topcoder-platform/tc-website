package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author cucu
 */
public class AttendingHSValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator(
                "Please enter whether you'll be attending high school/secondary school on the specfied date.").validate(input);
       
        return ret;
    }
}
