package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 22, 2005
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
            getRequest().getSession().invalidate();
            setNextPage(dest);
            setIsNextPageInContext(false);
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}


