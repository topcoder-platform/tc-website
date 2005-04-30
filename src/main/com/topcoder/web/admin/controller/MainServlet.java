package com.topcoder.web.admin.controller;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.ClassResource;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;


public class MainServlet extends BaseServlet {
    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return createAuthorization(auth.getActiveUser()).hasPermission(new ClassResource(this.getClass()));
    }




}
