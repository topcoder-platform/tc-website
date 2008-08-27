package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class SchoolNameValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your school's name.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_SCHOOL_NAME_LENGTH, "school name").validate(input);
        } else {
            return ret;
        }
    }
}
