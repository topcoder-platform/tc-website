/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.FloatValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * <p>This class will validate the contest's milestone prize amount.</p>
 *
 * <p>It will basically validate the amount is not empty if the number of milestone prizes is greater than zero and
 *    that the formatting is correct.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class MilestonePrizeAmountValidator implements Validator {

    /**
     * The number of milestone prizes
     */
    private String numberMilestonePrizes;

    /**
     * Constructor using fields
     * 
     * @param numberMilestonePrizes the number of milestone prizes
     */
    public MilestonePrizeAmountValidator(String numberMilestonePrizes) {
        this.numberMilestonePrizes = numberMilestonePrizes;
    }

    /**
     * This method will validate the input according to the defined business rules
     * 
     * @param input a <code>ValidationInput</code> to validate
     * @return an <code>ValidationResult</code> with the corresponding validation result
     * 
     * @see com.topcoder.web.common.validation.Validator#validate(com.topcoder.web.common.validation.ValidationInput)
     */
    public ValidationResult validate(ValidationInput input) {
        // if the number of milestone prizes is null, no need to continue validation
        if (numberMilestonePrizes == null) {
            return ValidationResult.SUCCESS;
        }
        numberMilestonePrizes = numberMilestonePrizes.trim();
        // if the number of milestone prizes is empty or zero, no need to continue validation
        if (numberMilestonePrizes.equals("") || numberMilestonePrizes.equals("0")) {
            return ValidationResult.SUCCESS;            
        }

        // validate amount is a valid float
        return new FloatValidator("Please enter a valid milestone prize amount for this contest.").validate(input);
    }
}
