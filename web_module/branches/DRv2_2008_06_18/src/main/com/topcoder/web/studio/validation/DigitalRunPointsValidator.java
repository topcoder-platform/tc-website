package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.*;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class DigitalRunPointsValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        try {
            Float.parseFloat((String) input.getInput());
        } catch (NumberFormatException e) {
            return new BasicResult(false, "Please enter a valid digital run points amount.");
        }
        return ValidationResult.SUCCESS;
    }
}
