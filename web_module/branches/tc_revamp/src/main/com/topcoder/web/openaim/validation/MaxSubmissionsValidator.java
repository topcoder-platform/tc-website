package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class MaxSubmissionsValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult emptyMaxResult = new NonEmptyValidator("").validate(input);
        if (!emptyMaxResult.isValid()) {
            //its ok, it's optional
            return ValidationResult.SUCCESS;
        } else {
                ValidationResult validationResult =
                        new IntegerValidator("Please enter a valid number.").validate(input);
                if (validationResult.isValid()) {
                    int max = Integer.parseInt((String) input.getInput());
                    if (max <= 0) {
                        return new BasicResult(false, "Please choose a number greater than 0, or leave empty if you don't want to set a max.");
                    } else if (max > 1000) {
                        return new BasicResult(false, "Whoa there, I don't think you need to allow quite that many submissions, try a number under 1,000.");
                    } else {
                        return ValidationResult.SUCCESS;
                    }
                } else {
                    return validationResult;
                }
        }
    }
}
