package com.topcoder.web.truveo.validation;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MaxWidthValidator implements Validator {
    private String minWidth;

    public MaxWidthValidator(String minWidth) {
        this.minWidth = minWidth;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult emptyMaxResult = new NonEmptyValidator("").validate(input);
        if (!emptyMaxResult.isValid()) {
            //its ok, it's optional
            return ValidationResult.SUCCESS;
        } else {
            ValidationResult minNumResult = ValidationResult.SUCCESS;
            if (!"".equals(StringUtils.checkNull(minWidth))) {
                minNumResult = new IntegerValidator("Could not validate the max width because the min width was invalid.").validate(new StringInput(minWidth));
            }
            if (!minNumResult.isValid()) {
                return minNumResult;
            } else {
                ValidationResult maxNumResult =
                        new IntegerValidator("Please enter a valid number.").validate(input);
                if (maxNumResult.isValid()) {
                    if (!"".equals(StringUtils.checkNull(minWidth)) && new Integer(minWidth).compareTo(new Integer((String) input.getInput())) > 0)
                    {
                        return new BasicResult(false, "Max width must be greater than or equal min width");
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
