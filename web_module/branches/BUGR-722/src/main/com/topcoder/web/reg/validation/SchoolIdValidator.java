package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class SchoolIdValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please choose a valid school.").validate(input);
        if (ret.isValid()) {
            Long i;
            try {
                i = new Long((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please choose a valid school.");
            }
            School c = DAOUtil.getFactory().getSchoolDAO().find(i);
            if (c == null) {
                return new BasicResult(false, "Please choose a valid school.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }

    }
}