package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.reg.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Submit extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();
        if (getRegUser() == null) {
            throw new NavigationException("Sorry, your session has timed out.");
        } else if (u.isNew() || userLoggedIn()) {
            //todo check if the handle is taken again
            //todo send activation email

            getRequest().setAttribute(END_OF_CONVERSATION_FLAG, String.valueOf(true));

            getFactory().getUserDAO().saveOrUpdate(u);

            clearSession();

            setNextPage("/success.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
