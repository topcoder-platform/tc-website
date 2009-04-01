package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class NonEmptyValidator implements Validator {

    private String failureMessage;
    private NonEmptyValidator() {

    }

    public NonEmptyValidator(String failureMessage) {
        this.failureMessage = failureMessage;
    }

    public ValidationResult validate(ValidationInput input) {
        String name = (String)input.getInput();
        if (name==null || "".equals(name.trim())) {
            return new BasicResult(false, failureMessage);
        } else {
            return ValidationResult.SUCCESS;
        }
    }
}

