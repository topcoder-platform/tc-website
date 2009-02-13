package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.reg.model.CoderType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class CoderTypeValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please choose a valid coder type.").validate(input);
        if (ret.isValid()) {
            Integer i;
            try {
                i = new Integer((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please choose a valid coder type.");
            }
            CoderType c = Util.getFactory().getCoderTypeDAO().find(i);
            if (c == null) {
                return new BasicResult(false, "Please choose a valid coder type.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}
