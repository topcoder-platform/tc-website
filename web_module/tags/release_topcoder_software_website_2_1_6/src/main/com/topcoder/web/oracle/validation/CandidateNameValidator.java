package com.topcoder.web.oracle.validation;

import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.SizeValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.oracle.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2007
 */
public class CandidateNameValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter the candidate name.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_CANDIDATE_NAME_LENGTH, "candidate name").validate(input);
        } else {
            return ret;
        }
    }
}
