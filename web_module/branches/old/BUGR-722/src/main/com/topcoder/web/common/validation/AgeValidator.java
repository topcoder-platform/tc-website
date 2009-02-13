package com.topcoder.web.common.validation;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author cucu
 */
public class AgeValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your age.").validate(input);
        
        if (!ret.isValid()) return ret;
        
        ret = new IntegerValidator("Please enter a valid age.").validate(input);

        if (!ret.isValid()) return ret;
        
        int age = Integer.parseInt((String) input.getInput());
        
        if (age < 1 || age > 199) {
            return new BasicResult(false, "Please enter a valid age.");
        }
        
        return ValidationResult.SUCCESS;
    }
}
