package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.CoderSessionInfo;

/**
 * Logs the user out of the long contest system
 *
 * @author farsight
 */
public class Logout extends Base {

    protected static final Logger log = Logger.getLogger(Logout.class);

    protected void longContestProcessing() throws TCWebException {

        TCRequest request = getRequest();

        // Logs the user out
        getAuthentication().logout();
        try {
            doLegacyWork(getRequest());
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        // Invalidates the session
        getRequest().getSession().invalidate();

        // Go to active contests page
        setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
        setIsNextPageInContext(false);
    }

    private void doLegacyWork(TCRequest request) throws Exception {
        TCSubject user = SecurityHelper.getUserSubject(getAuthentication()
                .getActiveUser().getId());
        CoderSessionInfo ret = new CoderSessionInfo(request,
                getAuthentication(), user.getPrincipals());
        Navigation nav = new Navigation(request, ret);
        request.getSession(true).setAttribute("navigation", nav);
    }
}
