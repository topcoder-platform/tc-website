package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Selection extends Base {

    protected void registrationProcessing() throws Exception {

        //if the user is logged in, figure out what registration types they have
        //so that the check boxes can be populated.

        if (userIdentified()) {
            //they must be attempting to update their profile, but are not logged in
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else if (userLoggedIn()) {
            //they're updating their info, and they're logged in, so here we go
            getRequest().setAttribute("registrationTypeList", new RegistrationTypeDAO().getRegistrationTypes());
            RegistrationType rt;
            for (Iterator it = new UserDAO().find(new Long(getUser().getId())).getRegistrationTypes().iterator(); it.hasNext();) {
                rt = (RegistrationType)it.next();
                setDefault(Constants.REGISTRATION_TYPE+rt.getId(), String.valueOf(true));
            }

            setNextPage("/selection.jsp");
            setIsNextPageInContext(true);
        } else {
            //they must be attempting to register
            getRequest().setAttribute("registrationTypeList", new RegistrationTypeDAO().getRegistrationTypes());
            setNextPage("/selection.jsp");
            setIsNextPageInContext(true);
        }
    }

}
