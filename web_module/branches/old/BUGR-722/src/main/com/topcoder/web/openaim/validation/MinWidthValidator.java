package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class MinWidthValidator implements Validator {
    private String maxWidth;

    public MinWidthValidator(String maxWidth) {
        this.maxWidth = maxWidth;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult emptyMinResult = new NonEmptyValidator("").validate(input);
        if (!emptyMinResult.isValid()) {
            //its ok, it's optional
            return ValidationResult.SUCCESS;
        } else {
            ValidationResult maxNumResult = ValidationResult.SUCCESS;
            if (!"".equals(StringUtils.checkNull(maxWidth))) {
                maxNumResult = new IntegerValidator("Could not validate the min width because the max width was invalid.").validate(new StringInput(maxWidth));
            }
            if (!maxNumResult.isValid()) {
                return maxNumResult;
            } else {
                ValidationResult minNumResult =
                        new IntegerValidator("Please enter a valid number.").validate(input);
                if (minNumResult.isValid()) {
                    if (!"".equals(StringUtils.checkNull(maxWidth)) && new Integer(maxWidth).compareTo(new Integer((String) input.getInput())) < 0)
                    {
                        return new BasicResult(false, "Min width must be less than or equal max width");
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
