package com.topcoder.web.csf.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.csf.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ContestNameValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter the contest name.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_CONTEST_NAME_LENGTH, "contest name").validate(input);
        } else {
            return ret;
        }
    }
}
