/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.SizeValidator;
import com.topcoder.web.studio.Constants;

/**
 * <p>A validator for names of the clients who have created the contests.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.1)
 */
public class ClientNameValidator implements Validator {

    /**
     * <p>Constructs new <code>ClientNameValidator</code> instance. This implementation does nothing.</p>
     */
    public ClientNameValidator() {
    }

    /**
     * <p>Validates the specified input which is expected to provide the name of a client who have created the contest.
     * </p>
     *
     * @param input a <code>ValidationInput</code> providing the data to be validated.
     * @return a <code>ValidationResult</code> providing the result of validation of the provided input.
     */
    public ValidationResult validate(ValidationInput input) {
        String name = (String) input.getInput();
        boolean isEmpty = (name == null) || (name.trim().length() == 0);
        if (!isEmpty) {
            return new SizeValidator(1, Constants.MAX_CLIENT_NAME_LENGTH, "client name").validate(input);
        } else {
            return ValidationResult.SUCCESS ;
        }
    }
}
