package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Referral;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class ReferralValidator implements Validator {

    private static final Logger log = Logger.getLogger(ReferralValidator.class);

    private String handle;
    private String other;

    public ReferralValidator(String handle, String other) {
        this.handle = handle;
        this.other = other;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please choose a valid referral type.").validate(input);
        if (ret.isValid()) {
            Integer i;
            try {
                i = new Integer((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please choose a valid referral type.");
            }
            Referral c = DAOUtil.getFactory().getReferralDAO().find(i);
            if (c == null) {
                return new BasicResult(false, "Please choose a valid referral type.");
            } else {
                //if it's a member referral validate the supplied handle
                if (Referral.MEMBER_REFERRAL.equals(i)) {
                    return new UserNameExistsValidator().validate(new StringInput(handle));
                } else if (Referral.DECLINE.equals(i)) {
                    return ValidationResult.SUCCESS;
                } else {
                    return new ReferralOtherValidator().validate(new StringInput(other));
                }
            }
        } else {
            return ret;
        }
    }
}