package com.topcoder.web.corp.controller.request;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseServlet;
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
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws TCWebException {
        try {
            getAuthentication().logout();
            String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
            log.debug("on successfull logout, going to " + dest);
            setNextPage(dest);
            setIsNextPageInContext(false);
            return;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}
