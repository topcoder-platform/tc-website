package com.topcoder.web.tc.controller.request.report;

import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 8:25:57 AM
 */
public class ViewNotes extends Base {

    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));

        try {
            if (StringUtils.checkNull(userId).equals("")) {
                throw new NavigationException("Request missing user id");
            } else {
                Request r = new Request();
                r.setContentHandle("note_list");
                r.setProperty(String.valueOf(Constants.USER_ID), userId);

                DataAccessInt dai = getDataAccess();
                getRequest().setAttribute("note_list", dai.getData(r).get("note_list"));
                User user = (User)createEJB(getInitialContext(), User.class);
                getRequest().setAttribute(Constants.HANDLE, user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));

                setNextPage(Constants.NOTE_LIST);
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
