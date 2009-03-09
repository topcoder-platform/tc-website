/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.SizeValidator;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.studio.Constants;

/**
 * <p>A validator for the contest configuration properties.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
 */
public class ContestConfigValueValidator implements Validator {

    /**
     * <p>A <code>boolean</code> indicating whether the contest configuration property is required or not.</p>
     */
    private boolean required = false;

    /**
     * <p>A <code>String</code> providing the name of the configuration property which this validator is validating
     * values for.</p>
     */
    private String propertyName = null;

    /**
     * <p>Constructs new <code>ContestConfigValueValidator</code> instance to be used for validating either required or
     * optional contest configuration property values.</p>
     *
     * @param propertyName a <code>String</code> providing the name of the configuration property which this validator
     *        will validate values for.
     * @param required <code>true</code> if the configuration property values must not be empty; <code>false</code>
     *        otherwise.
     */
    public ContestConfigValueValidator(String propertyName, boolean required) {
        this.propertyName = propertyName;
        this.required = required;
    }

    /**
     * <p>Validates the specified input which is expected to provide the value of a contest configuration property.</p>
     *
     * @param input a <code>ValidationInput</code> providing the data to be validated.
     * @return a <code>ValidationResult</code> providing the result of validation of the provided input.
     */
    public ValidationResult validate(ValidationInput input) {
        String name = (String) input.getInput();
        boolean isEmpty = (name == null) || (name.trim().length() == 0);
        if (!isEmpty) {
            return new SizeValidator(1, Constants.MAX_CONTEST_CONFIG_VALUE_LENGTH, this.propertyName).validate(input);
        } else {
            if (!this.required) {
                return ValidationResult.SUCCESS ;
            } else {
                return new BasicResult(false, "Please provide " + this.propertyName);
            }
        }
    }
}
