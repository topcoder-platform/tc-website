package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.dao.Util;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class UserNameExistsValidator implements Validator  {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult nret = new NonEmptyValidator("User name does not exist.").validate(input);
        if (nret.isValid()) {
            return new BasicResult(Util.getFactory().getUserDAO().find((String)input.getInput(), true)!=null,
                    "User name does not exist.");
        } else {
            return nret;
        }
    }
}
