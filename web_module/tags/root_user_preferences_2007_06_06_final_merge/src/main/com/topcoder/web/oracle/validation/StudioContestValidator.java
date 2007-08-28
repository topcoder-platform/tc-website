package com.topcoder.web.oracle.validation;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.validation.*;
import com.topcoder.web.oracle.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class StudioContestValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        String studioContestId = (String)input.getInput();
        ValidationResult ret = new NonEmptyValidator("").validate(input);
        if (ret.isValid()) {
            ValidationResult r = new IntegerValidator("Please choose a valid contest.").validate(new StringInput(studioContestId));
            if (r.isValid()) {

                Request dr = new Request();
                dr.setContentHandle("oracle_admin_submission_list");
                dr.setProperty(Constants.CONTEST_ID, studioContestId);
                try {
                    ResultSetContainer rsc = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME).getData(dr).get("oracle_admin_submission_list");
                    if (rsc.isEmpty()) {
                        return new BasicResult(false, "Please choose a valid contest that has submissions.");
                    } else {
                        return ValidationResult.SUCCESS;
                    }
                } catch (Exception e) {
                    throw new RuntimeException(e);
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
