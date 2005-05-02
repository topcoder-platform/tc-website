/*
 * Created on Apr 27, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.security.TCSubject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ForumsServlet extends BaseServlet {
	private final static Logger log = Logger.getLogger(ForumsServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }


    /**
     * todo Temp hack, implement this with something meaningful or change the base to improve this dependency
     * @param id
     * @return
     * @throws Exception
     */
    protected TCSubject getUser(long id) throws Exception {
        return new TCSubject(132456);
    }


}
