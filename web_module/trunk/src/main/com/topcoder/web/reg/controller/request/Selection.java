package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;

import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Selection extends Base {

    protected void registrationProcessing() throws Exception {

        boolean newReg = !userLoggedIn();
        if (!userLoggedIn() && getRequest().getParameter(Constants.NEW_REG) != null) {
            newReg = String.valueOf(true).equalsIgnoreCase(getRequest().getParameter(Constants.NEW_REG));
        }
        setNewRegistration(newReg);

        //set up the user object we're gonna use
        User u = getRegUser();
        if (u == null) {
            u = new User();
            setRegUser(u);
        }


        log.debug("new reg " + newReg);
        if (newReg) {
            getRequest().setAttribute("registrationTypeList", getFactory().getRegistrationTypeDAO().getRegistrationTypes());
            setNextPage("/selection.jsp");
            setIsNextPageInContext(true);
        } else {
            if (userLoggedIn()) {
                //they're updating their info, and they're logged in, so here we go
                getRequest().setAttribute("registrationTypeList", getFactory().getRegistrationTypeDAO().getRegistrationTypes());
                RegistrationType rt;
                for (Iterator it = new UserDAOHibernate().find(new Long(getUser().getId())).getRegistrationTypes().iterator(); it.hasNext();)
                {
                    rt = (RegistrationType) it.next();
                    setDefault(Constants.REGISTRATION_TYPE + rt.getId(), String.valueOf(true));
                }
                setNextPage("/selection.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        }
    }

}