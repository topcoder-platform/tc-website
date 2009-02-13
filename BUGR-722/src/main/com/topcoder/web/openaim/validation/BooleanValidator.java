package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 31, 2006
 */
public class BooleanValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        if (String.valueOf(true).equals(input.getInput()) || String.valueOf(false).equals(input.getInput())) {
            return ValidationResult.SUCCESS;
        } else {
            return new BasicResult(false, "Please make a valid choice for this question.");
        }
    }
}
