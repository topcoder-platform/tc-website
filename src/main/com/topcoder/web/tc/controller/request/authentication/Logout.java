package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.CoderSessionInfo;

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
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote)
                com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
        TCSubject user = pmgr.getUserSubject(getAuthentication().getActiveUser().getId());
        CoderSessionInfo ret = new CoderSessionInfo(request, getAuthentication(), user.getPrincipals());
        Navigation nav = new Navigation(request, ret);
        request.getSession(true).setAttribute("navigation", nav);
    }

}
