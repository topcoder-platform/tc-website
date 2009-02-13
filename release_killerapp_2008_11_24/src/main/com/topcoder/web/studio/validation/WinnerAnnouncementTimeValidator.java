/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.studio.Constants;

import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

/**
 * <p>A validator for times of announcing of a winner for the created contests.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
 */
public class WinnerAnnouncementTimeValidator implements Validator {

    /**
     * <p>A <code>String</code> providing the end time for the contest.</p>
     */
    private String endTime = null;

    /**
     * <p>Constructs new <code>WinnerAnnouncementTimeValidator</code> instance to be used to validate the inputs
     * providing winner announcement times for contest which has the specified end time set.</p>
     *
     * @param endTime a <code>String</code> providing the end time of a contest.
     */
    public WinnerAnnouncementTimeValidator(String endTime) {
        this.endTime = endTime;
    }

    /**
     * <p>Validates the specified input which is expected to provide the time of announcing of a winner for the contest
     * which has the end time as provided to constructor of this validator. The validation will succeed only if the
     * provided winner announcement time is after the contest's end time.</p>
     *
     * @param input a <code>ValidationInput</code> providing the data to be validated.
     * @return a <code>ValidationResult</code> providing the result of validation of the provided input.
     */
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new TimeValidator().validate(input);
        if (ret.isValid()) {
            ValidationResult endTime = new TimeValidator().validate(new StringInput(this.endTime));
            if (endTime.isValid()) {
                SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
                sdf.setLenient(false);
                try {
                    Date end = sdf.parse(this.endTime);
                    Date winnerAnnouncmene = sdf.parse((String) input.getInput());
                    if (winnerAnnouncmene.before(end) || winnerAnnouncmene.equals(end)) {
                        return new BasicResult(false, Constants.ERROR_MSG_WIN_ANNOUNCE_BEFORE_END);
                    }
                } catch (ParseException e) {
                    return new BasicResult(false, Constants.ERROR_MSG_WIN_ANNOUNCE_INVALID);
                }
            } else {
                return new BasicResult(false, Constants.ERROR_MSG_WIN_ANNOUNCE_UNABLE_TO_CHECK);
            }
        } else {
            return new BasicResult(false, Constants.ERROR_MSG_NO_WIN_ANNOUNCE);
        }
        return ValidationResult.SUCCESS;
    }
}
