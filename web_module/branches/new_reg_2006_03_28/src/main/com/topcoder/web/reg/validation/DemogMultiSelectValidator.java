package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.model.DemographicQuestion;

import java.util.List;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 14, 2006
 */
public class DemogMultiSelectValidator implements Validator {

    private DemographicQuestion q;

    public DemogMultiSelectValidator(DemographicQuestion q) {
        this.q = q;
    }

    public ValidationResult validate(ValidationInput input) {
        List l = (List) input.getInput();
        ValidationResult r;
        for (Iterator it = l.iterator(); it.hasNext();) {
            r = new DemogSingleSelectValidator(q).validate(new StringInput((String)it.next()));
            if (!r.isValid()) {
                return r;
            }
        }
        return ValidationResult.SUCCESS;
    }
}
