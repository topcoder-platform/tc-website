/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * <p>This class will validate the contest's milestone prize amount.</p>
 *
 * <p>It will basically validate the amount is not empty and positive if the number of milestone prizes is greater
 *    than zero and that the formatting is correct.</p>
 *
 * @author pulky
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
     * @throws IllegalArgumentException if the specified input is an invalid object
     * @see com.topcoder.web.common.validation.Validator#validate(com.topcoder.web.common.validation.ValidationInput)
     */
    public ValidationResult validate(ValidationInput input) {
        // verify parameter
        if (input == null || input.getInput() == null) {
            throw new IllegalArgumentException("Invalid input specified");
        }

        // if the number of milestone prizes is null, no need to continue validation
        if (numberMilestonePrizes == null) {
            return ValidationResult.SUCCESS;
        }
        numberMilestonePrizes = numberMilestonePrizes.trim();
        // if the number of milestone prizes is empty or zero, no need to continue validation
        if (numberMilestonePrizes.length() == 0  || numberMilestonePrizes.equals("0")) {
            return ValidationResult.SUCCESS;
        }

        // validate amount is a valid positive float
        String num = (String) input.getInput();
        try {
            Float floatNum = Float.parseFloat(num);

            if (floatNum > 0) {
                return ValidationResult.SUCCESS;
            } else {
                return new BasicResult(false, "Please enter a positive milestone prize amount for this contest.");
            }
        } catch (NumberFormatException e) {
            return new BasicResult(false, "Please enter a valid milestone prize amount for this contest.");
        }
    }
}
