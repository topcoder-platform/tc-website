package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
abstract class Base extends BaseProcessor {


    private User user = null;

    protected void businessProcessing() throws Exception {
        registrationProcessing();
    }

    protected User getRegUser() {
        if (user==null) {
            if (userLoggedIn()) {
                user = (User)getRequest().getSession().getAttribute(Constants.USER);
                if (user==null) {
                    user = new UserDAO().find(new Long(getUser().getId()));
                    log.debug("get user from the dao");
                } else {
                    log.debug("got user from request");
                }
            }
        } else {
            log.debug("got user from processor");
        }
        return user;
    }

    abstract protected void registrationProcessing() throws Exception;
}
