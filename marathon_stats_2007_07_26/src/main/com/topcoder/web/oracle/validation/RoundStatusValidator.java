package com.topcoder.web.oracle.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.oracle.dao.OracleDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class RoundStatusValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        String roundStatusId = (String)input.getInput();
        ValidationResult ret = new NonEmptyValidator("Please choose a valid round status.").validate(input);
        if (ret.isValid()) {
            if (OracleDAOUtil.getFactory().getRoundStatusDAO().find(new Integer(roundStatusId))==null) {
                return new BasicResult(false, "Please choose a valid round status.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}
