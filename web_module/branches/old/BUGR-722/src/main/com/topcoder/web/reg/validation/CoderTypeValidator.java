package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.CoderType;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
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
            CoderType c = DAOUtil.getFactory().getCoderTypeDAO().find(i);
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