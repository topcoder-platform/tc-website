package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public class IntegerValidator implements Validator {

    private String failureMessage;

    public IntegerValidator(String failureMessage) {
        this.failureMessage = failureMessage;
    }

    public ValidationResult validate(ValidationInput input) {
        String num = (String) input.getInput();
        try {
            Integer.parseInt(num);
            return ValidationResult.SUCCESS;
        } catch (NumberFormatException e) {
            return new BasicResult(false, failureMessage);
        }
    }
}

