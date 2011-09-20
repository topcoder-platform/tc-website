package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class SizeValidator {
    private int min;
    private int max;
    private String fieldName;

    private SizeValidator() {

    }

    public SizeValidator(int min, int max, String fieldName) {
        this.min = min;
        this.max = max;
        this.fieldName = fieldName;
    }

    public ValidationResult validate(ValidationInput input) {
        String s = (String)input.getInput();
        if (s==null||s.length()<min) {
            return new BasicResult(false, fieldName + " must be at least " + min + " characters in length.");
        } else if (s.length()>max) {
            return new BasicResult(false, fieldName + " may contain at most " + max + " characters.");
        } else {
            return ValidationResult.SUCCESS;
        }
    }

}
