package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class GPAValidator implements Validator {
    private float scale;
    public GPAValidator(String gpaScale) {
        this.scale = Float.parseFloat(gpaScale);
    }
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your GPA.").validate(input);
        if (ret.isValid()) {
            Float i;
            try {
                i = new Float((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please enter a valid GPA.");
            }
            float ii = i.floatValue();
            if (ii<0||ii>scale) {
                return new BasicResult(false, "Please enter a valid GPA.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}
