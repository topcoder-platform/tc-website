package com.topcoder.web.tc.controller.request.membercontact.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * Validates wheter the user can receive a member contact.
 * To pass the validation, the input must:
 * - be not empty
 * - be an existing handler
 * - the handler must have the preference for member contact enabled
 * - the status of the primary address for the user must be active
 * - the receipt must not have blocked the user.
 *
 * If any of those fails, the validation fail.
 *
 * @author Owner
 *
 */
public class HandleValidator implements Validator {
    private User sender;

    public HandleValidator(User sender) {
        this.sender = sender;
    }

    public ValidationResult validate(ValidationInput input) {

        ValidationResult nret = new NonEmptyValidator("Please enter a user name.").validate(input);

        if (!nret.isValid()) {
            return nret;
        }
        User user = DAOUtil.getFactory().getUserDAO().find((String) input.getInput(), true, true);

        if (user == null) {
            return new BasicResult(false, "User not found.");
        }

        String canReceive = DAOUtil.getFactory().getUserPreferenceDAO().find(
                    user.getId(), Preference.MEMBER_CONTACT_PREFERENCE_ID).getValue();

        if (!"yes".equals(canReceive)) {
            return new BasicResult(false, "This user has not enabled Member Contacting.");
        }

        if (!user.getPrimaryEmailAddress().getStatusId().equals(Email.STATUS_ID_ACTIVE)) {
            return new BasicResult(false, "This user doesn't have a valid email address.");
        }

        MemberContactBlackListDAO memberContactDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        MemberContactBlackList m = memberContactDAO.findOrCreate(user, sender);
        if (m.isBlocked()) {
            return new BasicResult(false, "This user has blocked your messages.");
        }

        return BasicResult.SUCCESS;
    }
}
