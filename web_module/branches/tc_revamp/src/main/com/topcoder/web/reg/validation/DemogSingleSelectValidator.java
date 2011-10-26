package com.topcoder.web.reg.validation;

import com.topcoder.web.common.model.DemographicAnswer;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.validation.*;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogSingleSelectValidator implements Validator {

    private DemographicQuestion q;
    private boolean isRequired;

    public DemogSingleSelectValidator(DemographicQuestion q, boolean isRequired) {
        this.q = q;
        this.isRequired = isRequired;
    }

    public ValidationResult validate(ValidationInput input) {

        ValidationResult eret = new NonEmptyValidator("Please respond to this question.").validate(input);

        if (!isRequired && !eret.isValid()) {
            return ValidationResult.SUCCESS;
        }

        Long answerId;
        try {
            answerId = new Long((String) input.getInput());
        } catch (NumberFormatException e) {
            return new BasicResult(false, "Please choose a valid answer.");
        }


        boolean found = false;
        for (Iterator it = q.getAnswers().iterator(); it.hasNext() & !found;) {
            if (((DemographicAnswer) it.next()).getId().equals(answerId)) {
                found = true;
            }
        }
        if (!found) {
            return new BasicResult(false, "Please choose a valid answer.");
        } else {
            return ValidationResult.SUCCESS;
        }


    }
}