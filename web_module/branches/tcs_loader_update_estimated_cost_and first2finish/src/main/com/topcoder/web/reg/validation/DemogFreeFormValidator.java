package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.Address;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogFreeFormValidator implements Validator {
    private static final Logger log = Logger.getLogger(DemogFreeFormValidator.class);
    private User u;
    private boolean isRequired;

    public DemogFreeFormValidator(User u, boolean isRequired) {
        this.u = u;
        this.isRequired = isRequired;
    }

    public ValidationResult validate(ValidationInput input) {
        Address a = u.getHomeAddress();

        ValidationResult eret = new NonEmptyValidator("Please respond to this question.").validate(input);

        if (!isRequired && !eret.isValid()) {
            return ValidationResult.SUCCESS;
        }

        if (a == null || a.getState() == null || !a.getState().isOptionalDemographics()) {
            if (eret.isValid()) {
                return new SizeValidator(1, Constants.MAX_DEMOG_RESPONSE_LENGTH, "response").validate(input);
            } else {
                return eret;
            }
        } else if (input.getInput() == null) {
            //this means they didn't have to answer the question, so they're good to go
            return ValidationResult.SUCCESS;
        } else {
            //this means they didn't have to answer the qeustion, but we still need to check for length
            return new SizeValidator(0, Constants.MAX_DEMOG_RESPONSE_LENGTH, "response").validate(input);
        }
    }
}