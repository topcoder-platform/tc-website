package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 8:31:30 AM
 */
public class EditNote extends Base {
    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        String nId = getRequest().getParameter(Constants.NOTE_ID);

        try {

            Note note = (Note) createEJB(getInitialContext(), Note.class);
            User user = (User) createEJB(getInitialContext(), User.class);

            getRequest().setAttribute(Constants.HANDLE,
                    user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute(Constants.USER_ID, userId);

            if (!StringUtils.checkNull(nId).equals("")) {
                setDefault(Constants.NOTE_TEXT,
                        note.getText(Long.parseLong(nId), DBMS.OLTP_DATASOURCE_NAME));
                getRequest().setAttribute(Constants.NOTE_ID, nId);
            }

            setNextPage(Constants.NOTE_EDIT);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
