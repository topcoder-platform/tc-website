package com.topcoder.web.aolicq.validation;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MinHeightValidator implements Validator {
    private String maxHeight;

    public MinHeightValidator(String maxHeight) {
        this.maxHeight = maxHeight;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult emptyMinResult = new NonEmptyValidator("").validate(input);
        if (!emptyMinResult.isValid()) {
            //its ok, it's optional
            return ValidationResult.SUCCESS;
        } else {
            ValidationResult maxNumResult = ValidationResult.SUCCESS;
            if (!"".equals(StringUtils.checkNull(maxHeight))) {
                maxNumResult = new IntegerValidator("Could not validate the min height because the max height was invalid.").validate(new StringInput(maxHeight));
            }

            if (!maxNumResult.isValid()) {
                return maxNumResult;
            } else {
                ValidationResult minNumResult =
                        new IntegerValidator("Please enter a valid number.").validate(input);
                if (minNumResult.isValid()) {
                    if (!"".equals(StringUtils.checkNull(maxHeight)) && new Integer(maxHeight).compareTo(new Integer((String) input.getInput())) < 0)
                    {
                        return new BasicResult(false, "Min height must be less than or equal max height");
                    } else {
                        return ValidationResult.SUCCESS;
                    }
                } else {
                    return minNumResult;
                }
            }
        }
    }
}
