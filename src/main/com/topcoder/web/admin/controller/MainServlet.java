package com.topcoder.web.admin.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.security.Resource;


public class MainServlet extends BaseServlet {


    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return createAuthorization(auth.getUser()).hasPermission(r);
    }


}
