package com.topcoder.web.aolicq.validation;

import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class PrizeValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter the value for this prize name.").validate(input);
        if (ret.isValid()) {
            try {
                Float.parseFloat((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please enter a valid prize amount.");
            }
            return ValidationResult.SUCCESS;
        } else {
            return ret;
        }
    }
}
