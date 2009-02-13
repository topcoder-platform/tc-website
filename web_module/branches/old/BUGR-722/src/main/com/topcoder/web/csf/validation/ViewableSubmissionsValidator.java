package com.topcoder.web.csf.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.BasicResult;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 31, 2006
 */
public class ViewableSubmissionsValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        if (String.valueOf(true).equals(input.getInput()) || String.valueOf(false).equals(input.getInput())) {
            return ValidationResult.SUCCESS;
        } else {
            return new BasicResult(false, "Please make a valid choice for this question.");
        }
    }
}
