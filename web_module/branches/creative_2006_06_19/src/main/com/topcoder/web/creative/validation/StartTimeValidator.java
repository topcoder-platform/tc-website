package com.topcoder.web.creative.validation;

import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class StartTimeValidator implements Validator {
    private String endTime;

    public StartTimeValidator(String endTime) {
        this.endTime = endTime;
    }

    public ValidationResult validate(ValidationInput input) {
        return ValidationResult.SUCCESS;
    }

}