package com.topcoder.web.csf.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.common.StringUtils;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MaxHeightValidator implements Validator {
    private String minHeight;

    public MaxHeightValidator(String minHeight) {
        this.minHeight = minHeight;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult emptyMaxResult = new NonEmptyValidator("").validate(input);
        if (!emptyMaxResult.isValid()) {
            //its ok, it's optional
            return ValidationResult.SUCCESS;
        } else {
            ValidationResult minNumResult = ValidationResult.SUCCESS;
            if (!"".equals(StringUtils.checkNull(minHeight))) {
                minNumResult = new IntegerValidator("Could not validate the max height because the min height was invalid.").validate(new StringInput(minHeight));
            }
            if (!minNumResult.isValid()) {
                return minNumResult;
            } else {
                ValidationResult maxNumResult =
                        new IntegerValidator("Please enter a valid number.").validate(input);
                if (maxNumResult.isValid()) {
                    if (!"".equals(StringUtils.checkNull(minHeight)) && new Integer(minHeight).compareTo(new Integer((String) input.getInput())) > 0) {
                        return new BasicResult(false, "Max height must be greater than or equal min height");
                    } else {
                        return ValidationResult.SUCCESS;
                    }
                } else {
                    return maxNumResult;
                }
            }
        }
    }
}
