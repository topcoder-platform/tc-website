/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.validation;

/**
 * <p>This class will validate the input is a valid float number.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class FloatValidator implements Validator {

    /**
     * The failure message to return
     */
    private String failureMessage;

    /**
     * Constructor using fields
     * 
     * @param failureMessage the failure message to return
     */
    public FloatValidator(String failureMessage) {
        this.failureMessage = failureMessage;
    }

    /**
     * This method will validate if the input is a valid float number
     * 
     * @param input a <code>ValidationInput</code> to validate
     * @return an <code>ValidationResult</code> with the corresponding validation result
     * 
     * @see com.topcoder.web.common.validation.Validator#validate(com.topcoder.web.common.validation.ValidationInput)
     */
    public ValidationResult validate(ValidationInput input) {
        String num = (String) input.getInput();
        try {
            Float.parseFloat(num);
            return ValidationResult.SUCCESS;
        } catch (NumberFormatException e) {
            return new BasicResult(false, failureMessage);
        }
    }
}

