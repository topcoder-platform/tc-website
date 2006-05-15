package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.reg.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Submit extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();
        if ((getRegUser() != null && u.isNew()) || userLoggedIn()) {
            //todo check if the handle is taken again

            getFactory().getUserDAO().saveOrUpdate(u);

            setNextPage("/success.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
