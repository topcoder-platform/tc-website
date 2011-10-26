package com.topcoder.web.csf.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.NonEmptyValidator;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class ContestOverviewValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        return new NonEmptyValidator("Please enter the overview text for this contest.").validate(input);
    }
}
