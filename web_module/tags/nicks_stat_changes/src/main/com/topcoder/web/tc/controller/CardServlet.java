package com.topcoder.web.tc.controller;

import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Resource;

/**
 * Date: Jan 16, 2004
 * @author dok
 */
public class CardServlet extends BaseServlet {

    private static Logger log = Logger.getLogger(CardServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

}
