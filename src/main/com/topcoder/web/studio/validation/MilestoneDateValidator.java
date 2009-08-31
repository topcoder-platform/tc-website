/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.studio.Constants;

/**
 * <p>This class will validate the contest's milestone date.</p>
 *
 * <p>It will basically validate date's formatting, and chronological order compared to start time and end time.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class MilestoneDateValidator implements Validator {

    /**
     * The contest start time
     */
    private String startTime;

    /**
     * The contest end time
     */
    private String endTime;

    /**
     * Constructor using fields
     * 
     * @param startTime the contest start time
     * @param endTime the contest end time
     */
    public MilestoneDateValidator(String startTime, String endTime) {
        this.startTime = startTime;
        this.endTime = endTime;
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
        ValidationResult ret = new TimeValidator().validate(input);
        if (ret.isValid()) {
            //check if end is before, or start is after
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            sdf.setLenient(false);
            try {
                Date start = sdf.parse(startTime);
                Date end = sdf.parse(endTime);
                Date milestone = sdf.parse((String) input.getInput());
                if (end.before(milestone) || end.equals(milestone)) {
                    return new BasicResult(false, "The end time must be after the milestone date.");
                }
                if (start.after(milestone) || start.equals(milestone)) {
                    return new BasicResult(false, "The start time must be before the milestone date.");
                }
            } catch (ParseException e) {
                // this shouldn't happen (everything was already validated), but we'll handle it anyway
                return new BasicResult(false, "Either start time, end time or milestone date is invalid.");
            }
        } else {
            return new BasicResult(false, "Please enter a valid milestone date.");
        }
        return ValidationResult.SUCCESS;
    }
}
