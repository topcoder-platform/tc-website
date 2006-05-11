package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.dao.hibernate.UserDAOHibernate;
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

        boolean newReg = String.valueOf(true).equalsIgnoreCase(getRequest().getParameter(Constants.NEW_REG));

        log.debug("new reg " + newReg);
        if (newReg) {
            getRequest().setAttribute("registrationTypeList", new com.topcoder.web.reg.dao.hibernate.RegistrationTypeDAOHibernate().getRegistrationTypes());
            setNextPage("/selection.jsp");
            setIsNextPageInContext(true);
        } else {
            if (userLoggedIn()) {
                //they're updating their info, and they're logged in, so here we go
                getRequest().setAttribute("registrationTypeList", new com.topcoder.web.reg.dao.hibernate.RegistrationTypeDAOHibernate().getRegistrationTypes());
                RegistrationType rt;
                for (Iterator it = new UserDAOHibernate().find(new Long(getUser().getId())).getRegistrationTypes().iterator(); it.hasNext();) {
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
