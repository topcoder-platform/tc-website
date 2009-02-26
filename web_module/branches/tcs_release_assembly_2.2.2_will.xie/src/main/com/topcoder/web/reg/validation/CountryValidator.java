package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class CountryValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter your country.").validate(input);
        if (ret.isValid()) {
            Country c = DAOUtil.getFactory().getCountryDAO().find((String) input.getInput());
            if (c == null) {
                return new BasicResult(false, "Please choose a valid country.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}
