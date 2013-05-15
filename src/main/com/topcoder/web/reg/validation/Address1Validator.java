package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Address1Validator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your address.").validate(input);
        if (ret.isValid()) {
            return new SizeValidator(1, Constants.MAX_ADDRESS_LENGTH, "address1").validate(input);
        } else {
            return ret;
        }
    }
}
