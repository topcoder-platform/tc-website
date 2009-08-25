package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class ReferralOtherValidator implements Validator {
    private static final Logger log = Logger.getLogger(ReferralOtherValidator.class);

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your referral details.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_REFERRAL_OTHER_LENGTH, "referral details").validate(input);
        } else {
            return ret; 
        }

    }
}
