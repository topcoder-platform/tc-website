package com.topcoder.web.csf.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Prize;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class PlaceValidator implements Validator {
    private Contest contest;

    public PlaceValidator(Contest contest) {
        this.contest = contest;
    }

    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator("Please enter the value for the prize place.").validate(input);
        if (ret.isValid()) {
            Integer place = null;
            try {
                place = new Integer((String) input.getInput());
            } catch (NumberFormatException e) {
                return new BasicResult(false, "Please enter a valid prize place.");
            }
            Prize curr;
            for (Iterator it = contest.getPrizes().iterator(); it.hasNext();) {
                curr = (Prize) it.next();
                if (curr.getPlace().equals(place)) {
                    return new BasicResult(false, "Invalid place, the contest already has a prize for place " + place);
                }
            }
            return ValidationResult.SUCCESS;
        } else {
            return ret;
        }
    }
}
