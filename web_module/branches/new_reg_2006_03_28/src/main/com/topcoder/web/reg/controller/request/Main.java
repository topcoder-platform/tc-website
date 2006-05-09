package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

import java.util.List;
import java.util.HashSet;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Main extends Base {

    protected void registrationProcessing() throws Exception {
        if (userLoggedIn()) {
            List types = new RegistrationTypeDAO().getRegistrationTypes();

            RegistrationType rt;
            HashSet requestedTypes = new HashSet();
            for (Iterator it = types.iterator(); it.hasNext();) {
                rt = (RegistrationType)it.next();
                if ("on".equals(getRequest().getParameter(Constants.REGISTRATION_TYPE + rt.getId()))) {
                    requestedTypes.add(rt);
                }
            }

            if (requestedTypes.isEmpty()) {
                //error message, back to selection page
                addError(Constants.REGISTRATION_TYPE, "You have not selected to register for any aspect of TopCoder.");
                setNextPage("/selection.jsp");
                setIsNextPageInContext(true);
            } else {
                //todo if they are attempting to register for high school, and they are not eligible,
                  //todo give them a message saying they are not eligible to register for highschool
                getRequest().setAttribute(Constants.FIELDS, RegFieldHelper.getMainFieldSet(requestedTypes, getRegUser()));
                setNextPage("/main.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
