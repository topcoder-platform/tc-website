package com.topcoder.web.tc.controller.request.membercontact.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.tc.Constants;

public class HandleValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        
        ValidationResult nret = new NonEmptyValidator("Please enter an user name.").validate(input);
        
        if (!nret.isValid()) {
            return nret;
        }
        User user = DAOUtil.getFactory().getUserDAO().find((String) input.getInput(), true, true);
        
        if (user == null) {
            return new BasicResult(false, "User not found");
        }
        
        String canReceive = DAOUtil.getFactory().getUserPreferenceDAO().find(
                    user.getId().longValue(), Constants.MEMBER_CONTACT_PREFERENCE_ID).getValue();

        if (!"true".equals(canReceive)) {
            return new BasicResult(false, "The user can't receive emails via Member Contact.");
        }
        return BasicResult.SUCCESS;
    }
}
