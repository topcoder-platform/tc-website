package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class GPAScaleValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        if (Constants.GPA_SCALES.contains(input.getInput())) {
            return ValidationResult.SUCCESS;
        } else {
            return new BasicResult(false, "Please choose a valid GPA Scale");
        }
    }
}
