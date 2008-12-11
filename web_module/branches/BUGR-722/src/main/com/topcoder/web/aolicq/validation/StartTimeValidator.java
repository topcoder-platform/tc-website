package com.topcoder.web.aolicq.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.aolicq.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class StartTimeValidator implements Validator {
    private String endTime;

    public StartTimeValidator(String endTime) {
        this.endTime = endTime;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new TimeValidator().validate(input);
        if (ret.isValid()) {
            //check if end is before start
            ValidationResult endResult = new TimeValidator().validate(new StringInput(endTime));
            if (endResult.isValid()) {
                SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
                sdf.setLenient(false);
                try {
                    Date end = sdf.parse(endTime);
                    Date start = sdf.parse((String) input.getInput());
                    if (end.before(start) || end.equals(start)) {
                        return new BasicResult(false, "The start time must be before the end time.");
                    }
                } catch (ParseException e) {
                    //this shouldn't happen, but we'll handle it anyway
                    return new BasicResult(false, "Either start or end time is invalid.");
                }
            } else {
                return new BasicResult(false, "Unable to check if the start time is valid because the end time is not.");
            }
        } else {
            return new BasicResult(false, "Please enter a valid start time.");
        }
        return ValidationResult.SUCCESS;
    }

}