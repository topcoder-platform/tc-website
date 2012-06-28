package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

public class NameInAnotherLanguageValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your name in another language.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_NAME_IN_ANOTHER_LANGUAGE_LENGTH, "nameInAnotherLanguage").validate(input);
        } else {
            //if they didn't enter a quote, that's ok, it's not required.
            return ValidationResult.SUCCESS;
        }
    }
}
