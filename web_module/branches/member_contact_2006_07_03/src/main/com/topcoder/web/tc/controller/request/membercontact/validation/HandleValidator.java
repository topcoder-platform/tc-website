package com.topcoder.web.tc.controller.request.membercontact.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

public class HandleValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        
        ValidationResult nret = new NonEmptyValidator("Please enter an user name.").validate(input);
        
        if (!nret.isValid()) {
            return nret;
        }
        User user = DAOUtil.getFactory().getUserDAO().find((String) input.getInput(), true, true);
        
        if (user == null) {
            return new BasicResult(false, "User name does not exist.");
        }
        
        // fix
        if (user.getHandle().equals("tomek")) {
            return new BasicResult(false, "The user doesn't have the member contact feature enabled.");            
        }
        return ValidationResult.SUCCESS;
    }
}
