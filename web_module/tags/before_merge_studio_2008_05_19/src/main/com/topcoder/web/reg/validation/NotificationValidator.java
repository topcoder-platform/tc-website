package com.topcoder.web.reg.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.NotificationDAO;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class NotificationValidator implements Validator {

    public ValidationResult validate(ValidationInput input) {
        List l = (List) input.getInput();
        NotificationDAO nDAO = DAOUtil.getFactory().getNotificationDAO();
        Notification n;
        for (Iterator it = l.iterator(); it.hasNext();) {
            n = (Notification) it.next();
            if (nDAO.find(n.getId()) == null) {
                //clearly this is highly unlikely to happen since if we're given a notification object
                //it's probably valid, but we'll go through the motions anyway
                return new BasicResult(false, "Please choose valid notifications.");
            }
        }
        return ValidationResult.SUCCESS;
    }
}