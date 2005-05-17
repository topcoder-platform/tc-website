/*
 * Created on Apr 27, 2005
 */
package com.topcoder.web.forums.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.model.CoderSessionInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

/**
 * @author mtong
 */
public class ForumsServlet extends BaseServlet {
	private final static Logger log = Logger.getLogger(ForumsServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected TCSubject getUser(long id) throws Exception {
        // pull from Jive token, or create from user information?
    	// where are Jive exceptions thrown if permission is not allowed?
    	// Yarin = 269554
    	return new TCSubject(144400);
    }

    protected SessionInfo createSessionInfo(TCRequest request,
            WebAuthentication auth, Set groups) throws Exception {
		CoderSessionInfo ret = null;
		ret = new CoderSessionInfo(request, auth, groups);
		return ret;
	}
}
