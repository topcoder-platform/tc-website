/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * <p>This class will validate the contest round one specifics.</p>
 *
 * <p>Currently it will only validate the input is not empty.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class ContestRoundOneSpecificsValidator implements Validator {

    /**
     * This method will validate the input according to the defined business rules
     * 
     * @param input a <code>ValidationInput</code> to validate
     * @return an <code>ValidationResult</code> with the corresponding validation result
     * 
     * @throws IllegalArgumentException if the specified input is an invalid object
     * @see com.topcoder.web.common.validation.Validator#validate(com.topcoder.web.common.validation.ValidationInput)
     */
    public ValidationResult validate(ValidationInput input) {
        // verify parameter
        if (input == null || input.getInput() == null) {
            throw new IllegalArgumentException("Invalid input specified");
        }
        
        return new NonEmptyValidator("Please enter the round one specifics text for this contest.").validate(input);
    }
}
