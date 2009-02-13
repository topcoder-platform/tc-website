package com.topcoder.web.corp.request;

import com.topcoder.web.corp.Util;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.util.logging.Logger;

/**
 * class to process a log out request.  should simply be a call to an
 * authentication object logout().
 *
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Logout extends BaseProcessor {
    private final static Logger log = Logger.getLogger(Logout.class);

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        authToken.logout();
        String dest = StringUtils.checkNull(request.getParameter(Login.KEY_DESTINATION_PAGE));
        log.debug("on successfull logout, going to " + dest);
        setNextPage(dest);
        setIsNextPageInContext(false);
        return;
    }
}
