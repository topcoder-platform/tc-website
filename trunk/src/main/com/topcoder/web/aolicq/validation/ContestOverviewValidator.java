package com.topcoder.web.aolicq.validation;

import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class ContestOverviewValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        return new NonEmptyValidator("Please enter the overview text for this contest.").validate(input);
    }
}
