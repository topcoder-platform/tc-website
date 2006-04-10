package com.topcoder.web.reg.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class RegServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(RegServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

}
