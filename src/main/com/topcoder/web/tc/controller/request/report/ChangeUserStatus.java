/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * <p>A controller to be used for servicing requests for viewing the form of changing the status of desired user.</p>
 * 
 * @author frozenfx
 * @version 1.0
 */
public class ChangeUserStatus extends Base {

    /**
     * <p>Constructs new <code>ChangeUserStatus</code> instance. This implementation does nothing.</p>
     */
    public ChangeUserStatus() {
    }

    /**
     * <p>Processes the incoming request.</p>
     * 
     * @throws TCWebException if an unexpected error occurs.
     */
    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        try {
            User user = (User) createEJB(getInitialContext(), User.class);

            getRequest().setAttribute(Constants.HANDLE,
                                      user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute(Constants.GIVEN_NAME,
                                      user.getFirstName(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute(Constants.SURNAME,
                                      user.getLastName(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.USER_ID, userId);
            if (!hasErrors()) {
                getRequest().setAttribute(Constants.OLD_STATUS_SELECT_VALUE, 
                        String.valueOf(user.getStatus(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME)));
            }

            // Forward to JSP
            setNextPage(Constants.USER_STATUS_CHANGE);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
