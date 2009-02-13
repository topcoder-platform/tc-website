package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.openaim.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class EndTimeValidator implements Validator {
    private String startTime;

    public EndTimeValidator(String startTime) {
        this.startTime = startTime;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new TimeValidator().validate(input);
        if (ret.isValid()) {
            //check if end is before start
            ValidationResult startResult = new TimeValidator().validate(new StringInput(startTime));
            if (startResult.isValid()) {
                SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
                sdf.setLenient(false);
                try {
                    Date start = sdf.parse(startTime);
                    Date end = sdf.parse((String) input.getInput());
                    if (end.before(start) || end.equals(start)) {
                        return new BasicResult(false, "The end time must be after the start time.");
                    }
                } catch (ParseException e) {
                    //this shouldn't happen, but we'll handle it anyway
                    return new BasicResult(false, "Either start or end time is invalid.");
                }
            } else {
                return new BasicResult(false, "Unable to check if the end time is valid because the start time is not.");
            }
        } else {
            return new BasicResult(false, "Please enter a valid end time.");
        }
        return ValidationResult.SUCCESS;
    }
}