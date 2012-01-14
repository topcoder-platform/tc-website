package com.topcoder.web.tc.validation;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 30, 2007
 */
public class NominationValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {


        ValidationResult textResult = new NonEmptyValidator("Please enter the reason for your nomination.").validate(input);
        if (textResult.isValid()) {
            if (StringUtils.hasNotMoreWords(((String) input.getInput()), 250)) {
                return ValidationResult.SUCCESS;
            } else {
                return new BasicResult(false, "Your nomination must contain 250 words or fewer.");
            }
        } else {
            return textResult;
        }
    }
}
