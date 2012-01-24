package com.topcoder.web.reg.validation;

import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.validation.*;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogMultiSelectValidator implements Validator {

    private DemographicQuestion q;
    private boolean isRequired;

    public DemogMultiSelectValidator(DemographicQuestion q, boolean isRequired) {
        this.q = q;
        this.isRequired = isRequired;
    }

    public ValidationResult validate(ValidationInput input) {
        List l = (List) input.getInput();
        if (l == null || l.isEmpty()) {
            if (isRequired) {
                new BasicResult(false, "Please make a selection.");
            } else {
                return ValidationResult.SUCCESS;
            }
        }
        ValidationResult r;
        for (Iterator it = l.iterator(); it.hasNext();) {
            r = new DemogSingleSelectValidator(q, isRequired).validate(new StringInput((String) it.next()));
            if (!r.isValid()) {
                return r;
            }
        }
        return ValidationResult.SUCCESS;
    }
}