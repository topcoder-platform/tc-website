package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Address2Validator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your address.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_ADDRESS_LENGTH, "address2").validate(input);
        } else {
            //if they didn't enter an address2, that's ok, it's not required.
            return ValidationResult.SUCCESS;
        }

    }
}
