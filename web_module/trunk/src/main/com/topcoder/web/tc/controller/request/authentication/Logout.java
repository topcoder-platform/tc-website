package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.TCSubject;
import com.topcoder.common.web.data.Navigation;

import javax.servlet.http.HttpServletRequest;

public class Logout extends Base{

    protected void businessProcessing() throws TCWebException {

        getAuthentication().logout();
        try {
            doLegacyCrap(getRequest());
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        setNextPage("/");
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
