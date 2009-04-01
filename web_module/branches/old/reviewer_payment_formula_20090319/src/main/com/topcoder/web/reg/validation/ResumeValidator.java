package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class ResumeValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        byte[] file;
        String fileType;
        String fileName;

        file = (byte[]) ((List) input.getInput()).get(0);
        fileType = (String) ((List) input.getInput()).get(1);
        fileName = (String) ((List) input.getInput()).get(2);

        if (file == null) {
            return ValidationResult.SUCCESS;
        } else {
            if (file.length == 0) {
                return new BasicResult(false, "Please choose a non empty file.");
            }
            if (DAOUtil.getFactory().getFileTypeDAO().find(fileType) == null) {
                return new BasicResult(false, "Couldn't recognize the specified file type.");
            } else {
                StringInput fInput = new StringInput(fileName);
                ValidationResult ret = new NonEmptyValidator("Please choose a valid file name.").validate(fInput);
                if (ret.isValid()) {
                    return new SizeValidator(1, Constants.MAX_FILE_NAME_LENGTH, "file name").validate(fInput);
                } else {
                    return ret;
                }
            }
        }
    }
}