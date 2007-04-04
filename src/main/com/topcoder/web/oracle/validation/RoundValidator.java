package com.topcoder.web.oracle.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.oracle.dao.OracleDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class RoundValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        String roundId = (String)input.getInput();
        ValidationResult ret = new NonEmptyValidator("").validate(input);
        if (ret.isValid()) {
            ValidationResult r = new IntegerValidator("Please choose a valid round.").validate(new StringInput(roundId));
            if (r.isValid()) {
                if (OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(roundId))==null) {
                    return new BasicResult(false, "Please choose a valid round.");
                } else {
                    return ValidationResult.SUCCESS;
                }
            } else {
                return r;
            }
        } else {
            //it's ok for it to be empty
            return ValidationResult.SUCCESS;
        }
    }
}
