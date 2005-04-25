package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.common.NavigationException;

/**
 * @author  rfairfax
 */
public class TimeExpired extends Base {

    protected void techAssessProcessing() throws Exception {
        if (hasParameter(Constants.LOGOUT)) {
            boolean logout = Boolean.valueOf(getRequest().getParameter(Constants.LOGOUT).trim()).booleanValue();
            
            if(logout) {
                getAuthentication().logout();
                getRequest().getSession().invalidate();
            }
        } 

        String message;
        if (hasParameter(Constants.MESSAGE)) {
            message = getRequest().getParameter(Constants.MESSAGE).trim();
        } else {
            throw new NavigationException("Invalid Request, missing parameter");
        }

        throw new NavigationException(message);
    }

}
