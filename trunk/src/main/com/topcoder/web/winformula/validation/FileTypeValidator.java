package com.topcoder.web.winformula.validation;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.winformula.dao.FileTypeDAO;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.model.WinformulaFileType;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 25, 2006
 */
public class FileTypeValidator implements Validator {


    public ValidationResult validate(ValidationInput input) {
        List l = (List) input.getInput();
        if (l == null || l.isEmpty()) {
            //it's ok, file types aren't required
            return ValidationResult.SUCCESS;
        }
        FileTypeDAO dao = WinformulaDAOUtil.getFactory().getFileTypeDAO();
        WinformulaFileType curr;
        for (Iterator it = l.iterator(); it.hasNext();) {
            curr = dao.find(new Integer((String) it.next()));
            if (curr == null) {
                return new BasicResult(false, "Please valid file types.");
            }
        }
        return ValidationResult.SUCCESS;
    }
}
