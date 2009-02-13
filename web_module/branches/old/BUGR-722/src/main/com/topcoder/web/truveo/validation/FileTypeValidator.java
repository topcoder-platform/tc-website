package com.topcoder.web.truveo.validation;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.truveo.dao.FileTypeDAO;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.model.TruveoFileType;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 25, 2006
 */
public class FileTypeValidator implements Validator {


    public ValidationResult validate(ValidationInput input) {
        List l = (List) input.getInput();
        if (l == null || l.isEmpty()) {
            //it's ok, file types aren't required
            return ValidationResult.SUCCESS;
        }
        FileTypeDAO dao = TruveoDAOUtil.getFactory().getFileTypeDAO();
        TruveoFileType curr;
        for (Iterator it = l.iterator(); it.hasNext();) {
            curr = dao.find(new Integer((String) it.next()));
            if (curr == null) {
                return new BasicResult(false, "Please valid file types.");
            }
        }
        return ValidationResult.SUCCESS;
    }
}
