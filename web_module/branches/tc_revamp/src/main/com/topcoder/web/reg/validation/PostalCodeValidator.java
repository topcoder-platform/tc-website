package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class PostalCodeValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your postal code.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(Constants.MIN_POSTAL_CODE_LENGTH, Constants.MAX_POSTAL_CODE_LENGTH, "postal code").validate(input);
        } else {
            //if they didn't include a postal code, let them go, it's not required
            return ValidationResult.SUCCESS;
        }
    }
}
