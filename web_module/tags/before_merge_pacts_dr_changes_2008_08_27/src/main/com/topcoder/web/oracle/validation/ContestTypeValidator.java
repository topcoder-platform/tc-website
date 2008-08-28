package com.topcoder.web.oracle.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.oracle.dao.OracleDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class ContestTypeValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        String contestTypeId = (String)input.getInput();
        ValidationResult ret = new NonEmptyValidator("Please choose a valid contest type.").validate(input);
        if (ret.isValid()) {
            if (OracleDAOUtil.getFactory().getContestTypeDAO().find(new Integer(contestTypeId))==null) {
                return new BasicResult(false, "Please choose a valid contest type.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}
