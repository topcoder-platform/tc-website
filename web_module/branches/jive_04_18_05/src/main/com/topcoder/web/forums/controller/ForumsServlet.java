/*
 * Created on Apr 27, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.security.TCSubject;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.MissingResourceException;
import java.util.Set;

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
