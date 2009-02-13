package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SiteTest;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.shared.util.ApplicationServer;

public class Logout extends Base {

    protected void businessProcessing() throws TCWebException {

        SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        getAuthentication().logout();
        try {
            doLegacyCrap(getRequest());
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        getRequest().getSession().invalidate();

        String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
        if (dest.equals("")) {
            dest = "http://" + info.getServerName() + "/tc";
        }
        
        String forumsURL = "http://"+ApplicationServer.FORUMS_SERVER_NAME;
        SiteTest siteTest = new SiteTest();
        boolean forumsServerActive = siteTest.check(forumsURL);
        if (forumsServerActive) {
            StringBuffer nextPage = new StringBuffer(forumsURL).append("/?module=Logout");
            nextPage.append("&").append(BaseServlet.NEXT_PAGE_KEY).append("=").append(dest);
            setNextPage(nextPage.toString());
        } else {
            if (dest.startsWith(forumsURL)) {
                dest = "http://"+ApplicationServer.SERVER_NAME+"/tc";
            }
            setNextPage(dest);
        }
        setIsNextPageInContext(false);
    }

    private void doLegacyCrap(TCRequest request) throws Exception {
        TCSubject user = SecurityHelper.getUserSubject(getAuthentication().getActiveUser().getId());
        CoderSessionInfo ret = new CoderSessionInfo(request, getAuthentication(), user.getPrincipals());
        Navigation nav = new Navigation(request, ret);
        request.getSession(true).setAttribute("navigation", nav);
    }

}
