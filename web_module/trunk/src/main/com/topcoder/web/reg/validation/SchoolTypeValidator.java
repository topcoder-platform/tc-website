package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.SchoolType;
import com.topcoder.web.common.validation.*;

import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 17, 2006
 */
public class SchoolTypeValidator implements Validator {

    Set types;

    public SchoolTypeValidator(Set registrationTypes) {
        types = registrationTypes;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please choose a valid school type.").validate(input);
        if (ret.isValid()) {
            Integer i;
            try {
                i = new Integer((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please choose a valid school type.");
            }
            SchoolType c = DAOUtil.getFactory().getSchoolTypeDAO().find(i);
            if (c == null) {
                return new BasicResult(false, "Please choose a valid school type.");
            } else {
                if (types.contains(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                    if (!i.equals(SchoolType.HIGH_SCHOOL)) {
                        return new BasicResult(false, "You must choose the High School you are currently attending in order to registration for High School Competitions");
                    }
                }
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}