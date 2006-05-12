package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.dao.hibernate.UserDAOHibernate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class UserNameValidator implements Validator {
    private User u;

    private UserNameValidator() {

    }

    public UserNameValidator(User u) {
        this.u = u;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = null;
        ValidationResult nret = new NonEmptyValidator("Please enter your user name.").validate(input);
        if (nret.isValid()) {
            ValidationResult sret =  new SizeValidator(Constants.MIN_HANDLE_LENGTH, Constants.MAX_HANDLE_LENGTH, "user name").validate(input);
            if (sret.isValid()) {
                String handle = (String)input.getInput();
                //if they're new, or if they are changing their user name
                if (u.isNew() || (!u.isNew() && !u.getHandle().equals(input.getInput()))) {
                    ret = new BasicResult(new UserDAOHibernate().find(handle)!=null, "Please choose another handle.");
                }
                if (!StringUtils.containsOnly(handle, Constants.HANDLE_ALPHABET, false)) {
                    ret = new BasicResult(false, "Your user name may contain only letters, numbers and " +  Constants.PUNCTUATION);
                } else if (StringUtils.containsOnly(handle, Constants.PUNCTUATION, false)) {
                    ret = new BasicResult(false, "Your user name may not contain only punctuation.");
                }
            } else {
                ret = sret;
            }
        } else {
            ret = nret;
        }
        return ret;
    }




}
