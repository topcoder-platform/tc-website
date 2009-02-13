package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.model.CoderSessionInfo;

public class Logout extends Base {

    protected void businessProcessing() throws TCWebException {

        getAuthentication().logout();
        try {
            doLegacyCrap(getRequest());
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        getRequest().getSession().invalidate();
        setNextPage(StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY)));
        setIsNextPageInContext(false);
    }

    private void doLegacyCrap(TCRequest request) throws Exception {
        TCSubject user = SecurityHelper.getUserSubject(getAuthentication().getActiveUser().getId());
        CoderSessionInfo ret = new CoderSessionInfo(request, getAuthentication(), user.getPrincipals());
        Navigation nav = new Navigation(request, ret);
        request.getSession(true).setAttribute("navigation", nav);
    }

}
