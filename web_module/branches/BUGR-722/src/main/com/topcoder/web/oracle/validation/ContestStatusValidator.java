package com.topcoder.web.oracle.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.oracle.dao.OracleDAOUtil;

/**
 * @author dok
 * @version $Revision: 59566 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class ContestStatusValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        String contestStatusId = (String)input.getInput();
        ValidationResult ret = new NonEmptyValidator("Please choose a valid contest status.").validate(input);
        if (ret.isValid()) {
            if (OracleDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId))==null) {
                return new BasicResult(false, "Please choose a valid contest status.");
            } else {
                return ValidationResult.SUCCESS;
            }
        } else {
            return ret;
        }
    }
}
