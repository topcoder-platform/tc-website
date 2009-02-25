package com.topcoder.web.oracle.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.oracle.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class RoundNameValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter the round name.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_ROUND_NAME_LENGTH, "round name").validate(input);
        } else {
            return ret;
        }
    }
}
