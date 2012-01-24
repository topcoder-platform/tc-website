package com.topcoder.web.csf.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.csf.Constants;
import com.topcoder.shared.util.logging.Logger;

import java.text.SimpleDateFormat;
import java.text.ParseException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class TimeValidator implements Validator {
    protected static final Logger log = Logger.getLogger(TimeValidator.class);

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter a valid time.").validate(input);
        if (ret.isValid()) {
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            sdf.setLenient(false);
            try {
                sdf.parse((String) input.getInput());
            } catch (ParseException e) {
                return new BasicResult(false, "Invalid date string.");
            }
            return ValidationResult.SUCCESS;
        } else {
            return ret;
        }


    }

}
